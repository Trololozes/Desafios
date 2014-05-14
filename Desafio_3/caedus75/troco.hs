--  Copyright (c) 2014
--  All rights reserved

import Text.Printf

reais = [100, 50, 20, 10, 5, 2, 1, 0.5, 0.25, 0.1, 0.05]

troco :: Double -> Double -> Double
troco valor dinheiro
    | valor >= dinheiro = 0
    | otherwise = (fromInteger $ fx $ round $ (dinheiro - valor) * 100) / 100
        where
            fx a = if (mod a 5 /= 0)
                then fx (a+1)
                else a

moeda :: [Double] -> Double -> [Int]
moeda xs y = calc xs y 0
    where
        calc [] _ _ = []
        calc (x:xs) y n
            | y >= x = calc (x:xs) (myRound $ y-x) (n+1)
            | otherwise = n : calc xs y 0

dropZero :: (Double, Int) -> Bool
dropZero (_, x)
    | x == 0 = False
    | otherwise = True

str :: [(Double, Int)] -> [String]
str xs = map (\(a, b) -> concat [(show b), "x R$ ", (bty a)]) xs
    where
        bty a = printf "%.2f" a :: String

myRound :: Double -> Double
myRound x = (fromInteger $ round $ x * (10^2)) / (10.0^^2)

process :: Double -> Double -> [(Double, Int)]
process x y =
    filter dropZero $ zip reais $ moeda reais $ troco x y

main :: IO ()
main =
    do
        putStr "Digite o valor da compra: "
        vl <- getLine
        putStr "Digite o valor em dinheiro: "
        rs <- getLine
        putStr $ unlines $ str $ process (read vl) (read rs)
