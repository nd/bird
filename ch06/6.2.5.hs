join :: Stree a -> Stree a -> Stree a
join Null yt           = yt
join (Fork ut x vt) yt = Fork ut x (join vt yt)

height yt <= height (join xt yt) <= height yt + height xt

join' :: (Ord a) => Stree a -> Stree a -> Stree a
join' xt yt = if empty yt then xt else Fork xt head tail
    where (head, tail) = splitTree yt

height xt <= height (join xt yt) <= height xt `max` height yt