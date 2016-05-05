-- -*- mode: haskell; -*-
--
-- generate anagrams based on dictionary and repeated user input
--

import Data.Char (toLower)
import Data.List (sort)
import System.Environment (getArgs)
import System.IO (stdout, hFlush)
import qualified Data.Map as M (Map, empty, lookup, alter)

-- map of canonical representation to all anagrams that exist
type AnagramMap = M.Map String [String]

dictionaryFilename :: IO String
dictionaryFilename = do arg <- getArgs
                        if null arg
                          then (return "/usr/share/dict/words")
                          else (return $ head arg)

readDictionary :: String -> IO [String]
readDictionary fileName = do fmap lines $ readFile fileName

canonicalWord :: String -> String
canonicalWord = sort . (map toLower)

canonicalDictionary :: [String] -> AnagramMap
canonicalDictionary ws = foldr go M.empty ws
  where go word acc = M.alter (updateWord word) (canonicalWord word) acc
        updateWord w m = Just [w] `mappend` m

generateAnagrams :: AnagramMap -> String -> String
generateAnagrams h w = maybe failureMessage formatResponse anagrams
  where anagrams = M.lookup (canonicalWord w) h
        formatResponse ws = "\nAnagrams for '" ++ w ++ "':\n" ++ (formatAnagrams ws) ++ "\nEnter a word to find anagrams for: "
        formatAnagrams arr = unlines $ map (\str -> "\t - '" ++ str ++ "'") arr
        failureMessage = "\nNo anagrams for '" ++ w ++ "'\nEnter a word to find anagrams for: "

printAnagrams :: AnagramMap -> String -> String
printAnagrams dictionary input = unlines $ map (generateAnagrams dictionary) (lines input)

main :: IO ()
main = do dict <- fmap canonicalDictionary $ dictionaryFilename >>= readDictionary
          putStr "Enter a word to find anagrams for: " >> hFlush stdout
          interact $ printAnagrams dict
