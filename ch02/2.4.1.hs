cross(f, g) . cross(h, k) = 
pair(f . fst, g . snd) . cross(h, k) =
pair(f . fst . cross(h, k), g . snd . cross(h, k)) =
pair(f . fst . pair(h . fst, k . snd), g . snd . pair(h . fst, k . snd)) =
pair(f . h . fst, g . k . snd) =
cross(f . h, g . k)
