data Nat = Zero | Succ Nat
           deriving(Eq, Show)

minus :: Nat -> Nat -> Nat
m `minus` Zero = m
Zero `minus` (Succ a) = Zero
(Succ m) `minus` (Succ n) = m `minus` n

type List a = (Nat -> a, Nat)

nilc :: List a
nilc = (f, Zero)
    where f x = undefined

nullc :: (List a) -> Bool
nullc (f, l) = l == Zero

consc :: a -> List a -> List a
consc x (f, l) = (g, Succ l)
    where g k = if k == Zero then x else f (k `minus` one)
          one = (Succ Zero)

headc :: List a -> a
headc (f, l) = f Zero

tailc :: List a -> List a
tailc (f, l) = (g, (l `minus` one))
    where g k = f (Succ k)
          one = (Succ Zero)
                

abstr :: (Nat -> a, Nat) -> [a]
abstr (f, Zero)   = [] g
abstr (f, Succ l) = (f Zero) : (abstr (g, l))
    where g k = f (Succ k)



