data Stree a = Null | Fork (Stree a) a (Stree a)

abstr :: Stree a -> Set a
abstr x = abstr' x empty

abstr' :: Stree a -> Set a -> Set a
abstr' Null result = result
abstr' (Fork xt y zt) result = abstr' xt (insert y (abstr' zt result))

valid :: (Ord a) => Stree a -> Bool
valid Null = True
valid Fork xt y zt = valid xt && valid zt && (valid' y xt zt) 

valid' :: (Ord a) => a -> Stree a -> Stree a -> Bool
valid' x l r 
    | x Null Null = True
    | x (Fork xt y zt) Null = y < x
    | x Null (Fork xt y zt) = x < y
    | x (Fork xt' y' zt') (Fork xt'' y'' zt'') = y' < x && x < y''