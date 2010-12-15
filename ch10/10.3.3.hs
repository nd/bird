concatm . mapm concatm = concatm . concatm

left side:
concatm . mapm concatm =
{def concatm}
id <> id . mapm concatm = 
{leapfrog}
(id . mapm concatm) <> id =
(mapm concatm) <> id = 
(id <> (return . concatm)) <> id =
id <> ((return . concatm) <> id) = 
id <> ((return <> id) . concatm) =
id <> (id . concat) =
id <> id

right side:
concatm . concatm = 
{def concatm}
id <> id . concatm = 
(id . concat) <> id = 
concat <> id = 
id <> id <> id

+ some magic with types, which I don't understand yet