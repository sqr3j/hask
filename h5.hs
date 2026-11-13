-- h5

quux :: t -> [Char]
quux a = let a = "foo" in a ++ "bar"

bar = (let x = 1 in x + 2, 17)

foo = let 
 a = 1
 b = 2
 c = 3 + a in a + c

baz x = c
 where a = 1
       b = 2
       c = b + 1