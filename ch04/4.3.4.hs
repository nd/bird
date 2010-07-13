map f (xs ++ ys) = map f xs ++ map f ys

by induction on xs:

xs is []:
left side:
map f ([] ++ ys) = 
{def of ++}
map f ys
right side:
map f [] ++ map f ys = 
{def of map}
[] ++ map f ys = 
{def of ++}
map f ys

xs is undefined:
left side:
map f (undefined ++ ys) =
{case exhaustion in ++}
map f undefined = 
{case exhaustion in map}
undefined
right side:
map undefined xs ++ map f ys =
{case exhaustion in map} 
undefined ++ map f ys =
{case exhaustion in ++}
undefined

xs is x:xs:
left side:
map f ((x:xs) ++ ys) = 
{def of ++}
map f (x:(xs ++ ys)) =
{def of map} 
f x : map f (xs ++ ys)
right side:
map f (x:xs) ++ map f ys =
{def of map}
f x : map f xs ++ map f ys
which is equal to left side by induction hypothesis