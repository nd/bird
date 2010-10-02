norm' xs  = Norm (addCarry (c, ys))
    where ys = map snd (init z)
          c = fst (head z)
          z = scanr (op) (0,0) xs
          x `op` (c, y) = ((x+c) `div` base, (x+c) `mod` base)

