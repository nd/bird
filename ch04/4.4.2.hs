unzip . zipp = id

proof by induction on x:

x is undefined:
unzip . zipp (undefined, y) =
{case exhaustion in zipp}
unzip undefined =
{case exhaustion in unzip (map)} 
undefined

x is []:
unzip . zipp ([], y) =
{def of zip}
unzip [] =
{def of unzip} 
[]

x is (x:xs):
unzip . zipp ((x:xs), (y:ys)) = 
{def of zip}
unzip (x, y):zipp(xs, ys) = *


we have to proof that
unzip (x, y):tail = ((x:(map fst tail)), (y:(map snd tail)))

by induction on tail:
tail is undefined:
left side:
unzip (x, y):undefined = 
{def of unzip}
pair (map fst, map snd) ((x, y):undefined)=
{def of map}
(undefined, undefined)
right side:
((x:(map fst tail)), (y:(map snd tail))) =
{def of map}
((x:undefined), (y:undefined)) =
{def of :} 
(undefined, undefined)

tail is []:
left side:
unzip (x, y):[] =
{def of unzip}
pair (map fst, map snd) [(x, y)] =
{def of map, fst, snd}
([x], [y])
right side:
((x:(map fst [])), (y:(map snd []))) =
{def of map} 
([x], [y])

tail is ((x', y'):tail):
left side:
unzip (x, y):(x', y'):tail =
{def of unzip}
pair (map fst, map snd) (x, y):(x', y'):tail =
{def of map, fst, snd}
(x:x':(map fst tail), y:y':(map snd tail))
right side:
((x:(map fst ((x', y'):tail))), (y:(map snd ((x', y'):tail)))) =
{def of map, fst, snd}
(x:x':(map fst tail), y:y':(map snd tail)) 


so

* =
unzip (x, y):zipp(xs, ys) =
((x:(map fst zipp(xs, ys))), (y:(map snd zipp(xs, ys)))) =
= ((x:(unzip zipp (xs, ys))), (y:(unzip zipp (xs, ys))))
= ((x:xs), (y:ys)) =
right side