/*
 *
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#ifdef __linux__

#define LINHA 18
#define NL 1

#elif _WIN32

#define LINHA 19
#define NL 2

#endif


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

long get_offset(int itr, int count){
    int offset = LINHA * 9;
    int n = NL;

    while( itr ){
        itr /= 10;
        n++;
    }
    return (n + offset * (count+1)) * sizeof(char);
}

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
