data Btree a = Leaf a | Fork (Btree a) (Btree a)

type Bit = Int

decode :: Btree Char -> [Bit] -> [Char]
decode t cs = if null cs then [] else decode1 t cs
    where decode1 (Leaf x) cs           = x : decode t cs
          decode1 (Fork xt yt) (0 : cs) = decode1 xt cs
          decode1 (Fork xt yt) (1 : cs) = decode1 yt cs

type CodeTable = [(Char, [Bit])]

encode :: Btree Char -> [Char] -> [Bit]
encode t = concat . map (Main.lookup codetable)
    where codetable = transform t

lookup :: CodeTable -> Char -> [Bit]
lookup ((x, bs) : xbs) y = if x == y then bs else Main.lookup xbs y

transform :: Btree Char -> CodeTable
transform (Leaf x)     = [(x, [])]
transform (Fork xt yt) = hufmerge (transform xt) (transform yt)

hufmerge :: CodeTable -> CodeTable -> CodeTable
hufmerge [] ycs = [(y, 1:cs) | (y, cs) <- ycs]
hufmerge xbs [] = [(x, 0:bs) | (x, bs) <- xbs]
hufmerge ((x, bs):xbs) ((y, cs):ycs) 
    | length bs <= length cs = (x, 0:bs) : hufmerge xbs ((y, cs):ycs)
    | otherwise             = (y, 1:cs) : hufmerge ((x, bs):xbs) ycs

-- ex. 6.5.2
type CodeTable' = [(Char, [Bit], Int)]

encode' :: Btree Char -> [Char] -> [Bit]
encode' t = concat . map (lookup' codetable)
    where codetable = transform' t

lookup' :: CodeTable' -> Char -> [Bit]
lookup' ((x, bs, l) : xbs) y = if x == y then bs else lookup' xbs y

transform' :: Btree Char -> CodeTable'
transform' (Leaf x)     = [(x, [], 0)]
transform' (Fork xt yt) = hufmerge' (transform' xt) (transform' yt)

hufmerge' :: CodeTable' -> CodeTable' -> CodeTable'
hufmerge' [] ycs = [(y, 1:cs, l+1) | (y, cs, l) <- ycs]
hufmerge' xbs [] = [(x, 0:bs, l+1) | (x, bs, l) <- xbs]
hufmerge' ((x, bs, lx):xbs) ((y, cs, ly):ycs) 
    | lx <= ly   = (x, 0:bs, lx+1) : hufmerge' xbs ((y, cs, ly):ycs)
    | otherwise = (y, 1:cs, ly+1) : hufmerge' ((x, bs, lx):xbs) ycs
