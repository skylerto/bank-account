import Data.List
import System.IO

{-
  Bank Account Data Type.
-}
data BankAccount = BankAccount {accountHolder :: String, balance :: Int} deriving (Eq, Show)

{-
  Function Definitions
-}
deposit :: BankAccount -> Int -> IO (BankAccount)
withdraw :: BankAccount -> Int -> IO (BankAccount)
transfer :: BankAccount -> BankAccount -> Int -> IO (BankAccount, BankAccount)
printbal :: BankAccount -> Int

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
printbal account = balance account

{-
  Use Case
-}
main = do

  -- Create an account named B1 with a 0 balance
  let b1 = BankAccount {accountHolder = "B1", balance = 0}
  b1 <- deposit b1 10 -- Deposit $10 into B1
  print b1

  -- Create an account named B2 with a 0 balance
  let b2 = BankAccount {accountHolder = "B2", balance = 0}
  b2 <- deposit b2 20 -- Deposit $20 into B2
  print b2
  b2 <- withdraw b2 10 -- Withdraw $10 into B2
  print b2

  (b1, b2) <- transfer b1 b2 10 -- Transfer $10 from B1 into B2
  print b1
  print b2
