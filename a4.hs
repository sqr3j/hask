-- file: a4.hs
-- Fri Nov  6 11:39:02 CET 2026

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


-- writeFile :: FilePath -> String -> IO ()

start :: IO ()
start = writeFile "test.c" "ABC\nD"

{-
ray-shere intersection 
there might be no intersection 
the return type Nothing | Just (1, 1)

intersect ray sphere
ray has origin and direction
origin x0, y0
direction a0, b0

-- sphere is constant centered at (0, 0) with a radius of 1

intersect :: (Num a, Ord a, Floating a) => (a, a) -> (a, a) -> Maybe (a, a)
intersect origin@(x0, y0) direction@(a0, b0) = 
  if d < 0 then Nothing
           else Just (t1, t2)
  where 
   a = 1
   b = origin *| direction
   c = origin *| origin
   d = b * b - c + 1
   sqrtd = sqrt d
   t1 = -b - sqrtd
   t2 = -b + sqrtd
   
-- trying to debug
ghci> fa (0,-5) (1,0)
Nothing
ghci> fa (0,-5) (0,1)
Just (4.0,6.0)

Correct:
ghci> fa (-5,0) (1,0)
Just (4.0,6.0)

ghci> fa (-5,1) (1,0)
Just (5.0,5.0)

ghci> fa (1,0) (1,0)
Just (-2.0,0.0)

-}

intersect :: (Num a, Ord a, Floating a) => (a, a) -> (a, a) -> Maybe (a, a)
intersect origin@(x0, y0) direction@(a0, b0) = 
  if d < 0 then Nothing
           else Just (t1, t2)
  where 
   a = 1
   b = origin *| direction
   c = origin *| origin
   d = b * b - c + 1
   sqrtd = sqrt d
   t1 = -b - sqrtd
   t2 = -b + sqrtd
     
fa = intersect -- for test purposes

{-
ghci> fa (1,2) (1,2)
Just (-9.582575694955839,-0.41742430504416017)
-}


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