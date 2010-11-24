f :: Int -> Int
f undefined       = 0
f (x /= undefined) = 1

this function is not monotonic, because:
undefined <= 1 (approximation order)
but 
f undefined is not <= f 1 

