-- h6.hs

data Customer = Customer {
     customerID :: Int,
     customerName :: String
    } deriving (Show)

ben = Customer 2 "Ben"
