sieve (p:xs) = [x | x <- xs, x `mod` p /= 0]

primes = map head (iterate sieve [2..])

first n = take n primes

less_than n = takeWhile (< n) primes

-- this is really beautiful