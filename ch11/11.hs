import Char

newtype Parser a = MkP (String -> [(a, String)])

apply :: Parser a -> String -> [(a, String)]
apply (MkP f) s = f s

applyParser :: Parser a -> String -> a
applyParser p = fst . head . apply p

instance Monad Parser where
    return x = MkP f where f s = [(x, s)]
    p >>= q  = MkP f
               where f s = [(y, s'') | (x, s') <- apply p s, (y, s'') <- apply (q x) s']

item :: Parser Char
item = MkP f
    where f [] = []
          f (c:cs) = [(c, cs)]

zero :: Parser a
zero = MkP f where f s = []

sat :: (Char -> Bool) -> Parser Char
sat p = do {c <- item; if p c then return c else zero}

char :: Char -> Parser ()
char x = do {c <- sat (== x); return ()}

string :: String -> Parser ()
string [] = return ()
string (x:xs) = do {char x; string xs; return ()}

lower :: Parser Char
lower = sat Char.isLower

digit :: Parser Int
digit = do {d <- sat Char.isDigit; return (ord d - ord '0')}

--ex. 11.1.4
upper :: Parser Char
upper = sat Char.isUpper

--ex. 11.1.5
upperLower :: Parser ()
upperLower = do {u <- upper; l <- lower; return ()}

plus :: Parser a -> Parser a -> Parser a
p `plus` q = MkP f where f s = apply p s ++ apply q s

lowers :: Parser String
lowers = do {c <- lower; cs <- lowers; return (c:cs)} `plus` return ""

orelse :: Parser a -> Parser a -> Parser a
p `orelse` q = MkP f
               where f s = if null ps then apply q s else ps
                           where ps = apply p s
