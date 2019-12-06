#language: pt

Funcionalidade: Verificar funcionalidade da API

@valid_cep
Cenário: Validar cep válido
    Dado que tenha um cep válido
    Quando colocar o cep no endereço
    Então deve me retornar cep, logradouro, bairro, localidade, uf e o código IBGE

@invalid_cep
Cenário: Validar cep inválido
    Dado que tenha um cep inválido
    Quando inserir o cep no endereço
    Então exiba a mensagem de erro 
