import Common_5_1 

convert2 :: Int -> String
convert2 = fullstop . combine2 . digits2

fullstop :: String -> String
fullstop s = s ++ "\x2E"