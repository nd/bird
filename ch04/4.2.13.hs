data (CatList a) = CatNil 
                 | Wrap a 
                 | Cat (CatList a) (CatList a)
                   deriving(Show)

instance (Eq a) => Eq (CatList a) where
    CatNil  == CatNil   = True
    CatNil  == Wrap x   = False
    CatNil  == Cat x y  = x == CatNil && y == CatNil
    Wrap x  == CatNil   = False
    Wrap x  == Wrap y   = x == y
    Wrap x  == Cat z w  = (Wrap x == z && w == CatNil) || (Wrap x == w  && z == CatNil)
    Cat x y == CatNil   = x == CatNil && y == CatNil
    Cat x y == Wrap z   = (x == Wrap z && y == CatNil) || (x == CatNil && y == Wrap z)
    Cat x y == Cat z w  = (toNormalForm (Cat x y)) == (toNormalForm (Cat z w))

instance (Ord a) => Ord (CatList a) where
    x < y = toNormalForm x < toNormalForm y

toNormalForm :: CatList a -> [a]
toNormalForm CatNil = []
toNormalForm (Wrap a) = [a]
toNormalForm (Cat a b) = (toNormalForm a) ++ (toNormalForm b)

