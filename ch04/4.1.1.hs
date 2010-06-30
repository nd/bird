make_pairs :: [Char] -> [Bool] -> [(Char, Bool)]
make_pairs [] [] = []
make_pairs (a:as) (b:bs) = (a,b):(make_pairs as bs)

--make_pairs "" [] - first argument is empty list of Char and the second is empty list of Bool