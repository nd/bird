deleteMin :: (Ord a) => [a] -> [a]
deleteMin = tail . sort

sort :: (Ord a) => [a] -> [a]
sort (x:xs) = [y | y <- xs, y < x] ++ [x] ++ [z | z <- xs, z >= x]