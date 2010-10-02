-- prove that convert . digits . norm = convert

convert :: [Int] -> Integer
convert = foldl (op) 0 where n `op` d = base * n + d

digits :: ArbInt -> [Digit]
digits (Norm xs) = xs

norm :: [Int] -> ArbInt
norm = Norm . dropWhile (== 0) . addCarry . foldr carry (0, [])

carry :: Digit -> (Carry, [Digit]) -> (Carry, [Digit])
carry x (c, xs) = ((x + c) `div` base, (x + c) `mod` base : xs)

addCarry :: (Carry, [Digit]) -> [Digit]
addCarry (c, xs) = if (-1 <= c) && (c < base) then c:xs
                   else addCarry(c `div` base, c `mod` base : xs)

convert . digits . Norm . dropWhile (== 0) . addCarry . foldr carry (0, []) = convert
convert . dropWhile (== 0) . addCarry . foldr carry (0, []) = convert



by induction on xs:
xs is []
left side:
dropWhile (== 0) . addCarry . foldr carry (0, []) [] =
{def of foldr}
dropWhile (== 0) . addCarry (0, []) = 
{def of addCarry} = 
dropWhile (== 0) . [0] = 
[]
and convert[] == convert[] == 0

xs is x:xs
left side:
dropWhile (== 0) . addCarry . foldr carry (0, []) x:xs =
{def of foldr}
dropWhile (== 0) . addCarry . carry x foldr carry (0, []) xs =
{def of foldr and carry} = 
dropWhile (== 0) . addCarry . carry x (c', xs') 

1. if (x + c') `div` base = 0 
{def of carry}
dropWhile (== 0) . addCarry . (0, (x + c) `mod` base : xs') = 
{def of addCarry}
dropWhile (== 0) 0:((x + c) `mod` base):xs' = 
(x + c) `mod` base : xs' or xs', where xs' is result of (dropWhile (== 0) . addCarry . foldr carry (0, []) xs)

... ok I give up