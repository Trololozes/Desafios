/*  Caesar Cipher
 *  Desafio_1 - Trololozes
 */

#include <stdio.h>
#include <stdlib.h>

void input(char*);

int main(void){
    char frase[50], keyword[5], ch;
    int key, c = 0;

    printf("Digite a frase: ");
    input(frase);
    printf("Digite a chave numerica: ");
    input(keyword);
    key = atoi(keyword);

/*  Sempre 'key > 0'. Negativo fica para o cominho inverso, quando for
 *  implementado.
 */
    if( key < 0 )
        key *= -1;

/*  Loop para transformar a chave numerica de um possivel numero gigante para
 *  um valor dentro dos limites do alfabeto [0-25]
 */
    while( key > 25 )
        key -= 26;

/*  This is where the magic happens */
    do{
        ch = frase[c];
/*  Verifica se o caracter é uma letra [A-Z] [a-z]
 *  caso nao seja uma letra, pula para o próximo caractere
 *  essa implementação ignora letras acentuadas!
 */
        if( (ch > 64 && ch < 91) || (ch > 96 && ch < 123) ){
            ch += key;
            if( (ch > 90 && ch < 97) || ch > 122 )
                ch -= 26;
            frase[c] = ch;
        }
        c++;
    } while( ch != 0 );

/*  Imprime a frase cifrada na tela */
    printf(">>> %s\n", frase);
    exit(EXIT_SUCCESS);
}

/*  Função gatinho!! the one and only!! */
void input(char *txt){
    char tmp;

    while( (tmp = getchar()) != '\n' )
        *txt++ = tmp;
    *txt = 0;
}
