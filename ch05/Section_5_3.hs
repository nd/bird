newtype ArbInt = Norm [Digit]
type Digit     = Int

digits :: ArbInt -> [Digit]
digits (Norm xs) = xs

base, baseSize :: Int
base     = 10000
baseSize = 4

type Carry = Int
carry :: Digit -> (Carry, [Digit]) -> (Carry, [Digit])
carry x (c, xs) = ((x + c) `div` base, (x + c) `mod` base : xs)

norm :: [Int] -> ArbInt
norm = Norm . dropWhile (== 0) . addCarry . foldr carry (0, [])

addCarry :: (Carry, [Digit]) -> [Digit]
addCarry (c, xs) = if (-1 <= c) && (c < base) then c:xs
                   else addCarry(c `div` base, c `mod` base : xs)

align :: ([Digit], [Digit]) -> ([Digit], [Digit])
align (xs, ys)
    | n > 0 = (replicate n 0 ++ xs, ys)
    | n <= 0 = (xs, replicate (-n) 0 ++ ys)
    where n = length ys - length xs

instance Eq ArbInt where
    (==) = translate (==)
instance Ord ArbInt where
    (<) = translate (<)

translate :: ([Digit] -> [Digit] -> Bool) -> (ArbInt -> ArbInt -> Bool) 
translate op x y = op xs ys
    where (xs, ys) = align (digits x, digits y)

isZero :: ArbInt -> Bool
isZero = null . digits

norm' xs  = Norm (addCarry (c, ys))
    where ys = map snd (init z)
          c = fst (head z)
          z = scanr (op) (0,0) xs
          x `op` (c, y) = ((x+c) `div` base, (x+c) `mod` base)

instance Num ArbInt where
    x + y = norm (zippWith (+) (align (digits x, digits y)))
    x - y = norm (zippWith (-) (align (digits x, digits y)))
    x * y = ...
    negate x = norm . map neg . digits where neg x = -x

zippWith = uncurry zipWith

negative :: ArbInt -> Bool
negative (Norm xs) = not (null xs) && (head xs < 0)