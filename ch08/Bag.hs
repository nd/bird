module Bag (Bag, mkBag, isEmpty, union, minBag, delMin) where

data Htree a = Null | Fork Int a (Htree a) (Htree a)
               deriving (Show)

type Bag a = Htree a

fork :: a -> Htree a -> Htree a -> Htree a
fork x yt zt = if m < n then Fork p x zt yt else Fork p x yt zt
    where m = size yt
          n = size zt
          p = m + n + 1

size :: Htree a -> Int
size Null             = 0
size (Fork n x yt zt) = n

isEmpty :: Htree a -> Bool
isEmpty Null             = True
isEmpty (Fork n x yt zt) = False

minBag :: Htree a -> a
minBag (Fork n x yt zt) = x

delMin :: (Ord a) => Htree a -> Htree a
delMin (Fork n x yt zt) = union yt zt

union :: (Ord a) => Htree a -> Htree a -> Htree a
union Null yt               = yt
union (Fork m u vt wt) Null = Fork m u vt wt
union (Fork m u vt wt) (Fork n x yt zt) 
    | (u <= x) = fork u vt (union wt (Fork n x yt zt))
    | (x < u) = fork x yt (union (Fork m u vt wt) zt)

mkBag :: (Ord a) => [a] -> Htree a
mkBag xs = fst (mkTwo (length xs) xs)

mkTwo :: (Ord a) => Int -> [a] -> (Htree a, [a])
mkTwo n xs 
    | (n == 0) = (Null, xs)
    | (n == 1) = (fork (head xs) Null Null, tail xs)
    | otherwise = (union xt yt, zs)
    where (xt, ys) = mkTwo m xs
          (yt, zs) = mkTwo (n - m) ys
          m        = n `div` 2

--sortBag :: (Ord a) => Bag a -> [a]
--sortBag b 
--    | isEmpty b = []
--    | otherwise = (minBag b) : (sortBag (delMin b))
