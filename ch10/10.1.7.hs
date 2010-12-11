import Char

write :: String -> IO ()
write [] = return ()
write (c:cs) = putChar c >> write cs

reveal :: IO ()
reveal = do write "?: "
            c <- getChar
            write ((show (Char.ord c)) ++ "\n")
            reveal