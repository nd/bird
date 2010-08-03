f a = b
f (g x y) = h x (f y)
f . foldr g a = foldr h b

xs is []:

left side:
f (foldr g a []) = 
{def of foldr}
f a

right side:
foldr h b [] = 
{def of foldr}
b
and f a = b

xs is x:xs:

left side:
f (foldr g a x:xs) =
{def of foldr}
f (g x (foldr g a xs))

right side:
foldr h b x:xs = 
{def of foldr}
h x (foldr h b xs) = 
{induction hypothesis}
h x (f (foldr g a xs)) 

QED