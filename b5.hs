-- file: b5.hs copy from b4.hs
-- Mon Nov 16 13:11:57 CET 2026

{-
what I don't like in b4.hs
produce takes previous output as input but it sometimes doesn't need it
check takes a dictionary but sometimes you do not need it
same thing extract

-- flatten = concat
-}

import Data.Map (fromList, member, insert, (!), empty, Map)
import Data.Char (chr)

tmp :: Map Int [Int]
tmp = fromList [(65, [65]), (66, [66])]
tmpA = member 1 tmp
-- insert 257 [65, 66] tmp
-- [(1,"A"),(2,"B"),(257,"AB")]

type Slovnik = Map Int [Int]
type Code = Int

data Context = Context {
 dict :: Slovnik, 
 nextCode :: Int,
 output :: [[Int]],
 prevOutput :: [Int]
} deriving Show

-- if cond out = out1 else out = out2
test4 prev codeword dict | member codeword dict = dict ! codeword
test4 prev codeword dict = ft prev

-- this function produces current output
ft3 _ c _ | c < 256 = [c] 
ft3 prev codeword dict | member codeword dict = dict ! codeword
ft3 prev _        _ = ft prev
currentOutput = ft3

test5 = test4 [] 1 tmp
test6 = ft3 [100,200,300] 1 tmp

test8 = test start 65

{-
-- test1 = fg "BABAABAAA"
-- [66,65,256,257,65,260]
-}

-- build a context
--act :: [Int] -> Context
act :: [Int] -> [Int]
act (x:xs) = fg
 where
  start = Context empty startCode [[x]] [x]
  startCode = 256
  ab = foldl test start xs
  cd = output ab
  fg = concat cd

dtest1 = act [66,65,256,257,65,260]
ctest1 = [ chr a | a <- dtest1]

dtest2 = act [66,65,256,257,82,260,65]
ctest2 = [ chr a | a <- dtest2]

dtest3 = act [97,256,98,258,259,257,261]
ctest3 = [ chr a | a <- dtest3]

start :: Context
start = Context tmp 256 [[97]] [97]

test :: Context -> Code -> Context
test acc code = Context d' (next + 1) (out ++ [current]) current
 where
  d = dict acc
  out = output acc
  prev = prevOutput acc
  next = nextCode acc
  current = currentOutput prev code d
  whatToInsert = ft2 prev current
  d' = insert next whatToInsert d

-- output: string(CurrentCodeWord)
test3 = e
 where
  d = tmp
  codeWord = 2
  e = d ! codeWord

-- output: PreviousOutput + PreviousOutput first character 
-- found a bug: previous = 97, 97, 98 = aab Tue Nov 17 13:03:46 CET 2026
-- should be aab+a = aaba; actual = aaab
--test1 = x : prev_output
test1 = prev_output ++ [x]
 where
  --prev_output = [25, 11, 12]
  --prev_output = [11]
  prev_output = [97, 97, 98]
  (x:xs) = prev_output

--ft prev@(x:xs) = x : prev
ft prev@(x:xs) = prev ++ [x]

-- insert in the dict: PrevOutput + CurrentOutput first char
test2 = prev ++ [x]
 where
  prev = [1,2,3]
  current = [25, 4]
  (x:xs) = current

ft2 prev current@(x:xs) = prev ++ [x]

-- insert in the dict
test7 = insert 257 [65, 66] tmp
 where
  d = tmp

ft7 prev current code dict = insert code x dict
 where
  x = ft2 prev current

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