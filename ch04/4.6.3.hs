f a = b
f (g x y) = h (f x) y
f . foldl g a = foldl h b

xs is []:

left side:
f (foldl g a []) =
{def of foldl} 
f a

right side:
foldl h b [] = b

and it is given that f a = b


xs is x:xs

left side:
f (foldl g a (x:xs)) =
{def of foldl}
f (foldl g (g a x) xs)

right side:
foldl h b x:xs =
{def of foldl}
foldl h (h b x) xs =
{since f a = b}
foldl h (h (f a) x) xs

so we have to proove that (a becomes x, x becomes y)
f (foldl g (g x y) xs) = foldl h (h (f x) y) xs

zs is []:

left side:
f (foldl g (g y x) []) = 
{def of foldl}
f (g y x) =
h (f x) y

right side:
foldl h (h (f x) y) [] = 
{def of foldl}
h (f x) y

zs is z:zs

left side:
f (foldl g (g y x) z:zs) = 
{def of foldl}
f (foldl g (g (g y x) z) zs)

right side:
foldl h (h (f x) y) z:zs = 
{def of foldl}
foldl h (h (h (f x) y) z) zs =
{since f (g x y) = h (f x) y}
foldl h (h (f (g x y)) z) zs 

if we denot g x y as u then we get 
from the left:  f (foldl g (g u z) zs) 
from the right: foldl h (h (f u) z) zs 
and they are equal by induction hypothesis
