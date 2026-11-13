x = 10
y = 20
data BookInfo = Book Int String [String] deriving (Show)

book = Book 72349 "fjdsl" ["dsjfl", "dfsf"]

data MagazineInfo = Magazine Int String [String]
 deriving (Show)

mag = Magazine 1 "ABC" []


-- instance Show BookInfo -- Defined at h1.hs:3:52

-- instance Show MagazineInfo = print