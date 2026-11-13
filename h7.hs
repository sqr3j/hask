-- h7.hs
-- 2026-10-07 14:51

-- Pattern matching

lucky :: (Integral a) => a -> String
lucky 7 = "LUCKY NUMBER 7!"
lucky x = "Sorry, you're out of luck, pal!"

-- ghci> lucky 7.00000001
-- "Sorry, you're out of luck, pal!"
-- ghci> lucky 7.00000000000000000000000000001
-- "LUCKY NUMBER 7!"

