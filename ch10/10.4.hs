class Monad m => ExMonad m where
    raise :: Exception -> m a

class Monad m => StMonad m where
    tick :: m ()

class Monad m => ShowMonad m where
    showMonad :: m String -> String

class Transformer t where
    promote :: Monad m => m a -> t m a


-- Exception transformer:

type Exception = String
data Exc a = Raise Exception | Return a

newtype EXC m a = MkEXC (m (Exc a))

recover :: EXC m a -> m (Exc a)
recover (MkEXC g) = g

instance Monad m => Monad (EXC m) where
    return x = MkEXC (return (Return x))
    p >>= q  = MkEXC (recover p >>= r)
               where r (Raise e)  = return (Raise e)
                     r (Return x) = recover (q x)

instance Transformer EXC where
    promote g = MkEXC (do {x <- g; return (Return x)})

instance Monad m => ExMonad (EXC m) where
    raise e = MkEXC (return (Raise e))

instance StMonad m => StMonad (EXC m) where
    tick = promote tick

instance ShowMonad m => ShowMonad (EXC m) where
    showMonad p = showMonad (recover p >>= q)
                  where q (Raise e)   = return ("exception: " ++ e)
                        q (Return cs) = return cs


-- State transformer

newtype STT m a = MkSTT (State -> m (a, State))
type State = Int

apply :: STT m a -> State -> m (a, State)
apply (MkSTT f) = f

instance Monad m => Monad (STT m) where
    return x = MkSTT f where f s = return (x, s)
    p >>= q  = MkSTT f
               where f s = do (x, s') <- apply p s
                              apply (q x) s'

instance Transformer STT where
    promote g = MkSTT f 
                where f s = do {x <- g; return (x, s)}

instance Monad m => StMonad (STT m) where
    tick = MkSTT f where f s = return ((), s + 1)

instance ExMonad m => ExMonad (STT m) where
    raise e = promote (raise e)

instance ShowMonad m => ShowMonad (STT m) where
    showMonad p = showMonad q
                  where q = do (x, s) <- apply p 0
                               return ("value: " ++ x ++ ", count : " ++ show s)

