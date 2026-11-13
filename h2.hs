-- h2.hs
data A = A Int
 deriving (Eq, Show)
 
a = A 1
b = A 2
c = A 1

duble x = x + x
doubleSmall x = if x <= 10 then x*2 else x
d = [ doubleSmall x | x <- [1..15]]
e = [ y | x <- [1..15], let y = doubleSmall x ]

conanO'Brian = "It's a me, Conan O'Brian!"