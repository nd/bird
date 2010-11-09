null nil         = True
null (cons x xs) = False

head (cons x xs) = x
tail (cons x xs) = xs

