classlist = sortby name . assign . reverse . sortby mark . zipp . cross (map fst . sortby iden, map snd)

-- I don't see how reverse . zipp = zipp . cross(reverse, reverse) and
-- reverse . map f = map f . reverse help to transform this definition

-- last function should be sortby name,
-- we should give to assign list in reverse order by mark, so
-- (sortby name . assign . reverse . sortby mark) sequence of 
-- functions cannot be changed. And in the rest of sequence 
-- we don't have any reverses.

