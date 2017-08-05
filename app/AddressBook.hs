-- -*- mode: haskell; -*-
--
-- The application
--
-- Your application needs to read the attached AddressBook file and answer the following questions:
--
--     How many males are in the address book?
--     Who is the oldest person in the address book?
--     How many days older is Bill than Paul?
--
-- Data;
--
-- Bill McKnight, Male, 16/03/77
-- Paul Robinson, Male, 15/01/85
-- Gemma Lane, Female, 20/11/91
-- Sarah Stone, Female, 20/09/80
-- Wes Jackson, Male, 14/08/74
--
--

import Data.Char
import Data.Either
import Data.List
import Data.Time.Calendar (Day(..), diffDays)
import Data.Time.Format
import Text.CSV
import Text.Parsec.Error

main :: IO ()
main = do
  putStrLn "unimplemented"
