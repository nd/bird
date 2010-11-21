isEmpty (delMin (insert x xs)) = isEmpty xs
delMin (insert x (insert y empty)) = insert (x max y) empty