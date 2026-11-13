-- file: h9
data Bank = Bank deriving (Show)

fun :: Bank -> Int
-- fun x | x == Bank = 2
fun Bank = 3

gun :: (a, a, a, a) -> (a, a, a)
sun :: (a, a, a) -> (a, a)
mun :: (a, a) -> (a, a)

gun (x,y,z,w) = (x,y,z)
sun (x,y,z) = (y,z)
mun (x,y) = (y,x)

tun :: (a, a, a, a) -> (a, a)
tun = mun . sun . gun

vun:: (Integral a) => (a, a) -> (a, a) -> (a, a)
vun (x,y) (z,w) = (x + z, y + w)