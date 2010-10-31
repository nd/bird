T(++) (m,n) = Omega(m)

[] `++` ys   = ys
x:xs `++` ys = x:(xs `++` ys)

T(++) (0,n)   = Omega(1)
T(++) (m+1,n) = Omega(1) + T(m,n)
=>
T(++) (m,n) = m * Omega(1) = Omega(m)