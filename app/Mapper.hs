module Main where

import Data.Workshop.ListMap as M
--import Data.Workshop.HashMap as M

type MyMap = M.ListMap Int
--type MyMap = M.HashMap Int

type MapData = Int

showMap :: MyMap -> IO ()
showMap m = do
  let ks = M.keys m
      kvs = map (\k -> k ++ ": " ++ (show (M.get m k))) ks
      emptyStr = "empty: " ++ (show (M.isEmpty m))
      sizeStr = "size: " ++ (show (M.size m))
      containsSpideyStr = "spider-man: " ++ (show (M.contains m "Spider-Man"))
  putStrLn $ unlines $ [emptyStr, sizeStr, containsSpideyStr, "data:\n"] ++ kvs
  putStrLn "---- DUMP ----"
  putStrLn $ M.dump m
  putStrLn "---- DUMP ----\n\n"

main :: IO ()
main = do
  let m = M.empty :: MyMap
      m' = M.put m "Iron Man" 1900
      m'' = M.put m' "Spider-Man" 1250
      m''' = M.put m'' "Elephant Man" 1150
      m'''' = M.put m''' "Spider-Man" 1850
      m''''' = M.delete m'''' "Spider-Man"
      m'''''' = M.clear m'''''
  putStrLn "Mapper"
  putStrLn $ "m"
  showMap m
  putStrLn $ "m'"
  showMap m'
  putStrLn $ "m''"
  showMap m''
  putStrLn $ "m'''"
  showMap m'''
  putStrLn $ "m''''"
  showMap m''''
  putStrLn $ "m'''''"
  showMap m'''''
  putStrLn $ "m''''''"
  showMap m''''''
