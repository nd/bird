-- prove that n + m = m + n

-- n + m == 
-- (n +) . foldn Succ Zero m == 
-- by fusion law 
-- foldn Succ n m
-- so we shold prove that foldn Succ n m = m + n
-- let's define + using first argument pattern mathing:

(+) :: Nat -> Nat -> Nat
Zero + n = n
(Succ m) + n = Succ(m + n)

-- let's prove by induction by m:

-- case: m = Zero
-- left part: foldn Succ n Zero = n - by definition of foldn
-- right part: Zero + n = n - by definition of +

-- induction hypotisys: foldn Succ n m = m + n

-- case: m = Succ x
-- left part foldn Succ n (Succ m) = Succ(foldn Succ n m) - second equation for foldn
-- right part: (Succ m) + n = Succ(m + n)
-- and Succ(foldn Succ n m) = Succ(m + n) - by induction hypotisys

