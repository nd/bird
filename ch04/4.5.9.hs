scanf f a = map (foldr f a) . tails 

case xs is [] 

simple variant:
map (foldr f a) . tails [] = 
{def of tails}
map (foldr f a) [[]] =
{def of map}
(foldr f a []) : [] =
{def of foldr} =
[a]

efficient variant:
{def of scanr}
[a]


case xs is (x:xs)

simple variant:
map (foldr f a) . tails (x:xs) = 
{def of tails} 
map (foldr f a) . (x:xs):tails xs =
{def of map}
(foldr f a (x:xs)) : (map (foldr f a) (tails xs)) =
{def of scanr}
(foldr f a (x:xs)) : scanr f a xs

efficient variant:
f x (head ys):ys
  where ys = scanr f a xs =
{def of ys}
f x (head (scanr f a xs)) : (scanr f a xs) =
{by induction hypothesis}
f x (head ((foldr f a xs) : scanr f a (tail xs))) : (scanr f a xs) =
{def of head}
f x (foldr f a xs) : (scanr f a xs) =
{def of foldr}
foldr f a (x:xs) : (scanr f a xs)

QED
