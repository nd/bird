inits :: [a] -> [[a]]

(map (map f)) . inits = inits . map f