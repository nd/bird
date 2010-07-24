filter' p = foldr f [] 
    where f x xs = if p x then x:xs else xs