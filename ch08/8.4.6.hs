n == 1 is a special case, because without it we will get infinite recursion:
m = 1 `div` 2 -- 0
(xt, ys) = mkTwo m xs -- (Null, ys)
(yt, zs) = mkTwo (1 - 0) ys -- mkTwo 1 ys and so on
