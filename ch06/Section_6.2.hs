data (Ord a) => Stree a = Null | Fork (Stree a) a (Stree a)
                         deriving (Show)

flatten :: (Ord a) => Stree a -> [a]
flatten Null           = []
flatten (Fork xt x yt) = flatten xt ++ [x] ++ flatten yt

member :: (Ord a) => a -> Stree a -> Bool
member x Null = False
member x (Fork xt y yt)
    | (x < y) = member x xt
    | (x == y) = True
    | (x > y) = member x yt

height :: (Ord a) => Stree a -> Int
height Null           = 0
height (Fork xt x yt) = 1 + (height xt `max` height yt)

mkStree :: (Ord a) => [a] -> Stree a
mkStree []     = Null
mkStree (x:xs) = Fork (mkStree ys) x (mkStree zs)
    where (ys, zs) = partition (<= x) xs

partition :: (a -> Bool) -> [a] -> ([a], [a])
partition p xs = (filter p xs, filter (not . p) xs)

sort :: (Ord a) => [a] -> [a]
sort = flatten . mkStree

-- ex. 6.2.2
mapStree :: (Ord a) => (Ord b) => (a -> b) -> Stree a -> Stree b
mapStree f Null = Null
mapStree f (Fork xt x yt) = Fork (mapStree f xt) (f x) (mapStree f yt)

-- ex. 6.2.3
foldStree :: (Ord a) => (a -> b) -> (b -> b -> b -> b) -> b -> Stree a -> b
foldStree f g e Null           = e
foldStree f g e (Fork xt x yt) = g (foldStree f g e xt) (f x) (foldStree f g e yt)

insert :: (Ord a) => a -> Stree a -> Stree a
insert x Null = Fork Null x Null
insert x (Fork xt y yt) 
    | (x < y) = Fork (insert x xt) y yt
    | (x == y) = Fork xt y yt
    | (x > y) = Fork xt y (insert x yt)

delete :: (Ord a) => a -> Stree a -> Stree a
delete x Null = Null
delete x (Fork xt y yt) 
    | (x < y) = Fork (delete x xt) y yt
    | (x == y) = join xt yt
    | (x > y) = Fork xt y (delete x yt)

join :: (Ord a) => Stree a -> Stree a -> Stree a
join xt yt = if empty yt then xt else Fork xt head tail
             where (head, tail) = splitTree yt

empty :: (Ord a) => Stree a -> Bool
empty Null           = True
empty (Fork xt x yt) = False

splitTree :: (Ord a) => Stree a -> (a, Stree a)
splitTree (Fork xt y yt) = if empty xt then (y, yt) else (x, Fork wt y yt)
    where (x, wt) = splitTree xt