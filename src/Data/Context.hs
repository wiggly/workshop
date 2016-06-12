module Data.Context
       (
         Context(..)
       ) where

class Context ctx where
  munge :: (a -> b) -> ctx a -> ctx b
  (#) :: (a -> b) -> ctx a -> ctx b
  (#) = munge
