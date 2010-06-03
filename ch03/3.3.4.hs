data Nat = Zero | Succ Nat
           deriving(Eq, Ord, Show)

minus :: Nat -> Nat -> Nat
m `minus` Zero = m
Zero `minus` (Succ a) = Zero
(Succ m) `minus` (Succ n) = m `minus` n

divn :: Nat -> Nat -> Nat
Zero `divn` n = Zero
m `divn` n = Succ((m `minus` n) `divn` n)

logn :: Nat -> Nat
logn (Succ Zero) = Zero
logn m = Succ (logn (m `divn` (Succ (Succ Zero))))

-- let's use fusion law to prove log(2 ^ m) = m:
-- log(2 ^ m) = log . foldn (*(Succ(Succ Zero))) (Succ Zero) m and m = foldn Succ Zero m, 
-- so we should prove that log . foldn (* (Succ (Succ Zero))) (Succ Zero) = foldn Succ Zero m
--  
-- log undefined = undefined {by definition of logn - case exhaustion}
-- log (Succ Zero) = Zero {first equation of logn}
-- log . (* (Succ (Succ Zero))) n = Succ . log n
-- let's prove by induction on n:
--  
-- n = Succ Zero
-- left part:
-- log . (* (Succ (Succ Zero)) (Succ Zero)) = 
-- {definition of *}
-- log . ((Succ (Succ Zero)) * Zero + (Succ (Succ Zero))) = 
-- {definition of *}
-- log . (Succ (Succ Zero)) = 
-- {definition of log}
-- Succ (log (Succ (Succ Zero)) `divn` (Succ (Succ Zero))) = 
-- {definition of divn}
-- Succ (log (Succ (((Succ (Succ Zero)) `minus` (Succ (Succ Zero))) `divn` (Succ (Succ Zero))))) = 
-- {since ((Succ (Succ Zero)) `minus` (Succ (Succ Zero))) = {definition of minus} = ((Succ Zero) `minus` (Succ Zero)) = {def of minus} = Zero}
-- Succ (log (Succ (Zero `divn` (Succ (Succ Zero))))) = 
-- {definition of divn}
-- Succ (log (Succ Zero)) =
-- {definition of log} 
-- Succ Zero
-- right part:
-- Succ . log (Succ Zero) = Succ Zero
--  
-- n = Succ m
-- left part:
-- log . (* (Succ (Succ Zero)) (Succ m)) = 
-- {def of *}
-- log . ((Succ (Succ Zero)) * m + (Succ (Succ Zero))) = 
-- {def +}
-- log . (Succ ((Succ (Succ Zero)) * m) + (Succ Zero)) = 
-- {def +}
-- log . (Succ (Succ ((Succ (Succ Zero)) * m))) = 
-- {def log}
-- Succ (log ((Succ (Succ ((Succ (Succ Zero)) * m))) `divn` (Succ (Succ Zero)))) 
--  
-- simplify argument of log:
-- ((Succ (Succ ((Succ (Succ Zero)) * m))) `divn` (Succ (Succ Zero)))
-- Succ(((Succ (Succ ((Succ (Succ Zero)) * m)))
--       `minus`
--       (Succ (Succ Zero))) `divn` (Succ (Succ Zero))) =
-- {def - }
-- Succ(((Succ ((Succ (Succ Zero)) * m))
--       `minus`
--       (Succ Zero)) `divn` (Succ (Succ Zero))) =
-- {def -}
-- Succ((((Succ (Succ Zero)) * m)
--       `minus`
--       Zero) `divn` (Succ (Succ Zero))) =
-- {def -}
-- Succ(((Succ (Succ Zero)) * m) `divn` (Succ (Succ Zero))) =
-- {result of ex. 3.3.3}
-- Succ(m)
--  
-- so we get for left part:
-- Succ (log (Succ m))
--  
-- right part:
-- Succ . log (Succ m)
--  
-- done