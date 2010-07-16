[(x, y) | x <- [1..n], odd x, y <- [1..n]] =
{generator rule}
concat (map f [1..n]) where f x = [(x, y) | odd x, y <- [1..n]] =
{guard rule}
concat (map f [1..n]) where f x = if odd x 
                                  then [(x, y) | y <- [1..n]] 
                                  else []
{generator rule}
concat (map f [1..n]) 
    where f x = if odd x 
                then concat (map f' [1..n]) 
                    where f' y = (x, y)
                else []
 
[(x, y) | x <- [1..n], y <- [1..n], odd x] =
{generator rule}
concat (map f [1..n])
       where f x = [(x, y) | y <- [1..n], odd x] =
{generator rule}
concat (map f [1..n])
       where f x = concat (map f' [1..n])
                   where f' y = [(x, y) | odd x] =
{guard rule}
concat (map f [1..n])
       where f x = concat (map f' [1..n])
                   where f' y = if odd x 
                                then [(x, y)]
                                else []

cost of second expression is bigger because we generate all pairs
and then filter them, while in the first expression we generate pair
only for odd x