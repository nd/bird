foldl (-) x xs = x - sum xs -- true
foldr (-) x xs = x - sum xs -- false