import Data.List
import System.IO

{-

-}
data BankAccount = BankAccount {accountHolder :: String, balance :: Int} deriving (Eq, Show)

{-
  Function Declarations
-}
deposit :: BankAccount -> Int -> BankAccount
withdraw :: BankAccount -> Int -> BankAccount
