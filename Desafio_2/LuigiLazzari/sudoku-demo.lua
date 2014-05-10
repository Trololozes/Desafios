sudoku = " 1 2 3 4 5 6 7 8 9 " ..
         " 4 5 6 7 8 9 1 2 3 " ..
         " 7 8 9 1 2 3 4 5 6 " ..
         " 8 9 1 2 3 4 5 6 7 " ..
         " 2 3 4 5 6 7 8 9 1 " ..
         " 5 6 7 8 9 1 2 3 4 " ..
         " 6 7 8 9 1 2 3 4 5 " ..
         " 9 1 2 3 4 5 6 7 8 " ..
         " 3 4 5 6 7 8 9 1 2 " --deixando bonito para testes, inicializando o sudoku com um que é válido
sudoku = sudoku:gsub(" ", ""); -- tira espaços /fail

tables = {                 -- checando array, 1=linha, 2=coluna, 3=quadrantes
            {}, {}, {}
         } 

for k = 1, 3 do
    for l = 1, 9 do 
        tables[k][l] = {0, 0, 0, 0, 0, 0, 0, 0, 0} -- enche o array com 0s (só pra não ter nils)
    end 
end 

for k=1, 81 do -- loop por todas as posições
    number = tonumber(sudoku:sub(k,k):match'%d') -- pega o caracter, checa se é um número e converte pra número (pq está como string)
    if number then
        crazy = {math.floor((k-1)/9)+1,(k-1)%9+1} -- Pega o numero da linha e da coluna
        crazy[3] = math.floor((crazy[1]-1)/3)+3*math.floor((crazy[2]-1)/3)+1 -- Pega o numero do quadrante
        for l = 1,3 do v = tables[l][crazy[l]] -- 1 = linha, 2 = coluna, 3 = quadrante
            if v[number] then -- não eliminados nessa coluna/linha/quadrante
                v[number] = nil    
            else
                flag = 1 -- Inválido
            end
        end
    end
end
io.write(flag and"Invalid"or"Valid")