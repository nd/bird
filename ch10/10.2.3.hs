data Term = Con Int | Div Term Term | Count

newtype St a = MkSt (State -> (a, State))
type State   = Int

instance Monad St where
    return x = MkSt f where f s = (x, s)
    p >>= q  = MkSt f 
               where f s = apply (q x) s'
                           where (x, s') = apply p s

tick :: St ()
tick = MkSt f where f s = ((), s+1)

count :: St Int
count = MkSt f where f s = (s, s)

instance Show a => Show (St a) where
    show f = "value: " ++ show x ++ ", count: " ++ show s
             where (x, s) = apply f 0

apply :: St a -> State -> (a, State)
apply (MkSt f) s = f s

eval :: Term -> St Int
eval (Con x)   = return x
eval (Div t u) = do x <- eval t
                    y <- eval u
                    tick 
                    return (x `div` y)
eval Count     = count

answer, wrong :: Term
answer = Div (Div (Con 1972) (Con 2)) (Con 23)
wrong  = Div (Con 2) (Div (Con 1) (Con 0))

