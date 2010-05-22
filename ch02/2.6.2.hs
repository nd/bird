data Jane = MkJane Int 

newtype Dick = MkDick Int

diff :: (Either Jane Dick) -> Bool
diff (Left (MkJane a)) = True
diff (Right (MkDick b)) = True

--diff (Left undefined) will return undefined, because undefined /=
--MkJane undefined, and diff(Right undefined) returns True, sinse
--(MkDick undefined) == undefined

