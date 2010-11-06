T(n+1) = k*T(n) + Omega(k^(n+1)) ==
{T(n)=Omega(n*k^n)}
T(n+1) = k*Omega(n*k^n) + Omega(k^(n+1)) ==
T(n+1) = k*Omega(n*k^n) + Omega(k*k^n) ==
T(n+1) = Omega(k*(n+1)*k^n) ==
T(n+1) = Omega((n+1)*k^(n+1)) 
QED


