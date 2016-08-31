module Data.Workshop.ListMap
       (
         ListMap(..)
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

type MapKey = String

data ListMap a = ListMap [(MapKey,a)]

-- create an empty map
empty :: ListMap a
empty = undefined

-- return the number of items in the map
size :: ListMap a -> Int
size (ListMap pairs) = undefined

-- determine whether the map is empty
isEmpty :: ListMap a -> Bool
isEmpty m = undefined

-- return all keys in the map
keys :: ListMap a -> [MapKey]
keys (ListMap pairs) = undefined

-- return all values in the map
values :: ListMap a -> [a]
values (ListMap pairs) = undefined

-- determine whether the map contains a key or not
contains :: ListMap a -> MapKey -> Bool
contains m k = undefined

-- insert a value into the map
put :: ListMap a -> MapKey -> a -> ListMap a
put m k v = undefined

-- retrieve a value from the map
get :: ListMap a -> MapKey -> Maybe a
get (ListMap pairs) k = undefined

-- delete a value from the map
delete ::  ListMap a -> MapKey -> ListMap a
delete (ListMap pairs) k = undefined

-- clear all values from the map
clear :: ListMap a -> ListMap a
clear _ = undefined

dump :: Show a => ListMap a -> String
dump (ListMap pairs) = undefined
