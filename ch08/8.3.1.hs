module Set (empty, isEmpty, member, insert, delete, union, meet, minus) where

newtype (Ord a) => Set a = MkSet [a]
    deriving (Show)

empty :: (Ord a) => Set a
empty = MkSet []

isEmpty :: (Ord a) => Set a -> Bool
isEmpty (MkSet [])     = True
isEmpty (MkSet (x:xs)) = False

member :: (Ord a) => Set a -> a -> Bool
member (MkSet xs) x = if null ys then False else (x == head ys)
    where ys = dropWhile (< x) xs

insert :: (Ord a) => a -> Set a -> Set a
insert x (MkSet xs) = MkSet (ys ++ [x] ++ (filter (/= x) zs))
    where (ys, zs) = span (< x) xs

delete :: (Ord a) => a -> Set a -> Set a
delete x (MkSet xs) = MkSet (delete' x xs)

delete' :: (Ord a) => a -> [a] -> [a]
delete' x [] = []
delete' x (y:ys)
    | (x < y) = y:ys
    | (x == y) = ys
    | (x > y) = y:(delete' x ys)

union :: (Ord a) => Set a -> Set a -> Set a
union (MkSet xs) (MkSet ys) = MkSet (union' xs ys)

union' :: (Ord a) => [a] -> [a] -> [a]
union' [] ys     = ys
union' (x:xs) [] = x:xs
union' (x:xs) (y:ys) 
    | (x < y) = x:union' xs (y:ys)
    | (x == y) = x:union' xs ys
    | (x > y) = y:union' (x:xs) ys

meet :: (Ord a) => Set a -> Set a -> Set a
meet (MkSet xs) (MkSet ys) = MkSet (meet' xs ys)

meet' :: (Ord a) => [a] -> [a] -> [a]
meet' [] ys     = []
meet' (x:xs) [] = []
meet' (x:xs) (y:ys) 
    | (x < y) = meet' xs (y:ys)
    | (x == y) = x:(meet' xs ys)
    | (x > y) = meet' (x:xs) ys

minus :: (Ord a) => Set a -> Set a -> Set a
minus (MkSet xs) (MkSet ys) = MkSet (minus' xs ys)

minus' :: (Ord a) => [a] -> [a] -> [a]
minus' [] ys     = []
minus' (x:xs) [] = x:xs
minus' (x:xs) (y:ys) 
    | (x < y) = x:(minus' xs (y:ys))
    | (x == y) = minus' xs ys
    | (x > y) = x:(minus' xs ys)

