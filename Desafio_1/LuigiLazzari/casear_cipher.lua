function Demo() -- Gera uma sequencia randomicamente >:}
charset = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" -- quais caracteres farão parte da sequencia
   local value = "" -- inicializa a string a ser gerada
      math.randomseed(os.time())	-- seed do random, melhor forma de ser realmente random.
      for i = 1, math.random(16, 40) do
         rand = math.random(#charset)	-- tamanho do charset, no caso 62
         value = value.. string.sub(charset, rand, rand)
         --[[
            Mágica! value se une a uma substring do charset randomicamente gerada até a mesma letra.
	  	      Se não fizesse assim ia ter q usar tabela e ia ficar muito grande)
	  	      seria assim: value = "" .. charset, 2, 2 então value seria 1
	  	   ]]--
      end
   return value
end

local function caesar(input, shift)
   input = input:gsub(" ", Demo()) -- procura por espaços e substitui pela string randomica "%s"?

   return input:gsub("%a", function(x)
   --[[
      Retorna uma cópia do input em que todas as ocorrências da pattern "%a"
      (que no caso, representa todas as letras)
      são trocadas pelo 2º parâmetro (que no caso é uma função)
   ]]--

   local test = (x:lower() == x and string.byte('a') or string.byte('A'))
   --[[
      Funciona basciamente como o operador ternário em C: (a ? b : c).
      string.byte('x') retorna o código decimal do caractere.
      oq está escrito é: test = (if x == lower then true; else false) and 97 or 65
      se for true retorna o caractere 97, se não, retorna o caractere 65.
   ]]--

   local crypt = x:byte() - test  -- crypt = código decimal do caractere x - código decimal da variável test
   crypt = crypt + (shift)          -- crypt = crypt + variável shift
   crypt = crypt%26               -- funciona mesmo que crypt seja negativo. 26 = n de letras no alfabeto
   crypt = crypt + test           -- crypt = crypt + 97 se for lower ou 65 se for upper
   return string.char(crypt)
   --[[
   	O que foi retornado?
   	Simples padawan: texto = 'c', shift = 3
   	test = 97
   	crypt = 99 - 97
   	crypt = 2 + 3
   	crypt = 5%26
   	crypt = 5 + 97
   	ao final da função crypt estará valendo 102, que é o código deciaml de 'f', ou seja 'c' com shift de 3 vale 'f'
   ]]--
   end)
end

local function decrypt(input, shift)
   local decrypt =  caesar(input, -shift)
   --[[
      para descriptografar é só receber o texto criptografado e aplicar o shift negativo, no exemplo acima 102 - 3 = 99
      ou seja 'f' volta a valer 'c'
   ]]--
   return (decrypt:gsub(Demo(), function(text) return " " end)) -- substitui a string randomica pelo espaço novamente
end


function read()
    io.write("Digite o nome do arquivo em que a mágica vai ocorrer. (Com extensão. E.g. MeuArquivo.txt)")
    local filename = io.read()
    local f = io.open(filename, "r")
    if f == nil then
      print ("Arquivo ta cagado.")
    else 
      local content = f:read("*all")
      f:close()
    end
    return content
end


-- Iniciando checagem de erros, tests pending
do
	local input = read()
	io.write("Digite o shift: ")
	local shift = io.read() -- if err?

	local e = caesar(input, shift)
	local d = decrypt(e, shift)

	local f = io.open("crypt.txt", "w") -- salva arquivo critografado, se não existir, cria um
  local x = f:write(e)
  f:close()

	print("Texto Original: ", input) -- para testes
	print("Texto criptografado: ", e) -- para testes

	local fp = io.open("descrypt.txt", "w") --salva arquivo descriptografado, se não existir, cria um
  local z = fp:write(d)
  fp:close()
	print("Texto descriptografado: ", d) -- para testes
end