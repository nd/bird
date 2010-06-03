-- Specification: (n * m) / n = m

data Nat = Zero | Succ Nat
           deriving(Eq, Ord, Show)

minus :: Nat -> Nat -> Nat
m `minus` Zero = m
Zero `minus` (Succ a) = Zero
(Succ m) `minus` (Succ n) = m `minus` n

divn :: Nat -> Nat -> Nat
Zero `divn` n = Zero
m `divn` n = Succ((m `minus` n) `divn` n)

-- let's prove by induction on m: 
-- case m = Zero: 
-- (n * Zero) / n =
-- {by definition of *}
-- Zero / n =
-- {by definition of divn}
-- Zero
--
-- case m = Succ x:
-- (n * (Succ x)) / n =
-- {by definition of *}
-- (n * x + n) / n =
-- {definition of divn}
-- Succ((n * x + n - n) / n) =
-- {since a + n - n = a}
-- Succ((n * x) / n)
-- and the right part is Succ(x)

-- a + n - n = a
-- case n = Zero:
-- a + Zero - Zero =
-- {definition of +}
-- a - Zero
-- {definition of -}
-- a

-- case n = Succ x:
-- a + (Succ x) - (Succ x) = 
-- {definition of +}
-- Succ(a + x) - (Succ x) =
-- {definition of minus} =
-- a + x - x = 
-- {induction hypotisys}
-- a