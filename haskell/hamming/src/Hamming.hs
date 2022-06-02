module Hamming (distance) where
distance :: String -> String -> Maybe Int
distance [] [] = Just 0
distance (x:xs) (y:ys)
  | x /= y = (+1) <$> distance xs ys
  | otherwise = distance xs ys
distance _ _ = Nothing
