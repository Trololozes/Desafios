sudo="1 2 3 4 5 6 7 8 9" ..
     "4 5 6 7 8 9 1 2 3" ..
     "7 8 9 1 2 3 4 5 6" ..
     "8 9 1 2 3 4 5 6 7" ..
     "2 3 4 5 6 7 8 9 1" ..
     "5 6 7 8 9 1 2 3 4" ..
     "6 7 8 9 1 2 3 4 5" ..
     "9 1 2 3 4 5 6 7 8" ..
     "3 4 5 6 7 8 9 1 2" --deixando bonito para testes, inicializando o sudoku com um que é válido

tables = {
    {}, {}, {} -- inicializando 1 tabela para linhas, colunas e para cada grade 3x3, respectivamente
} 

for i=1,3 do -- k=1, 3 pq é o número de tabelas em tables
    for j=1,9 do 
        tables[i][j]={0,0,0,0,0,0,0,0,0} --[[ colocar 0's em cada uma das tabelas em tables para evitar nils.
                                              Cada tabela tem 9 elementos :D ]]--
    end
end 

for i=1,81 do -- loop por todos os números
    n=tonumber(sudo:sub(i,i):match'%d') --[[ pega o caractere, checa se é um número com match'%d', 
                                             e converte para número com sub(k,k), pq está td inicializado como string. ]]--
    if n then

      --conta foda a ser implementada hu3
