merge :: [Integer] -> [Integer] -> [Integer]
merge (x:xs) (y:ys)
    | x < y = x:merge xs (y:ys)
    | x == y = x:merge xs ys
    | x > y = y:merge (x:xs) ys

hamming bs as = bs ++ (foldr1 f (map g as))
    where ys = hamming bs as
          g a = map (a *) ys
          f a b = merge a b