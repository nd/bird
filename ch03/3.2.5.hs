k * (m + n) = (k * m) + (k * n)

let's define * by pattern matching on first argument
(*) :: Nat -> Nat -> Nat
Zero * m = Zero
Succ n * m = (n * m) + m

k = Zero:
left part: Zero * (m + n) = Zero
right part: (Zero * m) + (Zero * n) = Zero + Zero = Zero 

let's suppose it works for k <= x
k = Succ 1
left part: Succ x * (m + n) = x * (m + n) + (m + n)
right part: (Succ x * m) + (Succ x * n) = (x * m + m) + (x * n + n) = x * m + x * n + (n + m) = x * (m + n) + (m + n)