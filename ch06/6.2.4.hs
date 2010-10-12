inordered (insert x xt) = True

case Null:
inordered (insert x Null) = 
{def insert}
inordered (Fork Null x Null) =
{def inordered}
ordered . flatten (Fork Null x Null) = 
{def flatten} 
ordered [x] = True

case Fork xt y yt = 
inordered (insert x (Fork xt y yt)) =
{def insert}
inordered (insert x (Fork xt y yt))

case x == y:
inordered (insert x (Fork xt y yt)) =
{def insert}
inordered (Fork xt y yt) = True 
{by definition of Stree}

case x < y:
inordered (Fork (insert x xt) y yt) = 
{zt = (insert x xt)}
inordered (Fork zt y yt) =
{def inordered}
ordered . flatten (Fork zt y yt) =
ordered flatten zt ++ [y] ++ flatten yt 
[y] ++ flatten yt is ordered by definition of Stree
flatten zt is ordered by induction hypothesis
every element of flatten zt is <= y => result is ordered

case x > y:
-//-
