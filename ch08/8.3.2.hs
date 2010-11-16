empty :: Eq a => (a -> Bool)
empty = \ x -> False

-- this one is hard:
-- isEmpty :: Eq a => (a -> Bool)
-- isEmpty empty = True

member :: Eq a => (a -> Bool) -> a -> Bool
member xs x = xs x

insert :: Eq a => a -> (a -> Bool) -> (a -> Bool)
insert x xs = \ y -> if x == y then True else xs y

delete :: Eq a => a -> (a -> Bool) -> (a -> Bool)
delete x xs = if xs x then ys else xs
    where ys z = if z == x then False else xs z

union :: Eq a => (a -> Bool) -> (a -> Bool) -> (a -> Bool)
union xs ys = \ x -> (xs x) || (ys x)

meet :: Eq a => (a -> Bool) -> (a -> Bool) -> (a -> Bool)
meet xs ys = \ x -> (xs x) && (ys x)

minus :: Eq a => (a -> Bool) -> (a -> Bool) -> (a -> Bool)
minus xs ys = \ x -> (xs x) && (not (ys x))

-- if we represent set with pair of boolean-valued function and the
-- size of the set it will be hard to implement union, meet, minus
-- since it is not clear how to calculate size of resulting sets