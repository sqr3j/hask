-- file: a3.hs
-- Sat Oct 31 12:48:50 CET 2026
-- Thu Nov  5 15:50:37 CET 2026

-- todo: a dot product for tuple and triple
-- ray - sphere intersection

--import Data.List.Split

(+|) :: Num a => (a, a) -> (a, a) -> (a, a)
(a, b) +| (a', b') = (a + a', b + b')

(+|+) :: Num a => (a, a, a) -> (a, a, a) -> (a, a, a)
(a, b, c) +|+ (a', b', c') = (a + a', b + b', c + c')

(*|) :: Num a => (a, a) -> (a, a) -> a
(a, b) *| (a', b') = a * a' + b * b'

(*|*) :: Num a => (a, a, a) -> (a, a, a) -> a
(a, b, c) *|* (a', b', c') = a * a' + b * b' + c * c'

-- data BookInfo = Book Int deriving Show

-- data BookInfo = Book { get :: Int } deriving Show

-- data BookInfo = Book { get :: Int } | Cbook { get :: Int } deriving Show

-- writeFile :: FilePath -> String -> IO ()

start :: IO ()
start = writeFile "test.c" "ABC\nD"

f (x:y:xs) = [x, y] : f xs
f x = [x]

{-

P3
# "P3" means this is a RGB color image in ASCII
# "3 2" is the width and height of the image in pixels
# "255" is the maximum value for each color
# This, up through the "255" line below are the header.
# Everything after that is the image data: RGB triplets.
# In order: red, green, blue, yellow, white, and black.
3 2
255
255   0   0
  0 255   0
  0   0 255
255 255   0
255 255 255
  0   0   0


-}