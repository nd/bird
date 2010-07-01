last' (x:xs) = if null xs then x else last'  xs
last''(x:xs) = if xs == [] then x else last'' xs

data Day = Mon | Tue
         deriving(Show)

-- last'[Mon, Tue] == Tue
-- last''[Mon, Tue] == undefined --since Day doesn't derive Eq