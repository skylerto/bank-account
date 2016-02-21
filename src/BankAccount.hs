module BankAccount where

{-
  Bank Account Data Type.
-}
data BankAccount = BankAccount {
    accountHolder :: String,
    balance :: Int
  } deriving (Eq, Show)

{-
  Function Definitions
-}
deposit :: BankAccount -> Int -> IO (BankAccount)
withdraw :: BankAccount -> Int -> IO (BankAccount)
transfer :: BankAccount -> BankAccount -> Int -> IO (BankAccount, BankAccount)
printbal :: BankAccount -> IO (Int)

{-
  Function Declarations
-}
-- amount must be greater than 0
deposit account amount
  | amount > 0 = return account { balance =  (bal + amount)}
  | otherwise = return account
  where bal = balance account

-- amount must be greater than 0
withdraw account amount
  | bal < amount = return account
  | amount > 0 = return account { balance =  (bal - amount)}
  | otherwise = return account
  where bal = balance account

-- transfer from an acount to another account a desired amount
transfer from to amount
  | amount <= 0 = return (from, to)
  | balance from < amount = return (from, to)
  | otherwise = return ((from { balance =  ((balance from) - amount)}),(to { balance =  ((balance to) + amount)}))


-- Print the Balance
printbal account = return balance account
