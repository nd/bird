data List a = Nil | Cons a (List a)
              deriving (Show)

instance Monad List where
    return x = Cons x Nil
    p >>= q  = fromList $ concat $ map (toList . q) $ toList p

toList :: List a -> [a]
toList Nil = []
toList (Cons a as) = a : (toList as)

fromList :: [a] -> List a
fromList [] = Nil
fromList (x:xs) = Cons x (fromList xs)
