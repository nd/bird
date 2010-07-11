import Common_5_1

convert9 :: Int -> String
convert9 = combine9 . digits9

digits9 :: Int -> (Int, Int)
digits9 n = (n `div` 1000000, n `mod` 1000000)

combine9 :: (Int, Int) -> String
combine9 (0, m + 1) = convert6 (m + 1)
combine9 (b + 1, 0) = convert3 (b + 1) ++ " billion"
combine9 (b + 1, m + 1) = convert3 (b + 1) ++ " billion" ++ link (m + 1) ++ convert6 (m + 1)