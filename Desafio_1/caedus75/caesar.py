#!/usr/bin/env  python3

#   chr() retorna o caractere __unicode__ correspondente ao inteiro passado como
#   argumento. Sendo assim não há o limite de 255 do ascii. É possível modificar
#   todas as letras, acentuadas ou não, da frase.
def modify(original, key):
    mod = []
    for char in original:
        mod.append(chr(ord(char)+key))
    return ''.join(mod)

frase = input("Digite a frase: ")
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

#   embaralha e desembaralha a frase, respectivamente.
enc = modify(frase, key)
dec = modify(enc, key*-1)

print("frase: {0}\ncifrado: {1}\ndecifrado: {2}".format(frase, enc, dec))
