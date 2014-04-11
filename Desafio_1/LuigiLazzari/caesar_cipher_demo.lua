function Demo() -- Gera uma sequencia randomicamente >:}
charset = "@#&���0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" -- quais caracteres far�o parte da sequencia
   local value = "" -- inicializa a string a ser gerada
      math.randomseed(os.time()) -- seed do random, melhor forma de ser realmente random.
      mindfuck = math.ceil((math.pi*(math.pow((math.sqrt(#charset)),(#charset/math.pow(math.pi, 
                 (#charset/(math.pi*math.pi+(#charset/math.pi))))))/math.pow(math.pi, math.sqrt(#charset))))) -- hueBRHU3
      dawhat = (math.ceil(string.byte("k")*(#charset/(math.pow(math.pi, (math.pi-(#charset/string.byte("z")))))))) -- hueBRHU3

      for i = 1, math.random(mindfuck, dawhat) do
         rand = math.random(#charset)  -- tamanho do charset, no caso 71
         value = value .. string.sub(charset, rand, rand)
         --[[
            M�gica! value se une a uma substring do charset randomicamente gerada at� a mesma letra.
            Se n�o fizesse assim ia ter q usar tabela e ia ficar muito grande)
            seria assim: value = "" .. charset, 2, 2 ent�o value seria 1
         ]]--
      end
   return value
end

local function caesar(input, shift)
   input = input:gsub(" ", Demo()) -- procura por espa�os e substitui pela string randomica
   return input:gsub("%a", function(x)
   --[[
      Retorna uma c�pia do input em que todas as ocorr�ncias da pattern "%a"
      (que no caso, representa todas as letras)
      s�o trocadas pelo 2� par�metro (que no caso � uma fun��o)
   ]]--

   local test = (x:lower() == x and string.byte('a') or string.byte('A'))
   --[[
      Funciona basciamente como o operador tern�rio em C: (a ? b : c).
      string.byte('x') retorna o c�digo decimal do caractere.
      oq est� escrito �: test = (if x == lower then true; else false) and 97 or 65
      se for true retorna o caractere 97, se n�o, retorna o caractere 65.
   ]]--

   local crypt = x:byte() - test  -- crypt = c�digo decimal do caractere x - c�digo decimal da vari�vel test
   crypt = crypt + shift          -- crypt = crypt + vari�vel shift
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
      ao final da fun��o crypt estar� valendo 102, que � o c�digo deciaml de 'f', ou seja 'c' com shift de 3 vale 'f'
   ]]--
   end)
end

local function decrypt(input, shift)
   local decrypt =  caesar(input, -shift)
   --[[
      para descriptografar � s� receber o texto criptografado e aplicar o shift negativo, no exemplo acima 102 - 3 = 99
      ou seja 'f' volta a valer 'c'
   ]]--
   return (decrypt:gsub(Demo(), function(text) return " " end)) -- substitui a string randomica pelo espa�o novamente
end

-- Testando
do
   local input = "A r�pida raposa pula por cima do cachorro pregui�oso"
   local shift = 3


   if type(input) == nil then
      print("Arruma essa frase bahian�o.")
   elseif type(shift) ~= "number" then
      print("Shift tem q ser um n�mero.")
   else 
      local e = caesar(input, shift)
      local d = decrypt(e, shift)
      print("Texto Original:", input)
      print("Texto criptografado:", e)
      print("Texto descriptografado:", d)
   end
end