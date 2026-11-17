-- file: b4.hs
-- Sat Nov 14 13:07:25 CET 2026

-- LZW decode

import Data.Map (fromList, member, insert, (!), Map)

tmp :: Map Int [Int]
tmp = fromList [(1, [65]), (2, [66])]
tmpA = member 1 tmp
-- insert 257 [65, 66] tmp
-- [(1,"A"),(2,"B"),(257,"AB")]

type Slovnik = Map Int [Int]
type Code = Int

data Context = Context {
 dict :: Slovnik, 
 nextCode :: Int,
 output :: [Int],
 prevOutput :: [Int]
}

check :: Slovnik -> Code -> Bool
check _ x | x < 256 = True
--check _ 256 = 
--check _ 257 =
check d x = member x d 

extract :: Slovnik -> Code -> [Int]
extract _ x | x < 256 = [x]
extract d x = d ! x

produce :: [Int] -> Code -> [Int]
produce prevOut x = undefined -- stopped here

test :: Context -> Code -> Context
test acc code = acc
 where
  -- is the current code in the dictionary
  d = dict acc
  present = check d code


{-

Summary:

output: string (first CodeWord)

while (there are more CodeWords)
 if (CurrentCodeWord is in the Dictionary)
  output: string (CurrentCodeWord)
 else
  output: PreviousOutput + PreviousOutput first character

 insert in the Dictionary: PreviousOutput + CurrentOutput first character

end while

-}

{-
ghci> minBound::Int
-9223372036854775808
ghci> maxBound::Int
9223372036854775807
ord 'A'
65
chr 65
'A'
chr :: Int -> Char
-}

-- test x = undefined

-- code x | x < 256 = x