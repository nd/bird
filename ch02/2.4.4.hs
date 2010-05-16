--we can represent to enums as one as 2 ** fromEnum a * 3 ** fromEnum b

instance (Enum a, Enum b) => Enum (a, b) where
    fromEnum (a, b) = (power 2 (fromEnum a)) * (power 3 (fromEnum b))
    toEnum x = (toEnum(powerOfTwo x), toEnum(powerOfThree x))
        where powerOfTwo x = iter x 0 
                  where iter x result 
                            | even x = result
                            | otherwise = iter (x `mod` 2) (result + 1)
              powerOfThree x = iter (x `mod` (powerOfTwo x)) 0 
                  where iter x result 
                            | x == 1 = result
                            | otherwise = iter (x `mod` 3) (result + 1)

power base p = iter base p 1
      where iter base p result 
                | p == 0     = result
                | otherwise = iter base (p - 1) base * result

