dfo :: [Rose a] -> [a]
dfo = concat . map flatten

dfo [] = []
dfo (Node x xts : yts) = [x] ++ dfo (xts ++ yts)

(foldr (++) []) . map flatten = 
{fold-map fusion law}
foldr ((++) . flatten) [] =
{def foldr}
foldr [] = []
foldr (Node x xts : yts) = h (Node x xts) (foldr h [] yts)
    where h = ((++) . flatten)
{def flatten}
foldr (Node x xts : yts) = (x : concat (map flatten xts)) ++ (foldr h [] yts) = 
foldr (Node x xts : yts) = [x] ++ concat (map flatten xts) ++ (foldr h [] yts) = 
{def concat}
foldr (Node x xts : yts) = [x] ++ (foldr (++) [] (map flatten xts)) ++ (foldr h [] yts) =
{fold-map fusion}
foldr (Node x xts : yts) = [x] ++ (foldr ((++) . flatten) [] xts) ++ (foldr h [] yts) =
foldr (Node x xts : yts) = [x] ++ (foldr h [] xts) ++ (foldr h [] yts) =
foldr (Node x xts : yts) = [x] ++ (dfo xts) ++ (dfo yts) = 
foldr (Node x xts : yts) = [x] ++ (dfo xts ++ yts)

