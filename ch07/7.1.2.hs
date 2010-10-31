sort = foldr insert []

insert x []     = [x]
insert x (y:ys) = if x <= y then x:y:ys else y:insert x ys

eager:

sort [3,4,2,1] =
{def sort}
foldr insert [] [3,4,2,1] =
{def foldr}
insert 3 (foldr insert [] [4,2,1]) =
{def foldr}
insert 3 (insert 4 (foldr insert [] [2,1])) =
{def foldr}
insert 3 (insert 4 (insert 2 (foldr insert [] [1]))) =
{def foldr}
insert 3 (insert 4 (insert 2 (insert 1 (foldr insert [] [])))) =
{def foldr}
insert 3 (insert 4 (insert 2 (insert 1 []))) =
{def insert}
insert 3 (insert 4 (insert 2 [1])) =
{def insert}
insert 3 (insert 4 (1:insert 2 [])) =
{def insert}
insert 3 (insert 4 (1:[2])) =
{def :}
insert 3 (insert 4 [1,2]) =
{def insert}
insert 3 (1:insert 4 [2]) =
{def insert}
insert 3 (1:2:insert 4 []) =
{def insert}
insert 3 (1:2:[4]) =
{def :}
insert 3 (1:[2,4]) =
{def :}
insert 3 ([1,2,4]) =
{def insert}
1:insert 3 [2,4] =
{def insert}
1:2:insert 3 [4] =
{def insert}
1:2:3:[4] =
{def :}
1:2:[3,4] =
{def :}
1:[2,3,4] =
{def :}
[1,2,3,4]

lazy:
sort [3,4,2,1] =
{def sort}
foldr insert [] [3,4,2,1] = 
{def foldr}
insert 3 (foldr insert [] [4,2,1]) = 
{def foldr}
insert 3 (insert 4 (foldr insert [] [2,1])) = 
{def foldr}
insert 3 (insert 4 (insert 2 (foldr insert [] [1]))) = 
{def foldr}
insert 3 (insert 4 (insert 2 (insert 1 []))) =
{def insert}
insert 3 (insert 4 (insert 2 [1])) =
{def insert}
insert 3 (insert 4 (1:insert 2 [])) =
{def insert}
insert 3 (insert 4 1:[2]) =
{def insert}
insert 3 (1:insert 4 [2]) =
{def insert}
insert 3 (1:2:insert 4 []) =
{def insert}
insert 3 (1:2:[4]) =
{def insert}
1:insert 3 2:[4] =
{def insert}
1:2:insert 3 [4] =
{def insert}
1:2:3:[4]
