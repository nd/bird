case(f, g) . plus(h, k) = case(f . h, g . k)

case(f, g) . plus(h, k) ==
case(f, g) . case(Left . h, Right . k) ==
case(case(f, g) . Left . h, case(f, g) . Right . k) ==
case(f . h, g . k)
