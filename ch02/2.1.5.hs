data Triangle = Failure | Isosceles | Equilateral | Scalene
              deriving (Show)

analyze :: (Int, Int, Int) -> Triangle
analyze (x, y, z)
    | x + y <= z         = Failure
    | (x == y) && (y == z) = Equilateral
    | ((x == y) && (x /= z)) || ((x == z) && (x /= y)) || ((y == z) && (y /= x)) = Isosceles
    | otherwise         = Scalene