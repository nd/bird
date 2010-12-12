type Output = String

newtype Out a = MkOut (Bool -> (Output, a))
instance Monad Out where
    return x = MkOut f where f _ = ("", x)
    p >>= q  = MkOut f 
               where f trace = (ox ++ oy, y)
                         where (ox, x) = apply p trace
                               (oy, y) = apply (q x) trace
                               

instance Show a => Show (Out a) where
    show f = ox ++ "value: " ++ show x
             where (ox, x) = apply f True

apply :: Out a -> Bool -> (Output, a)
apply (MkOut f) trace = f trace

out :: Output -> Out ()
out ox = MkOut f where f trace = if trace then (ox, ()) else ("", ())
 
traceOn :: Term -> Out Int
traceOn t  = MkOut f where f _ = apply (eval t) True

traceOff :: Term -> Out Int
traceOff t  = MkOut f where f _ = apply (eval t) False


line :: Term -> Int -> Output
line t x = "term: " ++ show t ++ ", yields " ++ show x ++ "\n"
 
data Term = Con Int | Div Term Term | Trace Term | Untrace Term
          deriving (Show)
 
eval :: Term -> Out Int
eval (Con x)   = do out (line (Con x) x)
                    return x
eval (Div t u) = do x <- eval t
                    y <- eval u
                    out (line (Div t u) (x `div` y))
                    return (x `div` y)
eval (Untrace t) = traceOff t
eval (Trace t) = traceOn t
 
answer, wrong :: Term
answer = Div (Div (Con 1972) (Con 2)) (Con 23)
wrong  = Div (Con 2) (Div (Con 1) (Con 0))

