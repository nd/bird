unfoldl' :: (a -> Bool) -> (a -> (a, b)) -> a -> [b] -> [b]
unfoldl' p f x ws = if p x then ws else unfoldl' p f y (z:ws)
    where (y,z) = f x