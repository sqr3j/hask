-- file: b2.hs
-- Fri Nov 13 12:25:23 CET 2026

-- Real World Haskell Chapters 12 (chunks) and 13 (split) /etc/passwd :

{-# OPTIONS_GHC -Wno-x-partial #-}

split :: Eq a => a -> [a] -> [[a]]
split delim str = 
 let 
     (before, remainder) = span (/= delim) str
     in
     before : case remainder of
                   [] -> []
                   x -> split delim (tail x)

chunking :: ([a] -> ([a], [a])) -> [a] -> [[a]]
chunking _ [] = []
chunking f str =
 let (before, remainder) = f str
 in
 before : case remainder of
               [] -> []
               x -> chunking f x

chunksOf :: Int -> [a] -> [[a]]
chunksOf n = chunking (splitAt n)

chunk str = 
 let
     (before, remainder) = splitAt 3 str
     in
     before : case remainder of
                   [] -> []
                   x -> chunk x



{-
ghci> :t splitAt 0
splitAt 0 :: [a] -> ([a], [a])

ghci> :t splitAt 
splitAt :: Int -> [a] -> ([a], [a])
ghci> :t span
span :: (a -> Bool) -> [a] -> ([a], [a])
-}