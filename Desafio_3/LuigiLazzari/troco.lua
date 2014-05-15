t = {}
setmetatable(t,{__index=function () return 0 end}) --inicializa todos os indexes da tabela t com 0 -- very useful <3 luv it

print("Preço produto: ")
price = 15.25
print("Valor pago: ")
paid_price = 500

t.trocoReais = paid_price - price
print(t.trocoReais)
t.trocoCentavos = t.trocoReais * 100

while(t.trocoCentavos % 10000 ~= t.trocoCentavos) do
   t.nota100 = t.nota100 + 1
   t.notas = t.notas + 1
   t.trocoCentavos = t.trocoCentavos - 10000
end
if t.nota100 ~= 0 then
   print("Notas de R$ 100,00: ", t.nota100)
end

while(t.trocoCentavos % 5000 ~= t.trocoCentavos) do
   t.nota50 = t.nota50 + 1
   t.notas = t.notas + 1
   t.trocoCentavos = t.trocoCentavos - 5000
end
if t.nota50 ~= 0 then
   print("Notas de R$ 50,00: ", t.nota50)
end

while(t.trocoCentavos % 2000 ~= t.trocoCentavos) do
   t.nota20 = t.nota20 + 1
   t.notas = t.notas + 1
   t.trocoCentavos = t.trocoCentavos - 2000
end
if t.nota20 ~= 0 then
   print("Notas de R$ 20,00: ", t.nota20)
end

while(t.trocoCentavos % 1000 ~= t.trocoCentavos) do
   t.nota10 = t.nota10 + 1
   t.notas = t.notas + 1
   t.trocoCentavos = t.trocoCentavos - 1000
end
if t.nota10 ~= 0 then
   print("Notas de R$ 10,00: ", t.nota10)
end

while(t.trocoCentavos % 500 ~= t.trocoCentavos) do
   t.nota5 = t.nota5 + 1
   t.notas = t.notas + 1
   t.trocoCentavos = t.trocoCentavos - 500
end
if t.nota5 ~= 0 then
   print("Notas de R$ 5,00: ", t.nota5)
end

while(t.trocoCentavos % 200 ~= t.trocoCentavos) do
   t.nota2 = t.nota2 + 1
   t.notas = t.notas + 1
   t.trocoCentavos = t.trocoCentavos - 200
end
if t.nota2 ~= 0 then
   print("Notas de R$ 2,00: ", t.nota2)
end

print(string.format("------------\nQntd. total de notas >>>> %.0f\n------------", t.notas)); 

while(t.trocoCentavos % 100 ~= t.trocoCentavos) do
   t.moeda1 = t.moeda1 + 1
   t.moedas = t.moedas + 1
   t.trocoCentavos = t.trocoCentavos - 100
end
if t.moeda1 ~= 0 then
   print("Moedas de R$ 1,00: ", t.moeda1)
end

while(t.trocoCentavos % 50 ~= t.trocoCentavos) do
   t.moeda50 = t.moeda50 + 1
   t.moedas = t.moedas + 1
   t.trocoCentavos = t.trocoCentavos - 50
end
if t.moeda50 ~= 0 then
   print("Moedas de R$ 0,50: ", t.moeda50)
end

while(t.trocoCentavos % 25 ~= t.trocoCentavos) do
   t.moeda25 = t.moeda25 + 1
   t.moedas = t.moedas + 1
   t.trocoCentavos = t.trocoCentavos - 25
end
if t.moeda25 ~= 0 then
   print("Moedas de R$ 0,25: ", t.moeda25)
end

while(t.trocoCentavos % 10 ~= t.trocoCentavos) do
   t.moeda10 = t.moeda10 + 1
   t.moedas = t.moedas + 1
   t.trocoCentavos = t.trocoCentavos - 10
end
if t.moeda10 ~= 0 then
   print("Moedas de R$ 0,10: ", t.moeda10)
end

while(t.trocoCentavos % 5 ~= t.trocoCentavos) do
   t.moeda05 = t.moeda05 + 1
   t.moedas = t.moedas + 1
   t.trocoCentavos = t.trocoCentavos - 5
end
if t.moeda05 ~= 0 then
   print("Moedas de R$ 0,05: ", t.moeda05)
end

print(string.format("------------\nQtd. total de moedas >>>> %.0f\n------------", t.moedas)); 