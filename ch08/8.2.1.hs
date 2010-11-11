(fromQ . toQ) [] =
{def toQ}
fromQ (foldr join empty . reverse []) =
{def reverse, foldr}
fromQ empty =
{def fromQ}
[]

(fromQ . toQ) x:xs = 
{def toQ}
fromQ ((foldr join empty . reverse) x:xs) = 
fromQ (foldr join empty ((reverse xs) ++ [x])) = 
{why?}
fromQ (foldr join (join x empty) . reverse) xs = 
{def fromQ}
front ((foldr join (join x empty) . reverse) xs) : fromQ (back (foldr join (join x empty) . reverse) xs) = 
{axioms: front (join x empty) = x, front (join x (join y xq)) = front (join y xq) }
x : fromQ (back (foldr join (join x empty) . reverse) xs) = 
{axioms: back (join x empty) = empty, back (join x (join y xq)) = join x (back (join y xq))}
x : fromQ (foldr join (join x empty) . reverse) xs = 
x : fromQ . toQ xs =
{by induction hypothesis}
x : xs
