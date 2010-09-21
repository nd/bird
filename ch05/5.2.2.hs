--sortby f xs2 = mergeby f (cross (sortby f, sortby f) (divide xs2))

-- divide xs2 returns 2 lists of lenght xs, we sort each of them,
-- which require 2cn * log n steps
-- final mergeby takes 2cn steps for list of length 2n, so we get 
-- 2cn + 2cn * log n = 2cn * (log n + 1) = 2cn log(2n) (if log base is 2)

-- I think that divide also takes 2cn steps. Maybe we should not take
-- it into account because of lazyness..