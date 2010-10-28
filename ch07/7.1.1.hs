I don't know what .. in list comprehension means.

innermost

head [1..1000] =
{def ..}
head 1:2:..:1000:[] =
{def head}
1

map f [1..3] where f n = 10 * 10 + n =
{def ..}
map f 1:2:3:[] where f n = 10 * 10 + n =
{def map}
(f 1):map f 2:3:[] where f n = 10 * 10 + n =
{def f}
(10 * 10 + 1):map f 2:3:[] where f n = 10 * 10 + n =
{def *}
(100 + 1):map f 2:3:[] where f n = 10 * 10 + n =
{def +}
101:map f 2:3:[] where f n = 10 * 10 + n =
{def map}
101:(f 2):map f 3:[] where f n = 10 * 10 + n =
{def f}
101:(10 * 10 + 2):map f 3:[] where f n = 10 * 10 + n =
{def *}
101:(100 + 2):map f 3:[] where f n = 10 * 10 + n =
{def +}
101:102:map f 3:[] where f n = 10 * 10 + n =
{def map}
101:102:(f 3):map f [] where f n = 10 * 10 + n =
{def f}
101:102:(10 * 10 + 3):map f [] where f n = 10 * 10 + n = 
{def *}
101:102:(100 + 3):map f [] where f n = 10 * 10 + n =
{def +}
101:102:103:map f [] where f n = 10 * 10 + n = 
{def map}
101:102:103:[]

outermost

head [1..1000] = 
{def head}
1

map f [1..3] where f n = 10 * 10 + n =
{def map}
(f 1):map f [2..3] where f n = 10 * 10 + n =
{def f}
(10 * 10 + 1):map f [2..3] where f n = 10 * 10 + n =
{def *}
(100 + 1):map f [2..3] where f n = 10 * 10 + n =
{def +}
101:map f [2..3] where f n = 10 * 10 + n =
{def map}
101:(f 2):map f [3] where f n = 10 * 10 + n = 
{def f}
101:(10 * 10 + 2):map f [3] where f n = 10 * 10 + n = 
{def *}
101:(100 + 2):map f [3] where f n = 10 * 10 + n = 
{def +}
101:102:map f [3] where f n = 10 * 10 + n = 
{def map}
101:102:(f 3):map f [] where f n = 10 * 10 + n = 
{def f}
101:102:(10 * 10 + 3):map f [] where f n = 10 * 10 + n = 
{def *}
101:102:(100 + 3):map f [] where f n = 10 * 10 + n = 
{def +}
101:102:103:map f [] where f n = 10 * 10 + n = 
{def map}
101:102:103:[]

outermost graph

head [1..1000] =
{def head}
1

map f [1..3] where f n = 10 * 10 + n =
{def map}
(f 1):map f [2..3] where f n = 10 * 10 + n =
{def f}
(10 * 10 + 1):map f [2..3] where f n = 10 * 10 + n =
{def *}
(100 + 1):map f [2..3] where f n = 100 + n =
{def +}
101:map f [2..3] where f n = 100 + n =
{def map}
101:(f 2):map f [1..3] where f n = 100 + n =
{def f}
101:(100 + 2):map f [1..3] where f n = 100 + n =
{def +}
101:102:map f [1..3] where f n = 100 + n = 
{def map}
101:102:(f 3):map f [] where f n = 100 + n = 
{def f}
101:102:(100 + 3):map f [] where f n = 100 + n = 
{def +}
101:102:103:map f [] where f n = 100 + n = 
{def map}
101:102:103:[]