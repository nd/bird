takeWhile p = foldr f []
    where f x xs = if p x then x:xs else []

it seems we can't express dropWhile as instance of fold
