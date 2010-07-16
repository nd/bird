quadruples :: Int -> [(Int, Int, Int, Int)]
quadruples n = [(a, b, c, d) | a <- [1..n], b <- [a..n], c <- [1..n], d <- [c..n], square a + square b == square c + square d]

square :: Int -> Int
square a = a * a

-- I'm not quite sure what 'distinct' quadruples means.  I suppose it
-- is quadruples of form (a, b, c, d) and (b, a, d, c) are not
-- distinct