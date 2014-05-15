t = { nota100,
      nota50,
      nota20,
      nota10,
      nota5,
      nota2,
      moeda1,
      moeda50,
      moeda25,
      moeda10,
      moeda05,
      notas,
      moedas,
      trocoReais,
      trocoCentavos 
   }

setmetatable(t,{__index=function () return 0 end})

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
print("Notas de 100: ", t.nota100)


while(t.trocoCentavos % 5000 ~= t.trocoCentavos) do
   t.nota50 = t.nota50 + 1
   t.notas = t.notas + 1
   t.trocoCentavos = t.trocoCentavos - 5000
end
print("Notas de 50: ", t.nota50)

while(t.trocoCentavos % 2000 ~= t.trocoCentavos) do
   t.nota20 = t.nota20 + 1
   t.notas = t.notas + 1
   t.trocoCentavos = t.trocoCentavos - 2000
end
print("Notas de 20: ", t.nota20)

while(t.trocoCentavos % 1000 ~= t.trocoCentavos) do
   t.nota10 = t.nota10 + 1
   t.notas = t.notas + 1
   t.trocoCentavos = t.trocoCentavos - 1000
end
print("Notas de 10: ", t.nota10)

while(t.trocoCentavos % 500 ~= t.trocoCentavos) do
   t.nota5 = t.nota5 + 1
   t.notas = t.notas + 1
   t.trocoCentavos = t.trocoCentavos - 500
end
print("Notas de 5: ", t.nota5)

while(t.trocoCentavos % 200 ~= t.trocoCentavos) do
   t.nota2 = t.nota2 + 1
   t.notas = t.notas + 1
   t.trocoCentavos = t.trocoCentavos - 200
end
print("Notas de 2: ", t.nota2)
print("Qntd. total de notas", t.notas); 

while(t.trocoCentavos % 100 ~= t.trocoCentavos) do
   t.moeda1 = t.moeda1 + 1
   t.moedas = t.moedas + 1
   t.trocoCentavos = t.trocoCentavos - 100
end
print("Moedas de 1: ", t.moeda1)

while(t.trocoCentavos % 50 ~= t.trocoCentavos) do
   t.moeda50 = t.moeda50 + 1
   t.moedas = t.moedas + 1
   t.trocoCentavos = t.trocoCentavos - 50
end
print("Moedas de 0.50: ", t.moeda50)

while(t.trocoCentavos % 25 ~= t.trocoCentavos) do
   t.moeda25 = t.moeda25 + 1
   t.moedas = t.moedas + 1
   t.trocoCentavos = t.trocoCentavos - 25
end
print("Moedas de 0.25: ", t.moeda25)

while(t.trocoCentavos % 10 ~= t.trocoCentavos) do
   t.moeda10 = t.moeda10 + 1
   t.moedas = t.moedas + 1
   t.trocoCentavos = t.trocoCentavos - 10
end
print("Moedas de 0.10: ", t.moeda10)

while(t.trocoCentavos % 5 ~= t.trocoCentavos) do
   t.moeda05 = t.moeda05 + 1
   t.moedas = t.moedas + 1
   t.trocoCentavos = t.trocoCentavos - 5
end
print("Moedas de 0.05: ", t.moeda05)
print("Qtd. total de moedas", t.moedas); 