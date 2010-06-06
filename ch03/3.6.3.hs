sqrt :: Float -> Float
sqrt x = until done improve x
      where done    y = abs(y * y - x) < eps * x
            improve y = (y + x/y)/2
            eps       = 0.0001