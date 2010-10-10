length (subtrees xt) = size xt + nodes xt

subtrees :: Btree x -> [Btree x]
subtrees (Leaf x) = [Leaf x]
subtrees (Fork xt yt) = [Fork xt yt] ++ subtrees xt ++ subtrees yt

case (Leaf x):

left side:
length ([Leaf x]) = 1

right side:
size (Leaf x) + nodes (Leaf x) =
{def of size & nodes} 
1 + 0 = 1

case (Fork xt yt):

left side:
length (subtrees (Fork xt yt)) =
{def subtrees}
length ([Fork xt yt] ++ subtrees xt ++ subtrees yt) = 
{def of length, ++} 
1 + length (subtrees xt ++ subtrees yt) =
{def of length, ++}
1 + length (subtrees xt) + length (subtrees yt)

right side:
size (Fork xt yt) + nodes (Fork xt yt) = 
{def size}
size xt + size yt + nodes (Fork xt yt) =
{def nodes}
size xt + size yt + 1 + nodes xt + nodes yt =
1 + (size xt + nodes xt) + (size yt + nodes yt) = 
{induction hypothesis}
1 + length (subtrees xt) + length (subtrees yt)