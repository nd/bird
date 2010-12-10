(<>) :: (a -> IO b) -> (b -> IO c) -> (a -> IO c)
(<>) p q = v
    where v a = p a >>= q

(>>==) :: IO a -> (a -> IO b) -> IO b
(>>==) p q = (v <> q) ()
    where v () = p
