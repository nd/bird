import Common_5_1 hiding (combine6, digits6, convert6)

convert6 :: Int -> String
convert6 = sign . combine6 . digits6
 
digits6 :: Int -> (Int, Int, Bool)
digits6 n = ((abs n) `div` 1000, (abs n) `mod` 1000, n < 0)

combine6 :: (Int, Int, Bool) -> (String, Bool)
combine6 (0, 0, neg)         = ("zero", False)
combine6 (0, h + 1, neg)     = (convert3 (h + 1), neg)
combine6 (m + 1, 0, neg)     = (convert3 (m + 1) ++ " thousand", neg)
combine6 (m + 1, h + 1, neg) = (convert3 (m + 1) ++ " thousand" ++ link (h + 1) ++ convert3 (h + 1), neg)

sign :: (String, Bool) -> String
sign (s, True)  = "minus " ++ s
sign (s, False) = s