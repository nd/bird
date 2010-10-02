--Prove that repeated c `div` base leads to value -1 <= c < base

repeated div:
rdiv x base = if x < base then x
              else rdiv (x `div` base) base

by induction on c:
for any -1 <= c < base
rdiv c base = c, by definition of rdiv

suppose statement is right for some c',
then for any c = c' * base
rdiv c base = 
{def of rdiv}
rdiv (c `div` base) base =
{c <= c' * base}
rdiv c' base =
{def of rdiv}
something between -1 and base
TED

