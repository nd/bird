data Nat = Zero | Succ Nat
           deriving(Eq, Ord, Show)

convert :: Nat -> Integer
convert Zero = 0
convert (Succ n) = 1+ (convert n)