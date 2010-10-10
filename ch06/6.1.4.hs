height xt < size xt

case Leaf x:
left side:
height (Leaf x) = 
{def height}
0

right side:
size (Leaf x) =
{def size}
1

case (Fork xt yt):
left side:
height (Fork xt yt) = 
{def height}
1 + (height xt `max` height yt) <
{induction hypothesis}
1 + (size xt `max` size yt) <=
{arithmetic, the fact that (size yt >= 1) && (size xt >= 1)}
size xt + size yt

right side:
size (Fork xt yt) =
{def size}
size xt + size yt

