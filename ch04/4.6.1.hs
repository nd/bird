foldr f e xs = foldl (flip f) e (reverse xs)

xs is []:
both sides are simplified to e

xs is (x:xs):
left side:
foldr f e (x:xs) = 
{def of foldr}
f x (foldr f e xs) =
{induction hypothesis}
f x (foldl (flip f) e (reverse xs))

right side:
foldl (flip f) e (reverse x:xs)

so we have to prove that
f x (foldl (flip f) y xs) = foldl (flip f) y (xs++[x])

xs is []:
left side:
f x (foldl (flip f) y xs) =
{def of foldl}
f x y
right side:
foldl (flip f) y ([]++[x]) = 
{def of ++}
foldl (flip f) y [x] =
{def of foldl}
foldl (flip f) ((flip f) y x) [] =
{def of flip}
foldl (flip f) (f x y) [] =
{def of foldl}
f x y

xs is (z:zs):
left side:
f x (foldl (flip f) y z:zs) =
{def of foldl}
f x (foldl (flip f) ((flip f) y z) zs) =
{def of flip}
f x (foldl (flip f) (f z y) zs)

right side:
foldl (flip f) y (z:zs ++ [x]) =
{def fo foldl}
foldl (flip f) ((flip f) y z) (zs ++ [x]) =
{def of flip}
foldl (flip f) (f z y) (zs ++ [x])

they are equal by induction hypothesis