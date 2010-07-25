ssm :: (Ord a) => [a] -> [a]
ssm xs = foldl f [] xs
    where f ys x = if (greaterThan x ys) then ys ++ [x] else ys
          greaterThan x xs = foldr g True xs
              where g y res = (x > y) && res
--          greaterThan x [] = True
--          greaterThan x (y:ys) = x > y && greaterThan x ys

                               
