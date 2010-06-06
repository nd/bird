sqrt :: Float -> Float
sqrt x = fst (until done improve (x, 0))
      where done    (y, y') = abs(y - y') < eps * abs y
            improve (y, y') = ((y + x/y)/2, y)
            eps             = 0.0001

-- new tests are superior because we can not set equally good eps for
-- big and small values, so it is better to use measure in terms of
-- parts of x or in terms of how much approximate value change in each
-- iteration. These tests are more universal and we can use single
-- value of eps for all x.