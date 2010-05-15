-- 16 equations:

data Triangle = Failure | Isosceles | Equilateral | Scalene

instance Eq Triangle

instance Ord Triangle where
    Failure < Failure     = False
    Failure < Isosceles   = True
    Failure < Equilateral = True
    Failure < Scalene     = True

    Isosceles < Failure     = False
    Isosceles < Isosceles   = False
    Isosceles < Equilateral = True
    Isosceles < Scalene     = True

    Equilateral < Failure     = False
    Equilateral < Isosceles   = False
    Equilateral < Equilateral = False
    Equilateral < Scalene     = True

    Scalene < Failure     = False
    Scalene < Isosceles   = False
    Scalene < Equilateral = False
    Scalene < Scalene     = False
