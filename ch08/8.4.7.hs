import Bag

sortBag :: (Ord a) => Bag a -> [a]
sortBag b 
    | isEmpty b = []
    | otherwise = (minBag b) : (sortBag (delMin b))
