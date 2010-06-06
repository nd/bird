type Cbool a = a -> a -> a
type Cnum a  =  (a -> a) -> a -> a

ctrue, cfalse :: Cbool a
ctrue  x y = x
cfalse x y = y

isZero :: Cnum (Cbool a) -> Cbool a
isZero cn = cn f ctrue
    where f x = cfalse

-- I don't know how to define isZero of type Cnum a -> Cbool a