-- h3.hs

lucky :: (Integral a) => a -> String
lucky 7 = "LUCKY NUMBER 7!"
lucky x = "Sorry, you're out of luck, pal!"

densityTell :: (RealFloat a) => a -> String
densityTell density
 | density < 1.2 = "ride in the sky"
 | density <= 1000.0 = "Have fun swimming"
 | otherwise = "you're going to sink"
 
densityTell2 :: (RealFloat a) => a -> a -> String
densityTell2 mass volume
 | mass / volume < 1.2 = "ride in the sky"
 | mass / volume <= 1000.0 = "Have fun swimming"
 | otherwise = "you're going to sink"
 

fun :: (RealFloat a) => a -> a -> String
fun mass volume
 | density < 1.2 = "ride in the sky"
 | density <= 1000.0 = "Have fun swimming"
 | otherwise = "you're going to sink"
 where density = mass / volume
       air = 1
 
