1. isEmpty empty = True                                  

isEmptyc emptyc =
{def emptyc}
isEmptyc [] =
{def isEmptyc, def null}
True

2. isEmpty (join x xq) = False                           

isEmptyc (joinc x xq) =
{def joinc}
isEmptyc xq ++ [x] =
{def isEmptyc, def null}
False

3. isEmpty (join x undefined) = undefined                                

isEmptyc (joinc x undefined) =
{def joinc}
isEmptyc undefined =
{def null}
undefined
                                                         
4. front (join x emtpy) = x                              

frontc (joinc x emptyc) =
{def emptyc, joinc}
frontc [] ++ [x] = 
{def ++}
frontc [x] = 
{def frontc} 
x

5. front (join x (join y xq)) = front (join y xq)        
                                                         
frontc (joinc x (joinc y xq)) = 
{def joinc} 
frontc (joinc x (xq ++ [y])) = 
{def joinc} 
frontc xq ++ [y] ++ [x] 

case xq is []
frontc [] ++ [y] ++ [x] =
{def frontc, ++}
y

case xq is (z:zs)
frontc (z:zs) ++ [y] ++ [x] =
{def frontc}
z

in both cases it is equal to front (join y xq)

6. back (join x empty) = empty                           

backc (joinc x empty) = 
{def joinc, ++}
backc [x] = 
{def backc}
[]

which is equals to emptyc

7. back (join x (join y xq)) = join x (back (join y xq)) 

backc (joinc x (joinc y xq)) = 
{def joinc}
backc (xq ++ [y] ++ [x]) =

case xq is []

backc [] ++ [y] ++ [x] =
{def ++}
[x]

and joinc x (backc (joinc y [])) = 
{def joinc, ++}
joinc x (backc [y]) = 
{def backc}
joinc x [] =
{def joinc}
[x]

case xq is (z:zs)
backc (z:zs) ++ [y] ++ [x] =
{def backc} 
zs ++ [y] ++ [x]

and joinc x (backc (joinc y (z:zs))) = 
{def joinc}
joinc x (backc (z:zs) ++ [y]) =
{def backc}
joinc x (zs ++ [y]) = 
{def joinc}
zs ++ [y] ++ [x]

QEDg
