module Acronym (abbreviate) where

import           Data.Char

abbr :: String -> String
abbr w | null w = []
             | all isUpper w = [head w]
             | all isLower w = [toUpper $ head w]
             | otherwise = filter isUpper w

abbreviate :: String -> String
abbreviate = concatMap abbr . words . map (\c -> if (c == '-') || (c == '_') then ' ' else c)
