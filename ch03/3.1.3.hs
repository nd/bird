data Nat = Zero | Succ Nat
           deriving(Eq, Ord, Show)

(+++) :: Nat -> Nat -> Nat
(+++) Zero m = m
(+++) (Succ n) m = Succ((+++) n m)

(***) :: Nat -> Nat -> Nat
(***) Zero m = Zero
(***) (Succ n) m = (+++) ((***) n m) m