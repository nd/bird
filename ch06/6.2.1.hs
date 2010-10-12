Principle is:
Case (undefined), p(undefined) holds
Case (Null), p(Null) holds
Case (Fork xt x yt), if p(xt) holds, p(yt) holds, then p(Fork xt x yt) holds

height t <= size t < 2 ^ (height t)

height t <= size t

case Null:
left side:
height Null = 0

right side:
size Null = 1

case (Fork xt x yt):
left side:
height (Fork xt x yt) = 1 + (height xt `max` height yt)

right side:
size (Fork xt x yt) = size xt + size yt
1 + (height xt `max` height yt) <= size xt + size yt by induction hypothesis

I will skip the rest