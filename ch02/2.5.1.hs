fun :: (Either Bool Char) -> Bool

fun (Left a) = True
fun (Right c) = False
fun undefined = fun undefined
