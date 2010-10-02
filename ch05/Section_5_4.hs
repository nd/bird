type Date = (Day, Month, Year)
type Day     = Int
type Month   = Int
type Year    = Int
type Dayname = Int

mnames :: [String]
mnames = ["January", "February", "March",
          "April", "May", "June",
          "July", "August", "September",
          "October", "Novermber", "December"]

day :: Date -> Dayname
day (d, m, y) = (fstday (m, y) + d - 1) `mod` 7

fstday :: (Month, Year) -> Dayname
fstday (m, y) = (fstdays y) !! (m - 1)

fstdays :: Year -> [Dayname]
fstdays = take 12 . map (`mod` 7) . mtotals

mtotals :: Year -> [Int]
mtotals y = scanl (+) (jan1 y) (mlengths y)

mlengths y = [31, feb, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    where feb = if leap y then 29 else 28

leap :: Year -> Bool
leap y = if y `mod` 100 == 0 then (y `mod` 400 == 0) else (y `mod` 4 == 0)

jan1 :: Year -> Dayname
jan1 y = (365 * x + x `div` 4 - x `div` 100 + x `div` 400) `mod` 7
    where x = y - 1

-- ex. 5.4.1
jan1' y = (x + x `div` 4 - x `div` 100 + x `div` 400 + 1) `mod` 7
    where x = y - 1

-- Pictures
type Height = Int
type Width  = Int

stack, spread :: [Picture] -> Picture
stack  = foldr1 (above)
spread = foldr1 (beside)

row :: String -> Picture
row = spread . map pixel

blank :: (Height, Width) -> Picture
blank = stack . map row . blanks
    where blanks (h, w) = replicate h (replicate w ' ')

stackWith :: Height -> [Picture] -> Picture
stackWith h = foldr1 (#)
    where p # q = p `above` (blank (h, width q) `above` q)

spreadWith :: Width -> [Picture] -> Picture
spreadWith w = foldr1 (#)
    where p # q = p `beside` (blank (height q, w) `beside` q)

tile :: [[Picture]] -> Picture
tile = stack . map spread

tileWith :: (Height, Width) -> [[Picture]] -> Picture
tileWith (h, w) = stackWith h . map (spreadWith w)

year :: Year -> String
year = showpic . tileWith (1,4) . group 3 . map picture . months

-- ex. 5.4.2
month :: (Month, Year) -> String
month (m, y) = showpic (picture (mnames !! (m-1), y, (fstdays y) !! (m-1), (mlengths y) !! (m-1)))

group :: Int -> [a] -> [[a]]
group n xs = if null xs then [] else ys:group n zs
    where (ys,zs) = splitAt n xs

months :: Year -> [(String, Year, Dayname, Int)]
months y = zipp4 (mnames, replicate 12 y, fstdays y, mlengths y)

zip4 :: [a] -> [b] -> [c] -> [d] -> [(a, b, c, d)]
zip4 as bs cs ds = map f (zip (zip3 as bs cs) ds)
    where f ((a,b,c),d) = (a,b,c,d)

zipp4 :: ([a], [b], [c], [d]) -> [(a, b, c, d)]
zipp4 (as, bs, cs, ds) = zip4 as bs cs ds


picture :: (String, Year, Dayname, Int) -> Picture
picture (m, y, d, s) = heading (m, y) `above` entries (d, s)

entries = tile . group 7 . pix
pix (d, s) = map (row . rjustify 3 . pic) [1-d..42-d]
    where pic n = if 1 <= n && n <= s then show n else ""

heading (m, y) = banner (m, y) `above` dnames
banner  (m, y) = row (rjustify 21 (m ++ " " ++ show y))
dnames = row " Mo Tu We Th Fr Sa Su"

type Picture = (Height, Width, [[Char]])

height :: Picture -> Height
height (h, w, xss) = h

width  :: Picture -> Width
width (h, w, xss) = w

pixel :: Char -> Picture
pixel c = (1, 1, [[c]])

above, beside :: Picture -> Picture -> Picture

(h, w, xss) `above` (j, v, yss) 
    | (w == v) = (h+j, w, xss++yss)
    | otherwise = error "above: different widths"

(h, w, xss) `beside` (j, v, yss)
    | (h == j) = (h, w+v, zipWith (++) xss yss)
    | otherwise = error "beside: different heights"

showpic :: Picture -> String
showpic (h, w, xss) = unlines xss

rjustify n xs = spaces (n - length xs) ++ xs

spaces :: Int -> String
spaces 0 = ""
spaces n = " " ++ spaces (n - 1)
