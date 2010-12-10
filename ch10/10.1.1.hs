(>>) :: IO () -> IO () -> IO ()
(>>) p q = p >>= v
    where v _ = q