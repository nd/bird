remdups :: (Eq a) => [a] -> [a]
remdups xs = foldr f [] xs
    where f x []   = [x]
          f x (y:ys) = if x == y then y:ys else x:y:ys

remdups' xs = foldl f [] xs
    where f [] x = [x]
          f xs x = if (last xs) == x then xs else xs ++ [x]