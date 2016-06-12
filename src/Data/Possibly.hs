module Data.Possibly
       (
         Possibly(..)
       ) where

data Possibly a =
  Actually a
  | Impossible
  deriving (Eq,Show)
