1. foldr f a (xs ++ ys) == foldr f (foldr f a ys) xs

by induction on xs:
xs is []
left side:
foldr f a ([] ++ ys) =
{def of ++}
foldr f a ys

right side:
foldr f (foldr f a ys) [] =
{def of foldr}
foldr f a ys

xs is (x:xs)
left side:
foldr f a ((x:xs) ++ ys) = 
{def of ++} 
foldr f a (x:(xs ++ ys)) = 
{def of foldr}
f x (foldr f a (xs ++ ys))

right side:
foldr f (foldr f a ys) (x:xs) = 
{def of foldr}
f x (foldr f (foldr f a ys) xs)
and (foldr f a (xs ++ ys)) == (foldr f (foldr f a ys) xs) by induction hypothesis

2. foldl f a (xs ++ ys) = foldl f (foldl f a xs) ys

by induction on xs:
xs is []
left side:
foldl f a ([] ++ ys) = 
{def of ++}
foldl f a ys 

right side:
foldl f (foldl f a []) ys = 
{def of foldl}
foldl f a ys

xs is (x:xs)
left side:
foldl f a ((x:xs) ++ ys) = 
{def of ++}
foldl f a (x:(xs ++ ys)) = 
{def of foldl}
foldl f (f a x) (xs ++ ys)

right side:
foldl f (foldl f a (x:xs)) ys = 
{def of foldl}
foldl f (foldl f (f a x) xs) ys 

if we denote z is (f a x) we get:
foldl f z (xs ++ ys) == foldl f (foldl f z xs) ys which is true by induction hypothesis