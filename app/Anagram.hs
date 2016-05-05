-- -*- mode: haskell; -*-
--
-- generate anagrams based on dictionary and repeated user input
--

import Data.Char (toLower)
import Data.List (foldr, sort, map)
import Data.Maybe (Maybe(..), isJust, fromMaybe)
import Data.Monoid (mappend)
import System.Environment (getArgs)
import System.IO (stdout, hFlush, readFile)
import qualified Data.Map as M (Map(..), empty, lookup, alter)

-- map of canonical representation to all anagrams that exist
type AnagramMap = M.Map String [String]

dictionaryFilename :: IO String
dictionaryFilename = do arg <- getArgs
                        if null arg
                          then (return "/usr/share/dict/words")
                          else (return $ head arg)

readDictionary :: String -> IO [String]
readDictionary fileName = do fmap lines $ readFile fileName

canonicalDictionary :: [String] -> AnagramMap
canonicalDictionary words = foldr go M.empty words
  where go word acc = M.alter (updateWord word) (sort word) acc
        updateWord w m = Just [w] `mappend` m

generateAnagrams :: AnagramMap -> String -> String
generateAnagrams h w = maybe failureMessage formatResponse anagrams
  where anagrams = M.lookup (sort (map toLower w)) h
        formatResponse words = "\nAnagrams for '" ++ w ++ "':\n" ++ (formatAnagrams words) ++ "\nEnter a word to find anagrams for: "
        formatAnagrams arr = unlines $ map (\w -> "\t - '" ++ w ++ "'")  arr
        failureMessage = "\nNo anagrams for '" ++ w ++ "'\nEnter a word to find anagrams for: "

printAnagrams :: AnagramMap -> String -> String
printAnagrams dictionary input = unlines $ map (generateAnagrams dictionary) (lines input)

main = do dict <- fmap canonicalDictionary $ dictionaryFilename >>= readDictionary
          putStr "Enter a word to find anagrams for: " >> hFlush stdout
          interact $ printAnagrams dict
