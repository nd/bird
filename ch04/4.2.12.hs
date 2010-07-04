(xs ++ ys) !! k = if k < n then xs !! k else ys !! (k - n)
    where n = length xs

xs is []:
left side:
([] ++ ys) !! k = 
{first equation of ++}
ys !! k
right side:
if k < n (k is negative)
[] !! k = 
{case exhaustion in !!}
undefined (same on the left side)
if k >= n
ys !! (k - 0) = 
{arithmetic}
ys !! k

xs is (x:xs):
k < n:
left side:
((x:xs) ++ ys) !! (k+1) =
{second equation in ++}
(x:(xs ++ ys)) !! (k+1) =
{second equation in !!}
(xs ++ ys) !! k
right side:
(x:xs) !! (k+1) = 
{second equation in !!}
xs !! k
and (xs ++ ys) !! k == xs !! k by induction hypothesis

---------------
auxiliary result:
(xs ++ ys) !! (n + m) = ys !! m if n = length xs
xs is []:
left side:
([] ++ ys) !! (0 + m) = 
{definition of ++}
ys !! (0 + m) = 
{arithmetic}
ys !! m, equals to right side

xs is (x:xs)
left side:
((x:xs) ++ ys) !! (n + 1 + m) =
{definition of ++, arithmetic} 
(x:(xs ++ ys)) !! (n + m + 1) =
{definition of !!}
(xs ++ ys) !! (n + m) which is equal to ys !! m by induction hypothesis
---------------

k >= n: (k is (n + (k - n)))
((x:xs) ++ ys) !! (n + (k - n)) =
{auxiliary result}
ys !! (k - n)
right side:
ys !! (k - n) 


