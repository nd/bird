> mkBag "hello"
Fork 5 'e' 
         (Fork 3 'l' 
                   (Fork 2 'l' 
                             (Fork 1 'o' Null Null)
                             Null)
                   Null)
         (Fork 1 'h' Null Null)

> mkBag "world"
Fork 5 'd' 
         (Fork 3 'o' 
                   (Fork 1 'w' Null Null)
                   (Fork 1 'r' Null Null))
         (Fork 1 'l' Null Null)

> union (mkBag "hello") (mkBag "world")
Fork 10 'd' 
         (Fork 6 'e' 
                   (Fork 3 'l' 
                             (Fork 2 'l' 
                                       (Fork 1 'o' Null Null)
                                       Null)
                             Null)
                   (Fork 2 'h' 
                             (Fork 1 'l' Null Null)
                             Null))
         (Fork 3 'o' 
                   (Fork 1 'w' Null Null)
                   (Fork 1 'r' Null Null))