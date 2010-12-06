hamming' a b c = 1:merge (map (a*) (hamming' a b c))
                 (merge (map (b*) (hamming' a b c))
                        (map (c*) (hamming' a b c)))

merge :: [Integer] -> [Integer] -> [Integer]
merge (x:xs) (y:ys)
    | x < y = x:merge xs (y:ys)
    | x == y = x:merge xs ys
    | x > y = y:merge (x:xs) ys


hamming'' a b c = 1:merge (map (a*) y)
                 (merge (map (b*) y)
                        (map (c*) y))
    where y = hamming'' a b c