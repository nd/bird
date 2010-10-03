prove that unlines (lines xs) = xs

xs is []:
unlines (lines []) = 
{def of lines, def of span} = 
unlines [""] = 
{def of unlines} 
"" which is == []

xs is x:xs, x /= '\n', zs' for xs is not null
unlines (lines x:xs) = 
{def of lines} 
unlines ((x:ys'):lines(tail zs')) =
{def of unlines, foldr1} 
x:ys' ++ '\n' ++ zs' and ys'++'\n'++zs'==xs by induction hypothesis

xs is x:xs, x /= '\n', zs' for xs is null
unlines (lines x:xs) = 
{def of lines}
unlines [(x:ys')] =
{def of unlines} 
x:ys' and ys' == xs by induction hypothesis

xs is x:xs, x=='\n', zs' for xs is not null
unlines (lines x:xs) =
{def of lines}
unlines ("":lines(tail zs)) =
{fail zs = zs1'}
unlines "":(lines xs) =
{def of unlines}
""++'\n'++(unlines (lines xs)) = x:xs

xs is x:xs, x=='\n', zs' for xs is null
unlines (lines x:xs) = 
{def of lines}
unlines ("":lines("")) = 
{def of lines}
unlines ("":"") = 
{def of unlines} =
""++'\n'++"" == x:xs by induction hypothesis
