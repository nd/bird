data Direction = Nord | West | South | East 
                 deriving (Eq, Ord, Enum, Show)

reverse :: Direction -> Direction
reverse x = toEnum((fromEnum(x) + 2) `mod` 4)