type Name = String
type Iden = Integer
type Mark = Int
type Rank = Int

type Codes = [(Name, Iden)]
type Marks = [(Iden, Mark)]
type Ranks = [(Name, Mark, Rank)]

classlist :: (Codes, Marks) -> Ranks
classlist = rank . collate

collate :: (Codes, Marks) -> [(Name, Mark)]
collate = sortby name . zipp . cross (map fst . sortby iden, map snd)
          where name (xn, xm) = xn
                iden (xn, xi) = xi

remove :: [((a, b), (b, c))] -> [(a, c)]
remove = map (cross (fst, snd))

sortby :: (Ord b) => (a -> b) -> [a] -> [a]
--sortby f = foldr (insertby f) []

sortby f []  = []
sortby f [x] = [x]
sortby f (x:y:xs) = mergeby f (cross (sortby f, sortby f) (divide (x:y:xs)))

divide :: [a] -> ([a],[a])
divide = foldr allocate ([], [])
    where allocate x (ys, zs) = (zs, x:ys)

mergeby :: (Ord b) => (a -> b) -> ([a],[a]) -> [a]
mergeby f ([], ys) = ys
mergeby f (x:xs, []) = x:xs
mergeby f (x:xs, y:ys) 
    | f x <= f y = x : mergeby f (xs, y:ys)
    | otherwise = y : mergeby f (x:xs, ys)

insertby :: (Ord b) => (a -> b) -> a -> [a] -> [a]
insertby f x = insert . span test
    where insert (xs, ys) = xs ++ [x] ++ ys
          test y = (f y < f x)

rank :: [(Name, Mark)] -> Ranks
rank = sortby name . assign . reverse . sortby mark
       where mark (name, a_mark) = a_mark
             name (a_name, mark, rank) = a_name

assign :: [(Name, Mark)] -> Ranks
assign = scanl1 reduce . initialise 

initialise :: [(Name, Mark)] -> Ranks
initialise xs = zipWith mktriple xs [1..]
                where mktriple (name, mark) rank = (name, mark, rank)

reduce (name1, mark1, rank1) (name2, mark2, rank2) = 
    if mark1 == mark2 then (name2, mark2, rank1) else (name2, mark2, rank2)

display :: Ranks -> String
display = unlines . (heading :) . map line

heading = ljustify 12 "Name" ++ rjustify 4 "Mark" ++ rjustify 6 "Rank"
line (name, mark, rank) = ljustify 12 name ++ rjustify 4 (show mark) ++ rjustify 6 (show rank)

ljustify, rjustify :: Int -> String -> String
ljustify n xs = xs ++ spaces (n - length xs)
rjustify n xs = spaces (n - length xs) ++ xs

spaces :: Int -> String
spaces 0 = ""
spaces n = " " ++ spaces (n - 1)

zipp :: ([a], [b]) -> [(a, b)]
zipp (xs, ys) = zip xs ys

cross :: (a -> b, c -> d) -> (a, c) -> (b, d)
cross (f, g) = pair (f . fst, g . snd)

pair :: (a -> b, a -> c) -> a -> (b, c)
pair (f, g) a = (f a, g a)