type Text = [Char]
type Line = [Char]
type Word = [Char]

unlines :: [Line] -> Text
unlines = joinWith '\n'

lines :: Text -> [Line]
lines = breakOn '\n'

breakOn :: (Eq a) => a -> [a] -> [[a]]
breakOn x xs = if null zs then [xs] else ys:breakOn x (tail zs)
    where (ys, zs) = span (/= x) xs

joinWith :: a -> [[a]] -> [a]
joinWith x = foldr1 (#) where xs # ys = xs ++ [x] ++ ys

unwords :: [Word] -> Line
unwords = joinWith ' '

words :: Line -> [Word]
words = filter (not . null) . breakOn ' '

wordcount :: Text -> Int
wordcount = length . concat . map Main.words . Main.lines

format1 :: Text -> Text
format1 = unlines . map formatLine . lines

formatLine :: Line -> Line
formatLine = rebuild . words
    where rebuild ws = if null ws then [] else unwords ws