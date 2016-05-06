-- -*- mode: haskell; -*-
module Main where

ackerman :: Int -> Int -> Int -> Int
ackerman m n 0 = m + n
ackerman _ 0 1 = 0
ackerman _ 0 2 = 1
ackerman m 0 _ = m
ackerman m n p = ackerman m (ackerman m (n-1) p) (p-1)

illuminati :: Int
illuminati = 23

answer :: Int
answer = 42

squared :: Int -> Int
squared n = undefined

plusFive :: Int -> Int
plusFive n = undefined

squaredPlusFive :: Int -> Int
squaredPlusFive n = undefined

composeMain :: IO ()
composeMain = do
  print "2 squared"
  print (squared 2)
  print "2 plus five"
  print (plusFive 2)
  print "2 squared plus five"
  print (squaredPlusFive 2)

underTen :: [Int]
underTen = 1 : 2 : 3 : 4 : 5 : 6 : 7 : 8 : 9 : []

underTen' :: [Int]
underTen' = [1, 2, 3, 4, 5, 6, 7, 8, 9]

naturals :: [Int]
naturals = [1..]

squares :: [Int]
squares = undefined

intSum :: [Int] -> Int
intSum = undefined

intProduct :: [Int] -> Int
intProduct = undefined

myMap :: (a -> b) -> [a] -> [b]
myMap = undefined

listsMain :: IO ()
listsMain = do
  print "under ten"
  print underTen
  print "under ten prime"
  print underTen'
  print "under ten == under ten prime"
  print (underTen == underTen')
  print "naturals"
  print $ take 10 naturals
  print "squares"
  print $ take 10 squares
  print "sum of 10 squares"
  print $ intSum $ take 10 squares
  print "product of 10 squares"
  print $ intProduct $ take 10 squares

first :: (a,b) -> a
first = undefined

second :: (a,b) -> b
second = undefined

tuplesMain :: IO ()
tuplesMain = do
  let t = (illuminati, "Twenty-Three")
  print "tuple"
  print t
  print "first item"
  print (first t)
  print "second item"
  print (second t)

multiplyMaybeInt :: Maybe Int -> Int -> Maybe Int
multiplyMaybeInt = undefined

maybeMain :: IO ()
maybeMain = do
  let x = 2 :: Int
      y = 4 :: Int
      m = Just x
  print "x"
  print x
  print "y"
  print y
  print "m"
  print m
  print "x * y"
  print (x * y)
  print "maybe x * y"
  print (multiplyMaybeInt m y)

main :: IO ()
main = do
  print "main"
  print "The Illuminati"
  print illuminati
  print "The Answer"
  print answer
  composeMain
  listsMain
  tuplesMain
  maybeMain
