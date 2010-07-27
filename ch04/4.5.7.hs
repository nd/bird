scanl f e [] = [e]

scanl f e [] = 
{def of scanl}
map (foldl f e) . inits [] =
{def of inits}
map (foldl f e) [[]] =
{def of map} = 
(foldl f e []) : [] =
{def of foldl}
e : [] = [e]
