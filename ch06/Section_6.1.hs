data Btree a = Leaf a | Fork (Btree a) (Btree a)

size :: Btree a -> Int
size (Leaf x)     = 1
size (Fork xt yt) = size xt + size yt

flatten :: Btree a -> [a]
flatten (Leaf a)     = [a]
flatten (Fork xt yt) = flatten xt ++ flatten yt

nodes :: Btree a -> Int
nodes (Leaf x)     = 0
nodes (Fork xt yt) = 1 + nodes xt + nodes yt

height :: Btree x -> Int
height (Leaf x)     = 0
height (Fork xt yt) = 1 + (height xt `max` height yt)

depths :: Btree x -> Btree Int
depths = down 0

down :: Int -> Btree x -> Btree Int
down n (Leaf x)     = Leaf n
down n (Fork xt yt) = Fork (down (n + 1) xt) (down (n + 1) yt)

maxBtree :: (Ord a) => Btree a -> a
maxBtree (Leaf x)     = x
maxBtree (Fork xt yt) = (maxBtree xt) `max` (maxBtree yt)

mkBtree :: [a] -> Btree a
mkBtree xs
    | (m == 0) = Leaf (unwrap xs)
    | otherwise = Fork (mkBtree ys) (mkBtree zs)
    where m          = (length xs) `div` 2
          (ys, zs)   = splitAt m xs
          unwrap [x] = x

mapBtree :: (a -> b) -> Btree a -> Btree b
mapBtree f (Leaf x)     = Leaf (f x)
mapBtree f (Fork xt yt) = Fork (mapBtree f xt) (mapBtree f yt)

foldBtree :: (a -> b) -> (b -> b -> b) -> Btree a -> b
foldBtree f g (Leaf x)     = f x
foldBtree f g (Fork xt yt) = g (foldBtree f g xt) (foldBtree f g yt)

type Dlist a = [a] -> [a]

dlist [a] = ([a] ++)
dconcat = (.)

toList :: Dlist a -> [a]
toList x = x []

dflatten :: Btree a -> [a]
dflatten = toList . dflatten'

dflatten' :: Btree a -> Dlist a
dflatten' (Leaf a)     = dlist [a]
dflatten' (Fork xt yt) = dconcat (dflatten' xt) (dflatten' yt)


data Atree a = ALeaf a | AFork Int (Atree a) (Atree a)

fork :: Atree a -> Atree a -> Atree a
fork xt yt = AFork (lsize xt) xt yt

lsize :: Atree a -> Int
lsize (ALeaf x)       = 1
lsize (AFork n xt yt) = n + lsize yt
             
mkAtree :: [a] -> Atree a
mkAtree xs
    | (m == 0) = ALeaf (unwrap xs)
    | otherwise = fork (mkAtree ys) (mkAtree zs)
    where m          = (length xs) `div` 2
          (ys, zs)   = splitAt m xs
          unwrap [x] = x

retrieve :: Atree a -> Int -> a
retrieve (ALeaf x) 0 = x
retrieve (AFork m xt yt) k = if k<m then retrieve xt k else retrieve yt (k - m)