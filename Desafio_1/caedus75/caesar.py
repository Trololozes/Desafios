#!/usr/bin/env  python3

frase = input("Digite a frase: ")
cifra = []

#   garante que a chave numerica seja realmente um numero
while True:
    try:
        key = int(input("Digite a chave numerica: "))
    except ValueError:
        print("Erro, chave inválida")
    else:
        break

#   sempre 'key > 0'. Negativo fica para o caminho inverso, quando for
#   implementado.
if key < 0:
    key *= -1

#   garante um valor valido para a chave numerica
while key > 25:
    key -= 26

#   usa a frase como uma sequencia de caracteres.
#   a cada caracter verifica se é um espaco, se sim so adiciona a uma lista de
#   caracteres.
#   se nao, transforma o caracter no seu valor numerico da tabela ascii e soma a
#   chave. O novo valor é transformado de volta em caracter e adicionado a lista
#   de caracteres.
for char in frase:
    if char == ' ':
        cifra.append(char)
        continue
    cifra.append(chr(ord(char)+key))

#   cada elemento da lista é unido com um espaco vazio entre si, tecninca
#   gatinho para fazer uma string a partir de uma lista de caracteres.
cifra = ''.join(cifra)
print(cifra)
