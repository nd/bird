pairs :: Int -> [(Int, Int)]
pairs n = [(x, y) | x <- [1..n], y <- [x..n]]