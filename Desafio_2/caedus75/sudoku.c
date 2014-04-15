/*  Copyright (c) 2014
 *  All rights reserved
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

/*  Define como constante o tamanha de cada linha, com base nos bytes que
 *  compõem o caractere '\n'
 */
#ifdef __linux__

#define LINHA 18
#define NL 1

#elif _WIN32

#define LINHA 19
#define NL 2

#endif

/*  Programa recebe o nome de um arquivo por argumento, le o numero da primeira
 *  linha e carrega uma matriz o número de vezes especificado por aquele número.
 *  A cada 9 numeros passados para a matriz, a linha é chegada para verificar se
 *  é uma linha válida para resposta do Sudoku. Após carregar as 9 linhas, o
 *  programa confere a validade das colunas e por fim dos 9 quadrantes 3x3.
 *  Se nenhuma das checagens der erro, a matriz é determinada como resposta
 *  válida para o jogo.
 *  Entre a verificação de um jogo e outro é usado a função fseek() para
 *  posicionar o ponteiro de arquivo na posição correta do início do próximo
 *  jogo, importante passo no caso de o jogo anterior ter sido reprovado no
 *  teste das linhas.
 */

long get_offset(int, int);
int lineck(const char*);
int colnck(char*);
int qdrtck(char*);

int main(int argc, char *argv[]){
    FILE *sudoku;
    char head[5], line[20], matrix[10][10] = { 0 }, *file;
    int stt, opt, it, ln, cl, c;

    while( (opt = getopt(argc, argv, "f:")) != -1 ){
        switch(opt){
            case 'f':
                file = optarg;
                break;
            default:
                fprintf(stderr, "%s -f [arquivo.txt]\n", argv[0]);
                exit(EXIT_FAILURE);
        }
    }
    ln = cl = c = 0;
    if( ! (sudoku = fopen(file, "r")) ){
        fprintf(stderr, "Erro ao abrir o arquivo.\n"\
                        "Voce indicou o arquivo certo com a flag '-f'?\n");
        exit(EXIT_FAILURE);
    }
    fgets(head, sizeof head, sudoku);
    it = atoi(head);
    while( c < it ){
        while( (fgets(line, sizeof line, sudoku)) && ln < 9 ){
            for( cl = 0; line[cl*2] != 0; cl++ ){
                matrix[ln][cl] = line[cl*2];
            }
            if( ! (stt = lineck(&matrix[ln][0])) ){
                stt = 0;
                break;
            }
            ln++;
        }
        printf("Resultado %d\n%s\n\n", c+1,\
        ( stt && colnck(&matrix[0][0]) && qdrtck(&matrix[0][0]) ) ? "SIM" : "NAO");
        fseek(sudoku, get_offset(it, c), SEEK_SET);
        ln = 0;
        c++;
    }
    fclose(sudoku);
    exit(EXIT_SUCCESS);
}

/*  get_offset() calcula quantos bytes separam o início do próximo jogo do
 *  começo do arquivo, os parametros são o número de iterações e a contagem de
 *  jogos verificados. O número de iterações serve para calcular os bytes da
 *  primeira linha do arquivo.
 *  LINHA e NL são determinados como 18, ou 19, e 1, ou 2, bytes dependendo do
 *  S.O. Windows usa 2 bytes para o '\n', enquando sistemas *NIX usa apenas 1.
 */
long get_offset(int itr, int count){
    int offset = LINHA * 9;
    int n = NL;

    while( itr ){
        itr /= 10;
        n++;
    }
    return (n + offset * (count+1)) * sizeof(char);
}

/*  lineck() é quem faz o trabalho pesado!
 *  Verifica a presença de um numeral na linha passada para a função. O número
 *  estando presente causa a sua troca por um '0' a vim de dar erro em caso de
 *  números repetidos na linha que está sendo verificada. Em caso de repetição a
 *  função retorna 0, indicando não serve como resposta ao sudoku.
 */
int lineck(const char *line){
    char *chr, test[10] = "123456789";
    int c = 0;

    while( c < 9 ){
        if( ! (chr = strchr(test, line[c++])) )
            return 0;
        *chr = '0';
    }
    return 1;
}

/*  colnck() recebe a matriz e pulando de linha em linha pega os números da mesma
 *  coluna e preenche um vetor que é verificado pela lineck().
 *  Enquanto não houver erro as colunas vão sendo verificadas até completar
 *  todas as 9 e assim retornar sucesso na vericação das colunas.
 */
int colnck(char *matrix){
    char *ptr, line[10] = { 0 };
    int c, it = 0;

    while( it < 9 ){
        ptr = matrix + it;
        c = 0;
        while( *ptr != 0 ){
            line[c++] = *ptr;
            ptr += 10;
        }
        it++;
        if( ! lineck(line) )
            return 0;
    }
    return 1;
}

/*  qdrtck() recebe a matriz e a divide em 9 quadrantes de 3x3.
 *  A linha de cada quadrante é obtida seguindo a linha que o ponteiro aponta
 *  por 3 números, no 3º número o ponteiro é movido para o primero número da
 *  coluna seguinte no mesmo quadrante. Do ultimo número de uma linha de
 *  quadrante até o primeiro da linha seguinte no mesmo quadrante existem 8
 *  espaços.
 *  Entre cada quadrante na mesma linha existem 3 espaços separando-os, entre o
 *  último de uma linha até o primeiro da linha seguinte são 24 espaços de
 *  separação.
 */
int qdrtck(char *matrix){
    char *ptr = matrix, line[10] = { 0 };
    int c, it = 0;

    while( it < 9 ){
        c = 0;
        while( c < 9 ){
            line[c++] = *ptr;
            ptr += ( c && !(c % 3) ) ? 8 : 1;
        }
        it++;
        ptr = matrix += ( it && !(it % 3) ? 24 : 3);
        if( ! lineck(line) )
            return 0;
    }
    return 1;
}
