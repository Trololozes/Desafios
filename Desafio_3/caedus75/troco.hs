--  Copyright (c) 2014
--  All rights reserved

import Text.Printf

--  Lista com os valores de moeda possiveis no Real.
reais = [100, 50, 20, 10, 5, 2, 1, 0.5, 0.25, 0.1, 0.05]

--  calcula o troco, arredondando o valor final para o cliente não ser roubado
--  pelo comerciante.
troco :: Double -> Double -> Double
troco valor dinheiro
    | valor >= dinheiro = 0
    | otherwise = (fromInteger $ fx $ round $ (dinheiro - valor) * 100) / 100
    where
        fx a = if (mod a 5 /= 0) then fx (a+1) else a

--  Retorna uma lista de quantidades de cédulas/moedas necessárias para igualar
--  o valor passado.
--  O valor é passado por cada item da lista 'reais' e sempre que maior, é
--  calculado quantas cédulas/moedas são necessárias para cubrir tal valor.
moeda :: [Double] -> Double -> [Int]
moeda xs y = calc xs y 0
    where
        calc [] _ _ = []
        calc (x:xs) y n
            | y >= x = calc (x:xs) (rnd $ y-x) (n+1)
            | otherwise = n : calc xs y 0
        rnd x = (fromInteger $ round $ x * 100) / 100.0

--  Usa a lista de duplas (Valor, Qtdd) para gerar uma lista de Strings
--  formatada no modo de apresentação final.
str :: [(Double, Int)] -> [String]
str xs = map (\(a, b) -> concat [(show b), "x R$ ", (bty a)]) xs
    where
        bty a = printf "%.2f" a :: String

--  Função 'empacota' todo o processo de calcular o troco, gerar a lista de
--  quantidades, unir a lista com a lista de valores, e descartar os valores que
--  não são usados numa coisa só.
process :: Double -> Double -> [(Double, Int)]
process x y =
    filter dropZero $ zip reais $ moeda reais $ troco x y
    where
        dropZero (_, x)
            | x == 0 = False
            | otherwise = True

--  Função main.
--  Faz a interação com o mundo exterior
main :: IO ()
main =
    do
        putStr "Digite o valor da compra: "
        vl <- getLine
        putStr "Digite o valor em dinheiro: "
        rs <- getLine
        putStr $ unlines $ str $ process (read vl) (read rs)
