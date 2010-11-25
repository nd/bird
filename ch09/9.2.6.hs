1. approx n xs <= xs

case n is 0
left side:
approx n xs =
{def approx}
undefined
and undefined is the bottom of any xs


case n is n+1:
xs is []:
approx (n+1) [] = 
[]
and [] <= []

xs is x:xs:
approx (n+1) (x:xs) =
x:approx n xs 
x <= x, since x == x
and approx n xs <= xs by induction hypothesis



2. if approx n xs <= ys for all n, then xs <= ys
since lim approx n ns (n -> infinity) = xs
we get xs <= ys and ys <= xs;
since <= is anti-simmetric it is possible only if xs = ys


