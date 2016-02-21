import Data.List
import System.IO
import BankAccount

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
