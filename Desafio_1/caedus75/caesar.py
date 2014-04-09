#!/usr/bin/env  python3

frase = input("Digite a frase: ")
cifra = []

#   Lista de caracteres que serao ignorados na criptografia.
ign = ['Á', 'á', 'Â', 'â', 'À', 'à', 'Å', 'å', 'Ã', 'ã', 'Ä', 'ä',\
       'É', 'é', 'Ê', 'ê', 'È', 'è', 'Ë', 'ë', 'Í', 'í', 'Î', 'î',\
       'Ì', 'ì', 'Ï', 'ï', 'Ó', 'ó', 'Ô', 'ô', 'Ò', 'ò', 'Õ', 'õ',\
       'Ö', 'ö', 'Ú', 'ú', 'Û', 'û', 'Ù', 'ù', 'Ü', 'ü', 'Ç', 'ç',\
       'Ñ', 'ñ', '\"', '\'', '®', '©', '<', '>', '&', ' ']

#   Garante que a chave numerica seja realmente um numero
while True:
    try:
        key = abs(int(input("Digite a chave numerica: ")))
    except ValueError:
        print("Erro, chave inválida")
    else:
        break

#   Garante um valor valido para a chave numerica
while key > 25:
    key -= 26

#   Usa a frase como uma sequencia de caracteres.
#   a cada caracter verifica se está presente na lista de caracteres a serem
#   ignorados (ign), se sim so adiciona a uma lista de caracteres sem fazer mais
#   nada.
#   Se nao, transforma o caracter no seu valor numerico unicode e soma a chave.
#   O novo valor é transformado de volta em caracter e adicionado a lista de
#   caracteres.
for char in frase:
    if char in ign:
        cifra.append(char)
        continue
    cifra.append(chr(ord(char)+key))

#   Cada elemento da lista é unido com um espaco vazio entre si, tecninca
#   gatinho para fazer uma string a partir de uma lista de caracteres.
cifra = ''.join(cifra)
print(cifra)
