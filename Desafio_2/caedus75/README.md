# Sudoku

Implementação, no bom e velho C, da resolução do Desafio 2.  
Compilem o código fonte, preparem um arquivo de entrada nos moldes definidos
pelo desafio e rodem o programa!

    sudoku -f [arquivo].txt

Deve funcionar no Windows, não testei.  
O que pode dar pau é o caractere '\n' no Windows ser 2 bytes. Os *\#defines*
devem resolver esse problema, mas eu não rodei pra ver se minha suposição
procede! xD

# Teste

Incluido está o meu arquivo de testes com 5 jogos, 3 deles com erro e 2 válidos!

Os jogos 1, 2, e 4 tem problemas nas linhas, colunas e quadrantes,
respectivamente.  
Os jogos 3 e 5 são válidos e devem retornar SIM.
