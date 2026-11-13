x = [x | x <- [1..5], let a = 1; b = 2]

y = [x * c | x <- [3..7], let a = 1, let b = 2, let c = a + b]


