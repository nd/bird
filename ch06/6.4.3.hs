--unsolved

collect :: Btree a -> [Rose a] -> Rose a
collect xb yts = toR (foldl Fork xb (map toB yts))

case yts is []:
collect xb [] = toR (foldl Fork xb (map toB []))
{def of map}
toR (foldl Fork xb []) =
{def of foldl}
toR (xb)

collect xb [] = toR xb

case yts is (yt:yts):
collect xb (yt:yts) = toR (foldl Fork xb (map toB (yt:yts))) =
{def of map}
toR (foldl Fork xb (toB yt):(map toB yts)) =
{def of foldl}
toR (foldl Fork (Fork xb (toB yt)) (map toB yts)) =
{zb = Fork xb (toB yt)}
toR (foldl Fork zb (map toB yts)) where zb = Fork xb (toB yt) =
collect zb yts where zb = Fork xb (toB yt)

