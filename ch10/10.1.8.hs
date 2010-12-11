import System.IO
import Data.Char
import IO

getCh :: IO Char
getCh = do 
  hSetEcho stdin False
  c <- getChar
  hSetEcho stdin True
  return c

hangman :: IO ()
hangman = do putStrLn "Think of a word: "
             word <- silentReadln
             putStrLn "Now try to guess it!"
             guess word

silentReadln :: IO String
silentReadln = do c <- getCh
                  if c == '\n'
                     then do putChar c
                             return []
                     else do putChar '-'
                             cs <- silentReadln
                             return (c:cs)

guess :: String -> IO ()
guess word = do putStr "guess: "
                cs <- silentReadln
                if cs == word
                   then putStrLn "You got it!"
                   else do putStrLn (Main.compare word cs)
                           guess word

compare :: String -> String -> String
compare word cs = map check (zip word cs)
                  where check (a, b) = if a == b then a else '-'

member :: Eq a => [a] -> a -> Bool
member xs x = length ys > 0
    where ys = filter (\z -> z == x) xs 