# frozen_string_literal: true

Dado('que tenha um cep válido') do
  @cep = '01301100'
end

Quando('colocar o cep no endereço') do
  @response = HTTParty.get("https://viacep.com.br/ws/#{@cep}/json/")
end

Então("deve me retornar cep, logradouro, bairro, localidade, uf e o código IBGE") do
  expect(@response.code).to eq(200)
  expect(@response['cep']).to eq('01301-100')
  expect(@response['logradouro']).to eq("Rua da Consolação")
  expect(@response['bairro']).to eq("Consolação")
  expect(@response['uf']).to eq('SP')
  expect(@response['ibge']).to eq('3550308')
  puts @response['ibge']
end

Dado("que tenha um cep inválido") do
  @cep_invalido = '12546589'
end

Quando("inserir o cep no endereço") do
  @response = HTTParty.get("https://viacep.com.br/ws/#{@cep_invalido}/json/")
end

Então('exiba a mensagem de erro') do
  expect(@response['erro']).to eq(true)
  puts @response['erro']
  expect(@response.code).to eq(200)
  puts @response.code
end
