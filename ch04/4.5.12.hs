import System.CPUTime

scanr1 f = map (foldr1 f) . tails1

--tails1 . foldr f

tails1 = init . tails

tails [] = [[]]
tails (x:xs) = (x:xs):tails xs

--efficient variant:
scanr1' f = foldl g [] . reverse
    where g [] x = [x]
          g (y:ys) x = (f x y):y:ys