data Rose a = Node a [Rose a]

size :: Rose a -> Int
size (Node x xts) = 1 + sum (map size xts)

height :: Rose a -> Int
height (Node x xts) = 1 + maxlist (map height xts)
    where maxlist = foldl (max) 0

foldRose :: (a -> [b] -> b) -> Rose a -> b
foldRose f (Node x xts) = f x (map (foldRose f) xts)

mapRose :: (a -> b) -> Rose a -> Rose b
mapRose f = foldRose (Node . f)

flatten :: Rose a -> [a]
flatten (Node x xts) = x : concat (map flatten xts)

levels :: Rose a -> [[a]]
levels (Node x xts) = [x] : combine (map levels xts)

level :: Rose a -> [a]
level = concat . levels

index :: Int -> [[a]] -> [a]
index i xss = if i < length xss then xss !! i else []

combine :: [[[a]]] -> [[a]]
combine = foldr (f) []
    where [] `f` yss = yss
          (xs:xss) `f` [] = xs:xss
          (xs:xss) `f` (ys:yss) = (xs ++ ys) : (xss `f` yss)
