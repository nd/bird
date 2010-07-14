filter p = concat . map box
    where box x = if p x then [x] else []