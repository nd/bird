approx n xs <= approx (n+1) xs

case n is 0:

left side:
approx 0 xs = undefined

right side:
approx 1 xs = [] or x:undefined

and undefined <= [] and undefined <= x:undefined


case n is n+1:

xs is []:
left side: 
[]
right side:
[] 
and
[] <= []

xs is x:xs
left side:
x:approx n xs
right side:
x:approx (n+1) xs

x <= x, since x == x

and approx n xs <= approx (n+1) xs by induction hypothesis
