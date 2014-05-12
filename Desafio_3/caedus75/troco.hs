--  Copyright (c) 2014
--  All rights reserved

reais = [100, 50, 20, 10, 5, 2, 1, 0.5, 0.25, 0.1, 0.05]

troco :: Double -> Double -> Double
troco valor dinheiro
    | valor >= dinheiro = 0
    | otherwise = dinheiro - valor

moeda :: [Double] -> Double -> [Int]
moeda xs y = calc xs y 0
    where
        calc [] _ _ = []
        calc (x:xs) y n
            | y >= x = calc (x:xs) (myRound $ y-x) (n+1)
            | otherwise = n : calc xs y 0

myRound :: Double -> Double
myRound x = (fromInteger $ round $ x * (10^2)) / (10.0^^2)

dropZero :: (Double, Int) -> Bool
dropZero (_, x)
    | x == 0 = False
    | otherwise = True
