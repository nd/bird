sort3 :: (Int, Int, Int) -> (Int, Int, Int)
sort3 (x, y, z)
    | x < y && y < z = (x, y, z)
    | x < y && z < y = (x, z, y)
    | y < x && x < z = (y, x, z)
    | y < x && z < x = (y, z, x)
    | z < x && x < y = (z, x, y)
    | z < x && y < x = (z, y, x)
    | otherwise     = (x, y, z)

data Triangle = Failure | Isosceles | Equilateral | Scalene
              deriving (Show)

analyze :: (Int, Int, Int) -> Triangle
analyze (x, y, z)
    | x + y <= z         = Failure
    | (x == y) && (y == z) = Equilateral
    | ((x == y) && (x /= z)) || ((x == z) && (x /= y)) || ((y == z) && (y /= x)) = Isosceles
    | otherwise         = Scalene

analyze' :: (Int, Int, Int) -> Triangle
analyze' (x, y, z) = analyze(sort3(x, y, z))

                      