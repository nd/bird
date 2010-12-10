do {C; do {D; r}} = do {C; D; r}

both sides expanded to:
C >>= q
  where q c = D >>= v
              where v d = r
