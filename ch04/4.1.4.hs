data Liste a = Nil | Snoc (Liste a) a
               deriving(Show)

head [x:xs] = x

head' (Snoc Nil a) = a
head' (Snoc as a) = head' as

convert :: Liste a -> [a]
convert Nil = []
convert xs  = iter [] xs
    where iter result Nil         = result
          iter result (Snoc xs x) = iter (x:result) xs