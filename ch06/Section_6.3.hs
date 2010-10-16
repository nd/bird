data (Ord a) => Htree a = Null | Fork a (Htree a) (Htree a)
                         deriving (Show)

flatten :: (Ord a) => Htree a -> [a]
flatten Null = []
flatten (Fork x xt yt) = x : merge (flatten xt) (flatten yt)

merge :: (Ord a) => [a] -> [a] -> [a]
merge [] ys         = ys
merge (x:xs) []     = x:xs
merge (x:xs) (y:ys) = if x <= y then x:merge xs (y:ys) else y:merge (x:xs) ys

--mkHeap :: (Ord a) => [a] -> Htree a
--mkHeap = heapify . mkHtree

heapify :: (Ord a) => Htree a -> Htree a
heapify Null           = Null
heapify (Fork x xt yt) = sift x (heapify xt) (heapify yt)

sift :: (Ord a) => a -> Htree a -> Htree a -> Htree a
sift x Null Null         = Fork x Null Null
sift x (Fork y a b) Null = if x <= y then Fork x (Fork y a b) Null else Fork y (sift x a b) Null
sift x Null (Fork z c d) = if x <= z then Fork x Null (Fork z c d) else Fork z Null (sift x c d)
sift x (Fork y a b) (Fork z c d)
    | x <= (y `min` z) = Fork x (Fork y a b) (Fork z c d)
    | y <= (x `min` z) = Fork y (sift x a b) (Fork z c d)
    | z <= (x `min` y) = Fork z (Fork y a b) (sift x c d)

-- ex. 6.3.1
levels :: [a] -> [[a]]
levels = levelsWith 1

levelsWith :: Int -> [a] -> [[a]]
levelsWith level xs = if (length zs) == 0 
                      then [ys]
                      else [ys] ++ (levelsWith (2 * level) zs)
    where (ys, zs) = splitAt level xs

-- ex. 6.3.2
mkHtrees :: (Ord a) => [[a]] -> [Htree a]
mkHtrees = foldr addLayer [Null]

addLayer :: (Ord a) => [a] -> [Htree a] -> [Htree a]
addLayer [] xts             = []
addLayer (x:xs) (xt:yt:yts) = (Fork x xt yt) : (addLayer xs (yt:yts))
addLayer (x:xs) (xt:[])     = (Fork x xt Null) : (addLayer xs [])
addLayer (x:xs) []          = (Fork x Null Null) : (addLayer xs [])
