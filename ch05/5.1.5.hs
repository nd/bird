convert_back2 :: String -> Int
convert_back2 s = a + b
    where (a, rest) = tens s
          b         = if a > 0 then units rest else units s

tens :: String -> (Int, String)
tens ""                               = (0,  "")
tens ('t':'w':'e':'n':'t':'y':xs)     = (20, xs) 
tens ('t':'h':'i':'r':'t':'y':xs)     = (30, xs) 
tens ('f':'o':'r':'t':'y':xs)         = (40, xs) 
tens ('f':'i':'f':'t':'y':xs)         = (50, xs) 
tens ('s':'i':'x':'t':'y':xs)         = (60, xs) 
tens ('s':'e':'v':'e':'n':'t':'y':xs) = (70, xs) 
tens ('e':'i':'g':'h':'t':'y':xs)     = (80, xs) 
tens ('n':'i':'n':'e':'t':'y':xs)     = (90, xs) 
tens (x:xs)                           = tens xs


units :: String -> Int
units ""      = 0 
units "one"   = 1
units "two"   = 2
units "three" = 3
units "four"  = 4
units "five"  = 5
units "six"   = 6
units "seven" = 7
units "eight" = 8
units "nine"  = 9
units "ten"       = 10
units "eleven"    = 11
units "twelve"    = 12
units "thirteen"  = 13
units "fourteen"  = 14
units "fifteen"   = 15
units "sixteen"   = 16
units "seventeen" = 17
units "eighteen"  = 18
units "nineteen"  = 19
units (x:xs)  = units xs


convert_back3 :: String -> Int
convert_back3 s = a + b
    where (a, rest) = hundreds s
          b         = if a > 0 then convert_back2 rest else convert_back2 s
 
hundreds :: String -> (Int, String)
hundreds s = (n, rest)
    where hundreds' xs "" = ("", 0, "")
          hundreds' xs (' ':'h':'u':'n':'d':'r':'e':'d':ys) = ("", (units (reverse xs)) * 100, ys)
          hundreds' xs (y:ys) = hundreds' (y:xs) ys
          (head, n, rest)  = hundreds' "" s


convert_back6 :: String -> Int
convert_back6 s = a + b
    where (a, rest) = thousands s
          b         = if a > 0 then convert_back3 rest else convert_back3 s

thousands s = (n, rest)
    where thousands' xs "" = ("", 0, "")
          thousands' xs (' ':'t':'h':'o':'u':'s':'a':'n':'d':ys) = ("", (convert_back3 (reverse xs)) * 1000, ys)
          thousands' xs (y:ys) = thousands' (y:xs) ys
          (head, n, rest)  = thousands' "" s
