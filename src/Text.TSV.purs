module Text.TSV (module Text.CSV.Internal, parse, print) where

import Data.Either (Either)
import Data.String (joinWith)
import Prelude (map, ($), (<<<))
import Text.CSV.Internal (TSV, CSVType(..), csvParser, escapeField)
import Text.Parsing.StringParser (ParseError, runParser)

-- | Read a TSV string to type TSV
parse :: String -> Either ParseError TSV
parse cs =
  runParser (csvParser TSVtype) cs

-- | Print TSV value into string based on RFC4180
print :: TSV -> String
print tsv =
  joinWith "\r\n" $ map (joinWith "\t" <<< map (escapeField TSVtype)) tsv
