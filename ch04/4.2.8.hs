rev2 :: [a] -> [a]
rev2 [] = []
rev2 (x:[]) = x:[]
rev2 (x:y:[]) = y:x:[]
rev2 (x:y:z:zs) = x:y:z:zs