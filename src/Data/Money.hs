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

-- algebraic data type - sum type
data Currency =
  GBP
  | EUR
  | USD
  | XTS
  deriving (Eq)

data Money a =
  Money Currency a

instance Show Currency where
  show GBP = "£"
  show EUR = "€"
  show USD = "$"
  show XTS = "M"

instance Show a => Show (Money a) where
  show (Money c n) = (show c) ++ (show n)

-- TODO: let's define this
-- instance Context Money where

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
