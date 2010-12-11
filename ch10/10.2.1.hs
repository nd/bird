type Exception = String
data Exc a = Raise Exception | Return a

instance Monad Exc where
    return x = Return x
    (Raise e)  >>= q = Raise e
    (Return x) >>= q = q x


raise :: Exception -> Exc a
raise e = Raise e

try :: Exc a -> Exc a -> Exc a
try (Return x) b = (Return x)
try (Raise e) b = b

data Term = Con Int | Div Term Term | Try Term Term

instance Show a => Show (Exc a) where
    show (Raise e)  = "exception: " ++ e
    show (Return x) = "value: " ++ show x

evalEx :: Term -> Exc Int
evalEx (Con x)   = return x
evalEx (Div t u) = do x <- evalEx t
                      y <- evalEx u
                      if y == 0 
                         then raise "division by zero"
                         else return (x `div` y)
evalEx (Try t u) = do try (evalEx t) (evalEx u)


answer, wrong :: Term
answer = Div (Div (Con 1972) (Con 2)) (Con 23)
wrong  = Div (Con 2) (Div (Con 1) (Con 0))