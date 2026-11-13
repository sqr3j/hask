-- file: a2.hs
-- Tue Oct 27 13:07:08 CET 2026

import Data.Bits

x :: Int
x = 26

y :: Int
y = 5

z = x .|. y

boldr f acc [] = acc
boldr f acc (x:xs) = f x (boldr f acc xs)

ab = boldr (:) [] [1..5]
cd = foldr (:) [] [1..5]
ef = foldr (:) [7,8,9] [1..5]

-- xy = boldr (\ x y -> if x < )

