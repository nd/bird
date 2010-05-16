data Day = Sun | Mon | Tue | Wed | Thu | Fri | Sat
         deriving (Eq, Ord, Enum, Show)

dayBefore :: Day -> Day
dayBefore d = if prevDayNumber < 0 then Sat else toEnum(prevDayNumber)
    where prevDayNumber = fromEnum(d) - 1
