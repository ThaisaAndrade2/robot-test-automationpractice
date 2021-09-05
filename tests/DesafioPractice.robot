*** Settings ***
Resource                  ../resource/Resource.robot
###Abrir navegador no inicio do teste
Test Setup  Abrir navegador 
###Fechar navegador no final do teste
Test Teardown  Fechar navegador


*** Variables ***


*** Test Case ***

Listar Produtos
    Acessar a página home do site
    Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    Clicar na sub categoria "Summer Dresses" 

Adicionar Produtos no Carrinho
    Acessar a página home do site
    Digitar o nome do produto "t-shirt" no campo de pesquisa
    Clicar no botão Pesquisar
    Clicar no botão "Add to cart" do produto
    Clicar no botão "Proceed to checkout" 

Remover Produtos
    Acessar a página home do site
    Clicar no ícone carrinho de compras no menu superior direito
    Clicar no botão de remoção de produtos (delete) no produto do carrinho

Adicionar Cliente
    Acessar a página home do site
    Clicar no botão superior direito “Sign in”
    Inserir um e-mail válido
    Clicar no botão "Create na account"
    Preencher os campos obrigatórios
    Clicar em "Register"para finalizar o cadastro
