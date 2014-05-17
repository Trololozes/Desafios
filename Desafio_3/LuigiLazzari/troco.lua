local grana = { --Tabela q contém a informação das notas e moedas
    { nome = 'Notas de R$ 100,00', valor = 100 },
    { nome = 'Notas de R$ 50,00', valor = 50 },
    { nome = 'Notas de R$ 20,00', valor = 20 },
    { nome = 'Notas de R$ 10,00', valor = 10 },
    { nome = 'Notas de R$ 5,00', valor = 5 },
    { nome = 'Notas de R$ 2,00', valor = 2 },
    { nome = 'Moedas de R$ 1,00', valor = 1 },
    { nome = 'Moedas de R$ 0,50', valor = 0.5 },
    { nome = 'Moedas de R$ 0,25', valor = 0.25 },
    { nome = 'Moedas de R$ 0,10', valor = 0.1 },
    { nome = 'Moedas de R$ 0,05', valor = 0.05 },
}

--nome das funções já descreve, se tiver dúvida pergunta

local function contaQuantidadeResto(val, qntd)
    return math.floor(qntd / val)
end

local function pegaRestoQuantidade(val, qntd)
    return (qntd % val)
end

local function mostraValor(preco, pago, grana)
    local resto = (pago - preco)
    for _, dinheiro in ipairs(grana) do --[[ o _ significa q eu n vou usar a variável 
                                             q estaria no for então eu declaro assim pq é de acordo com as convenções da lingiuagem
                                             de acordo com documentação oficial: http://lua-users.org/wiki/LuaStyleGuide ]]--
        qntd = contaQuantidadeResto(dinheiro.valor, resto)
        resto = pegaRestoQuantidade(dinheiro.valor, resto)

        if qntd > 0 then
            print(dinheiro.nome .. ': ' .. qntd)
        end
    end
end


local preco = 15.25 -- se for usar o interpretador troque 15.25 por io.read(*number)
local pago = 50.00 --mesma coisa do de cima

mostraValor(preco, pago, grana)