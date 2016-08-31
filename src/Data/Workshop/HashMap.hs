module Data.Workshop.HashMap
       (
         HashMap(..)
       , empty
       , size
       , isEmpty
       , keys
       , values
       , contains
       , put
       , get
       , delete
       , clear
       , dump
       )
       where

import qualified Data.Vector as V
import qualified Data.Hashable as H

type MapKey = String

data MapPair a = MapPair MapKey a
               deriving (Eq,Show)

pairKey :: MapPair a -> MapKey
pairKey (MapPair k _) = k

pairValue :: MapPair a -> a
pairValue (MapPair _ v) = v

type Buckets a = (V.Vector (Maybe (MapPair a)))

data HashMap a = HashMap (Buckets a)

-- create an empty map
empty :: Eq a => HashMap a
empty = undefined

-- return the number of items in the map
size :: Eq a => HashMap a -> Int
size (HashMap b) = undefined

-- determine whether the map is empty
isEmpty :: Eq a => HashMap a -> Bool
isEmpty m = undefined

-- return all keys in the map
keys :: HashMap a -> [MapKey]
keys (HashMap b) = undefined

-- return all values in the map
values :: HashMap a -> [a]
values (HashMap b) = undefined

-- determine whether the map contains a key or not
contains :: HashMap a -> MapKey -> Bool
contains (HashMap b) k = undefined

-- insert a value into the map
put :: HashMap a -> MapKey -> a -> HashMap a
put (HashMap b) k value = undefined

-- retrieve a value from the map
get :: HashMap a -> MapKey -> Maybe a
get (HashMap b) k = undefined

-- delete a value from the map
delete ::  HashMap a -> MapKey -> HashMap a
delete (HashMap b) k = undefined

-- clear all values from the map
clear :: Eq a => HashMap a -> HashMap a
clear _ = undefined

dump :: Show a => HashMap a -> String
dump (HashMap b) = undefined
