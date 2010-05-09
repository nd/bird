f :: Integer -> Integer
f x = 1

g :: Integer -> (Integer -> Integer)
g x y = 2

h :: Integer -> (Integer -> Integer) 
h x y = f (g x y)

-- h = f . g           -- false
-- h x = f . (g x)     -- true
-- h x y = (f . g) x y -- false