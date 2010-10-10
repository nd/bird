height = maxBtree . depths using
(n +) . height = maxBtree . down n

case Leaf x:
left side:
(n +) . height (Leaf x) = 
{def height}
(n +) 0 = n

right side:
maxBtree . down n (Leaf x) = 
{def down}
maxBtree Leaf n = 
{def maxBtree}
n


case Fork xt yt:
left side:
(n +) . height (Fork xt yt) = 
{def height}
(n +) 1 + (height xt `max` height yt) =
(n + 1) + (height xt `max` height yt)

right side:
maxBtree . down n (Fork xt yt) =
{def down}
maxBtree . Fork (down (n + 1) xt) (down (n + 1) yt) =
{def maxBtree}
(maxBtree (down (n + 1) xt)) `max` (mastBtree (down (n + 1) yt)) =
{induction hypothesis, m = n + 1}
((m +) . height) (Fork xt yt) =
{def height}
(n + 1) + (height xt `max` height yt)

maxBtree . depths =
{def depths}
maxBtree . down 0 =
{first result}
(0 +) . height = 
{arithmetic}
height