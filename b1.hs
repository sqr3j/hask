-- file: b1.hs
-- Wed Nov 11 11:49:40 CET 2026
-- LZW

import Data.Map (fromList, member, insert, (!), Map)
-- member :: O(log n). Is the key a member of the map?
-- (!) :: O(log n). Find the value at a key. Calls error when the element can not be found.

--type Slovnik = Map Int String
type Slovnik = Map String Int
type Codes = [Int]
type Code = Int

temp :: Map Int String
temp = fromList [(1, "A"), (2, "B")]

temp2 :: Map String Int
temp2 = fromList [("A", 1), ("B", 2)]

data Acu = Acu {
  dict:: Slovnik,
  prefix :: String,
  output :: Codes,
  current :: Int
} deriving Show

input = "BABAABAAA"

acu :: Acu
acu = Acu temp2 "B" [] 3

acu2 :: String -> Acu
acu2 prefix = Acu temp2 prefix [] 3

ab (x:xs) = foldl test (acu2 [x]) xs
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




