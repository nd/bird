cross (map f, map g) . unzip = unzip . map (cross (f, g))

left side:
cross (map f, map g) . unzip =
{def of unzip}
cross (map f, map g) . pair (map fst, map snd) =
{one of additional laws}
pair (map f . map fst, map g . map snd) = 
{one of additional laws}
pair (map (f . fst), map (g . snd))

right side:
unzip . map (cross (f, g)) = 
{def of unzip}
pair (map fst, map snd) . map (cross (f, g)) =
{one of additional laws}
pair (map fst . map (cross (f, g)), map snd . map (cross (f, g))) = 
{one of additional laws}
pair (map (fst . cross (f, g)), map (snd . cross (f, g))) =
{one of additional laws}
pair (map f . fst, map g . snd)

QED