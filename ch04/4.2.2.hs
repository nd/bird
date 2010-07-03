[[]] ++ xs = xs         - false, it is []:xs
[[]] ++ xs = [xs]       - false
[[]] ++ xs = [[],xs]    - false
[[]] ++ [xs] = [[], xs] - true
[xs] ++ [] = [xs]       - true
[xs] ++ [xs] = [xs, xs] - true