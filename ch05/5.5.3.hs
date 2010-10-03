--unlines = concat . map (++ "\n") ==
--foldr (++) [] . map (++ "\n") ==
--{f == (++), g == (++ "\n"), a == []} 
--foldr (f . g) a ==
--foldr ((++) . (++ "\n")) [] 

--lines' :: Text -> [Line]
lines' xs = if null zs then ys' else ys:lines' (tail zs)
    where (ys, zs) = span (/= '\n') xs
          ys' = if null ys then [] else [ys]
