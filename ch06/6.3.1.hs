levels :: [a] -> [[a]]
levels = levelsWith 1

levelsWith :: Int -> [a] -> [[a]]
levelsWith level xs = if (length zs) == 0 
                      then [ys]
                      else [ys] ++ (levelsWith (2 * level) zs)
    where (ys, zs) = splitAt level xs
