data Liste a = Nil | Snoc (Liste a) a
               deriving (Show)

convert :: [a] -> Liste a
convert [] = Nil
convert (x:xs) = Snoc (convert xs) x
--or:
--convert = foldr f Nil
--    where f x y = Snoc y x

--folde f e = foldl f e . convert
-- 
--argument is Nil:
--left side:
--folde f e = e
--right side:
--foldl f e . convert =
--{def of convert}
--foldl f e Nil = e
-- 
--argument is Snoc xs x:
--left side:
--folde f e (Snoc xs x) = 
--{def of folde}
--f (folde f e xs) x
--right side:
--foldl f e . convert (x:xs) =
--{def of convert}
--foldl f e (Snoc (convert xs) x) =
--{def of foldl} 
--f (foldl f e (convert xs)) x
--they are equals by induction hypothesis
--qed
