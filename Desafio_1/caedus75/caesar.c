/*  Caesar Cipher
 *  Desafio_1 - Trololozes
 */

#include <stdio.h>
#include <stdlib.h>

void input(char*);

int main(void){
    char frase[50], ch;
    int key, c = 0;

    printf("Digite a frase: ");
    input(frase);
    printf("Digite a chave numerica: ");
    scanf("%d", &key);

/*  loop para transformar a chave numerica de um possivel numero gigante para
 *  um valor dentro dos limites do alfabeto [0-25]
 */
    while( key > 25 )
        key -= 26;

/*  para descriptografar, fazer a chave negativa e continuar com o processamento
 */

/*  This is where the magic happens */
    do{
        ch = frase[c];
/*  verifica se o caracter é uma letra [A-Z] [a-z]
 *  caso nao seja uma letra, pula para o proximo caracter
 *  essa implementacao ignora letras acentuadas!
 */
        if( (ch > 64 && ch < 91) || (ch > 96 && ch < 123) ){
            ch += key;
            if( (ch > 90 && ch < 97) || ch > 122 )
                ch -= 26;
            frase[c] = ch;
        }
        c++;
    } while( ch != 0 );

/*  imprime a frase cifrada na tela */
    printf(">>> %s\n", frase);
    exit(EXIT_SUCCESS);
}

/*  funcao gatinho!! the one and only!! */
void input(char *txt){
    char tmp;

    while( (tmp = getchar()) != '\n' )
        *txt++ = tmp;
    *txt = 0;
}
