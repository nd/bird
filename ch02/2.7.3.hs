type Date = (Day, Mon, Year)
type Day = Int
type Mon = Int
type Year = Int

showDate :: Date -> IO()
showDate (d, m, y) = putStr ((show d) ++ " " ++ (getMonth m) ++ ", " ++ (show y) ++ "\n")

getMonth :: Mon -> String
getMonth 1  = "January"
getMonth 2  = "February"
getMonth 3  = "March"
getMonth 4  = "April"
getMonth 5  = "May"
getMonth 6  = "June"
getMonth 7  = "July"
getMonth 8  = "Augest"
getMonth 9  = "September"
getMonth 10 = "October"
getMonth 11 = "November"
getMonth 12 = "December"

