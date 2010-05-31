foldn Succ Zero n = n

case(n = undefined):
    foldn Succ Zero undefined = undefined (by definition - case exhaustion)
case(n = Zero):
    foldn Succ Zero Zero = Zero (by definition)
case(n = Succ n):
    foldn Succ Zero (Succ n) = Succ (foldn Succ Zero n) = (by induction hypothesis) = Succ n