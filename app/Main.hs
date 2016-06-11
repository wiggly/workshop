-- -*- mode: haskell; -*-
module Main where

ackerman :: Int -> Int -> Int -> Int
ackerman m n 0 = m + n
ackerman _ 0 1 = 0
ackerman _ 0 2 = 1
ackerman m 0 _ = m
ackerman m n p = ackerman m (ackerman m (n-1) p) (p-1)

-- 'illuminati' is a function returning an Int
--
-- since it has a return value and no parameters and it is a pure function
-- it is effectively a constant
illuminati :: Int
illuminati = 23

-- 'answer' is a function returning an Int
--
-- as above, it is effectively a constant
answer :: Int
answer = 42

-- 'squared' is a function taking an Int and returning an Int
--
-- it names one parameter on the left hand side 'n' and uses it in the formula
-- on the right hand side
squared :: Int -> Int
squared n = n * n

-- 'plusFive' is a function taking an Int and returning an Int
--
-- no argument is named on the left-hand side. We have taken a function
-- '+' with signature (Int -> Int -> Int) and applied one argument to it
-- yielding a function with the signature (Int -> Int) which is exactly
-- what we need for 'plusFive'
--
-- This is partial application and indicates that our functions are actually
-- all the same in that they take one argument and return one value...functions
-- with multiple arguments are really just sugar...
plusFive :: Int -> Int
plusFive = (5+)

-- squaredPlusFive is a function that accepts an Int and returns an Int
-- no parameter is named on the left hand side
--
-- this is 'point-free' style, meaning we do not name values, instead we construct
-- a value (in this case another function) by composition
--
-- The composition of plusFive and squared is a function with the correct signature
-- (Int -> Int) so we can simply say that squaredPlusFive is equal to the composition
-- of those two functions
squaredPlusFive :: Int -> Int
squaredPlusFive = plusFive . squared

-- ignore the return type of this function for now.
--
-- we are using some simple IO routines to print out results.
--
-- parenthesis are used to change the order of evaluation
-- (as with mathematical formulae)
composeMain :: IO ()
composeMain = do
  print "2 squared"
  print (squared 2)
  print "2 plus five"
  print (plusFive 2)
  print "2 squared plus five"
  print (squaredPlusFive 2)

-- 'underTen' is a function returning a list of Ints
--
-- The list is created using the list CONStruction operator ':'
-- that takes an element and prepends it to the head of a list.
--
-- the empty square brackets are the empty list.
-- this function returns the empty list, with 9 prepended,
-- with 8 prepended, with 7 prepended...et cetera
underTen :: [Int]
underTen = 1 : 2 : 3 : 4 : 5 : 6 : 7 : 8 : 9 : []

-- 'underTen'' is a function returning a list of Ints
--
-- The list is created using some syntactic sugar but is exactly
-- the same as the above definition.
underTen' :: [Int]
underTen' = [1, 2, 3, 4, 5, 6, 7, 8, 9]

-- 'naturals' is a function returning an infinite list of Ints
naturals :: [Int]
naturals = [1..]

-- 'squares' is a function returning a list of Ints
--
-- this list is created by squaring each element of the list returned
-- by 'naturals' and is therefore also an infinite list
squares :: [Int]
squares = myMap squared naturals

-- 'intSum' is a function taking a list of Ints and returning an Int
--
-- it uses a 'fold' that takes a function, a starting value and a
-- list and collapses/folds the list elements using the function,
-- squashing it down to one value
--
-- The operation here is addition since we want a sum and the starting
-- value is the identity for addition, 0 (zero)
intSum :: [Int] -> Int
intSum = foldr (+) 0

-- 'intProduct' is a function taking a list of Ints and returning an Int
--
-- as above but since we want the product we use multiplication and the identity
-- for multiplication, 1
intProduct :: [Int] -> Int
intProduct = foldr (*) 1

-- 'myMap' is a function taking;
-- - a function from type a to type b
-- - a list of type a
-- and returns a list of type b
--
-- Here we use pattern-matching to match a type constructor (list) and
-- name the arguments it took when created, giving those parts names we
-- can refer to in our function.
--
-- Since we don't have any way of looping we use recursion to construct a new list
-- populated with the elements of the input list mapped over our function
--
myMap :: (a -> b) -> [a] -> [b]
myMap _ [] = []
myMap f (x:xs) = f x : myMap f xs

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


-- 'first' is a function taking a tuple of arity 2 and returning a value
-- of the type of the first element of the tuple.
--
-- Here we use pattern-matching to match a type constructor (tuple) and
-- name the arguments it took when created, giving those parts names we
-- can refer to in our function.
first :: (a,b) -> a
first (x,_) = x

second :: (a,b) -> b
second (_,x) = x

tuplesMain :: IO ()
tuplesMain = do
  let t = (illuminati, "Twenty-Three")
  print "tuple"
  print t
  print "first item"
  print (first t)
  print "second item"
  print (second t)

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
