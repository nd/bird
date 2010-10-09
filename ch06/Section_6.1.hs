data Btree a = Leaf a | Fork (Btree a) (Btree a)

size :: Btree a -> Int
size (Leaf x) = 1
size (Fork xt yt) = size xt + size yt

flatten :: Btree a -> [a]
flatten (Leaf a) = [a]
flatten (Fork xt yt) = flatten xt ++ flatten yt

nodes :: Btree a -> Int
nodes (Leaf x) = 0
nodes (Fork xt yt) = 1 + nodes xt + nodes yt

