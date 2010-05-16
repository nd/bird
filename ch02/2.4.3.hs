age :: (Int, Int, Int) -> (Int, Int, Int) -> Int
age (todayDay, todayMonth, todayYear) (birthDay, birthMonth, birthYear) = todayYear - birthYear

                            