-- file: b3.hs (copy of b1.hs)
-- Sat Nov 14 12:31:23 CET 2026

-- LZW

-- changes
-- deduplicate list and build a dictionary
-- Data.List nub

-- ord Data.Char
-- ord 'A' = 65
-- ord 'B' = 66
-- ord \n = 10

{-
ghci> nub "aaa"
"a"
ghci> nub "aaabbb"
"ab"
ghci> nub "aaabbbcccdddbbbb"
"abcd"

-}

import Data.Map (fromList, member, insert, (!), Map)
-- member :: O(log n). Is the key a member of the map?
-- (!) :: O(log n). Find the value at a key. Calls error when the element can not be found.

import Data.List (nub)
import Data.Char (ord)

--type Slovnik = Map Int String
type Slovnik = Map String Int
type Codes = [Int]
type Code = Int

temp :: Map Int String
temp = fromList [(1, "A"), (2, "B")]

temp2 :: Map String Int
temp2 = fromList [("A", 1), ("B", 2)]

-- build a dictionary
build :: [Char] -> Map [Char] Int
build xs = cs
 where
  as = nub xs
  bs = [ (a:[], ord a) | a <- as ]
  cs = fromList bs
  

data Acu = Acu {
  dict:: Slovnik,
  prefix :: String,
  output :: Codes,
  current :: Int -- next codeword to insert in the dictionary
} deriving Show

input = "BABAABAAA"

acu :: Acu
acu = Acu temp2 "B" [] 3

ab xs@(x:rest) = foldl test start rest
 where
  slovnik = build xs
  prefix = [x]
  start = Acu slovnik prefix [] codeword
  codeword = 256
  
cd :: Acu
cd = ab input

fg :: [Char] -> [Int]
fg xs = result
 where
  c = ab xs
  d = dict c
  e = prefix c
  os = output c
  code = d ! e
  out = code : os
  result = reverse out

-- tests
test1 = fg "BABAABAAA"
-- [66,65,256,257,65,260]

test2 = fg "BABAABRRRA"
-- [66,65,256,257,82,260,65]
  
test3 = fg "aaabbbbbbaabaaba"
-- [97,256,98,258,259,257,261]

exists :: String -> Char -> Slovnik -> Bool 
exists pref char dictionary = b
 where
  a = pref ++ [char]
  b = member a dictionary

test :: Acu -> Char -> Acu
test acc x = if e then Acu d pref' out curr
                  else Acu d' [x] out' codeword
 where 
  d = dict acc
  out = output acc
  out' = code : out
  pref = prefix acc
  e = exists pref x d
  code = d ! pref
  curr = current acc
  pref' = pref ++ [x]
  d' = insert pref' curr d
  codeword = curr + 1




