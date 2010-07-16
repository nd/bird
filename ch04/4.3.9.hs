pairs :: Int -> [(Int, Int)]
pairs n = [(x, y) | x <- [1..], y <- [x..n]]