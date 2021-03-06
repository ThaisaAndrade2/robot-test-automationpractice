*** Settings ***
Resource                  ../resource/Resource.robot


Abrir navegador no inicio do teste
Test Setup  Abrir navegador 

Fechar navegador no final do teste
Test Teardown  Fechar navegador


*** Variables ***


*** Test Case ***
#Cenário 01: Pesquisar produto existente
#    Dado que estou na página home do site 
#    Quando eu pesquisar pelo produto "Blouse"
#    Então o produto "Blouse" deve ser listado na página de resultado da busca

Cenário 02: Pesquisar produto não existente
    Dado que estou na página home do site 
    Quando eu pesquisar pelo produto "itemNãoExistente"
    Então a página deve exibir a mensagem "No results were found for your search "itemNãoExistente""

*** Keywords ***
#REUTILIZAMOS KEYWORDS DE OUTROS TESTES
Dado que estou na página home do site 
    Acessar a página home do site

Quando eu pesquisar pelo produto "${PRODUTO}"
    Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Clicar no botão Pesquisar

Então a página deve exibir a mensagem "${ERRO}"
    Conferir mensagem de erro "${ERRO}"
    