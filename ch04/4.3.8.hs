[x | x <- xs, y <- ys] =
{generator rule}
concat (map f xs) where f x = [x | y <- ys] =
{generator rule}
concat (map f xs) where f x = concat (map f' ys) where f' y = [x]

[x | y <- ys, x <- xs] =
{generator rule}
concat (map f ys) where f y = [x | x <- xs] = 
{generator rule}
concat (map f ys) where f y = concat (map f' xs) where f' x = [x]

--[x | x <- xs, y <- ys] = [x | y <- ys, x <- xs] iff y contains zero
--or one element, if ys is [] then both sides are [], if ys is
--[something] then both sides === xs