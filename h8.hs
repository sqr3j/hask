-- h8.hs
-- 2026-10-12 13:18

data Book = Book Int
data Table = Tab | Fab

fun (Book 1) = 10

pun Tab = 1
pun Fab = 2

tun x = x + 3
vun a b = b

sun = foldr vun tun [1..100] 26
