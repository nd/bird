type Digit = Int

digits :: Int -> [Digit]
digits n = if n < 10 then [n] else digits (n `div` 10) ++ [n `mod` 10]

digits' :: Int -> [Digit]
digits' = accum [] 
    
accum xs n = if n < 10 then n:xs else accum ((n `mod` 10):xs) (n `div` 10) 

--computation of digits n = O(n^2), digits' n = O(n)