instance (Ord a) => Ord [a] where
[] < []         == false
[] < [a:as]     == true
[a:as] < []     == false
(a:as) < (b:bs) == a < b || as < bs