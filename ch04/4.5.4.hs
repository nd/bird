insert x xs = takeWhile (<= x) xs ++ [x] ++ dropWhile (<= x) xs

-- xs is []:
-- insert x [] = 
-- takeWhile (<= x) [] ++ [x] ++ dropWhile (<= x) [] =
-- [] ++ [x] ++ [] =
-- [x] which is in non-decreasing order
--  
-- xs is y:ys:
-- insert x y:ys =
-- takeWhile (<= x) (y:ys) ++ [x] ++ dropWhile (<= x) (y:ys) 
--  
-- takeWhile (<= x) (y:ys) gives us a non-decreasing list in which every element is <= x, 
-- concatinating x to it also gives us non-decreasing list
--  
-- dropWhie (<= x) (y:ys) gives us a non-decreasing list in which element is > than x, so
-- result of whole operation is non-decreasing list

isort :: Ord a => [a] -> [a]
isort xs = foldr insert [] xs
