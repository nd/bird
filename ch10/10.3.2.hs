class M a where
    e :: a
    op :: a -> a -> a

data (M m) => Mon m a = MkMon (m, a)

instance (M m) => Monad (Mon m) where
    return x = MkMon (e, x)
    p >>= q  = q x
               where MkMon (y, x) = p 
               

