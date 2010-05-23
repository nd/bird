Succ Zero * n = n

case(Zero)
    Succ Zero * Zero = Zero (by definition)

case(Succ n)
    Succ Zero * Succ n = (Succ Zero * n) + Succ Zero = n + Succ Zero = Succ(n + Zero) = 
    {since Zero is unit of +} = 
    Succ n