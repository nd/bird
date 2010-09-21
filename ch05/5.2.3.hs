divide :: [a] -> ([a], [a])
divide xs = splitAt ((length xs) `div` 2) xs

--length takes cn steps on list with n elements and splitAt takes
--c((length xs) `div` 2) steps, so this definition of divide takes ~
--1.5cn steps on list of length n