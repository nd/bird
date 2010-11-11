reprn . foldr join empty = reverse

fusion law:
f . foldr g a = foldr h b
f a = b 
reprn empty = []

f (g x y) = h x (f y)
reprn (join x xq) = reprn xq ++ [x] =>
h x xs = xs ++ [x]

reprn . foldr join empty = 
{fusion law}
foldr h [] where h xs = xs ++ [x] == reverse

abstr . reprn =
foldr join empty . reverse . reprn =
(foldr join empty . reverse) (xq ++ [x]) = 
foldr join empty x:(reverse (reprn xq)) = 
join x (foldr join empty (reverse (reprn xq))) = 
{by induction hypothesis}
join x ((foldr join empty . reverse . reprn) xq)
QED
