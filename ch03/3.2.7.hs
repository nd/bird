--minis is a total minus
n `minus` m = undefined

case n = undefined
n `minus` m = undefined --by definition (case exhaustion)

case n = Succ x
Succ x `minus` m = 
if m = Zero: Succ x `minus` m = Succ x = n
if m = Succ y: Succ x `minus` Succ m = x `minus` y = undefined --induction hypothesys