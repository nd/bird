data Nat = Zero | Succ Nat
           deriving(Eq, Ord, Show)

minus :: Nat -> Nat -> Nat
m `minus` Zero = m
Zero `minus` (Succ a) = Zero
(Succ m) `minus` (Succ n) = m `minus` n