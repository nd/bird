uncurry :: (a -> b -> c) -> (a, b) -> c
uncurry f = g
    where g (x, y) = f x y