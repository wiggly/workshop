-- -*- mode: haskell; -*-
module Main where

import Data.Money

-- TODO: is it possible to make head safe...
safeHead :: [a] -> a
safeHead = undefined

naturals :: [Int]
naturals = [1..]

doubleInt :: Int -> Int
doubleInt = (2*)

halfInt :: Int -> Int
halfInt = (flip div 2)

doubleYourNumbers :: [Int] -> [Int]
doubleYourNumbers = map doubleInt

functionYourNumbers :: (Int -> Int) -> [Int] -> [Int]
functionYourNumbers fn = map fn

doubleYourMoney :: Money Int -> Money Int
doubleYourMoney (Money c n) = Money c (doubleInt n)

functionYourMoney :: (Int -> Int) -> Money Int -> Money Int
functionYourMoney fn (Money c n) = Money c (fn n)

main :: IO ()
main = do
  let n = 42
      doubleN = doubleInt n
      halfN = halfInt n
      natty = take 10 naturals
      nattyDoubles = doubleYourNumbers natty
      nattyHalves = functionYourNumbers halfInt natty
      score = Money GBP 20
      pony = Money GBP 25
      ton = Money GBP 100
      monkey = Money GBP 500
      grand = Money GBP 1000
      doubleTon = doubleYourMoney ton
      halfTon = functionYourMoney halfInt ton
      rates = [(ExchangeRate USD GBP 0.6), (ExchangeRate GBP USD 1.6)]
      americanMonkey = exchange rates USD monkey
      europeanMonkey = exchange rates EUR monkey
  putStrLn $ "Integers"
  putStrLn $ "n - " ++ (show n)
  putStrLn $ "double n - " ++ (show doubleN)
  putStrLn $ "half n - " ++ (show halfN)
  putStrLn $ "\n"
  putStrLn $ "Lists"
  putStrLn $ "Naturals - " ++ (show natty)
  putStrLn $ "Doubles - " ++ (show nattyDoubles)
  putStrLn $ "Halves - " ++ (show nattyHalves)
  putStrLn $ "\n"
  putStrLn $ "Money"
  putStrLn $ "score - " ++ (show score)
  putStrLn $ "pony - " ++ (show pony)
  putStrLn $ "ton - " ++ (show ton)
  putStrLn $ "monkey - " ++ (show monkey)
  putStrLn $ "grand - " ++ (show grand)
  putStrLn $ "double ton - " ++ (show doubleTon)
  putStrLn $ "half ton - " ++ (show halfTon)
  putStrLn $ "american monkey - " ++ (show americanMonkey)
  putStrLn $ "european monkey - " ++ (show europeanMonkey)
  putStrLn $ "\n"
