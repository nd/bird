-- let's suppose there is 2 different representations of x: 10 * y + z and 10 * u + v
-- if y == u and z /= v we get:
-- 10 * y + z == 10 * u + v 
-- z == v - contradiction
--  
-- if y /= u and z == v we get:
-- 10 * y + z == 10 * u + v 
-- 10 * y == 10 * u 
-- y == u - contradiction
--  
-- if y /= u and z /= v we get:
-- 10 * y + z == 10 * u + v 
-- 10 * y == 10 * u + v - z
-- v - z couldn't give us 10 because they both <= 5, so they cannot change order =>
-- y == u and u == v

repint :: Integer -> (Integer, Integer)
repint x = if (abs b) < 5 then (a, b) else (a', b')
    where a = x `div` 10
          b = x `mod` 10
          a' = a + 1
          b' = x - a' * 10
