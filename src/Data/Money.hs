-- -*- mode: haskell; -*-
module Data.Money
       (
         Currency(..)
         , Money(..)
         , ExchangeRate(..)
         , rateFrom
         , rateTo
         , rateMultiplier
         , exchange
       ) where

-- algebraic data type - sum type, four possible values
data Currency =
  GBP
  | EUR
  | USD
  | XTS
  deriving (Eq)

-- instance of the typeclass 'Show' - simple (but not the best)
-- way of generating a string representation of a type's values
instance Show Currency where
  show GBP = "£"
  show EUR = "€"
  show USD = "$"
  show XTS = "T"

-- generic money type over some type 'a' to be used to denote the amount
data Money a =
  Money Currency a

-- as above but for money
instance Show a => Show (Money a) where
  show (Money c n) = (show c) ++ (show n)

-- algebraic data type - product type
data ExchangeRate = ExchangeRate Currency Currency Float

rateFrom :: ExchangeRate -> Currency
rateFrom (ExchangeRate x _ _) = x

rateTo :: ExchangeRate -> Currency
rateTo (ExchangeRate _ x _) = x

rateMultiplier :: ExchangeRate -> Float
rateMultiplier (ExchangeRate _ _ x) = x

findRate :: [ExchangeRate] -> Currency -> Currency -> ExchangeRate
findRate rates from to = head $ filter match rates
  where match rate = (rateFrom rate) == from && (rateTo rate) == to

-- what happens if we don't have an exchange rate for the currency combination?
exchange :: Integral a => [ExchangeRate] -> Currency -> Money a -> Money a
exchange rates to (Money from amount) = let rate = findRate rates from to
                                            multiplier = rateMultiplier rate
                                            newAmount = round ((fromIntegral amount) * multiplier)
                                        in Money to newAmount
