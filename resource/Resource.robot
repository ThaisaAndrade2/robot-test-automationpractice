*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary
Library           String

*** Variable ***
${BROWSER}        Chrome
${URL}  http://automationpractice.com/


*** Keywords ***
###Stups e Teardown
Abrir navegador
    Open Browser    about:blank   ${BROWSER}

Fechar navegador
    Close Browser   

###Passo a PassoGenerate Random String

Acessar a página home do site
    Go To            http://automationpractice.com/  
    Title Should Be  My Store
    
Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text       name=search_query  ${PRODUTO}

Clicar no botão Pesquisar
    Click Element    name=submit_search

Conferir mensagem de erro "${ERRO}"
    Wait Until Element Is Visible  //*[@id="center_column"]/p[@class='alert alert-warning']
    Element Text Should Be         //*[@id="center_column"]/p[@class='alert alert-warning']   ${ERRO}


Passar o mouse por cima da categoria "${MENU}" no menu principal superior de categorias
    Mouse Over         //*[@id="block_top_menu"]/ul/li[1]/a[@class='sf-with-ul']

Clicar na sub categoria "${CATEGORIA}"  
    Click Link        //*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a[@title='${CATEGORIA}']
    Title Should Be   Summer Dresses - My Store

Clicar no botão "Add to cart" do produto
    Mouse Over         //*[@id="center_column"]/ul/li/div[@class='product-container']
    Click Link        //*[@id="center_column"]/ul/li[1]/div/div[2]/div[2]/a[1][@title='Add to cart']

Clicar no botão "Proceed to checkout" 
    Wait Until Element Is Visible   //*[@id="layer_cart"]/div[1]/div[1]/div[2]/div[1]/strong
    Click Link                     //*[@id="layer_cart"]/div[1]/div[2]/div[4]/a[@title='Proceed to checkout']

Clicar no ícone carrinho de compras no menu superior direito
    Click Link                    //*[@id="header"]/div[3]/div/div/div[3]/div/a[@title='View my shopping cart']

Clicar no botão de remoção de produtos (delete) no produto do carrinho
    Wait Until Element Is Visible   //*[@id="center_column"]/p[@class='alert alert-warning']

Clicar no botão superior direito “Sign in”
    Click Link                       //*[@id="header"]/div[2]/div/div/nav/div[1]/a[@class='login']
    Wait Until Element Is Visible   //*[@id="center_column"]/h1[@class='page-heading']

Inserir um e-mail válido
    Click Element    name=email_create
    ${EMAIL}         Generate Random String
    Input Text       name=email_create    ${EMAIL}@test.robot.com
    Click Element    //*[@id="create-account_form"][@class='box']
    Wait Until Element Is Visible    //*[@id="create-account_form"]/div/div[2][@class='form-group form-ok']

Clicar no botão "Create na account"
    Click Button     //*[@id="SubmitCreate"][@class='btn btn-default button button-medium exclusive'][@type='submit'][@name='SubmitCreate']

Preencher os campos obrigatórios
    Wait Until Element Is Visible     //*[@id="account-creation_form"]
    Click Element     id=customer_firstname
    Input Text        id=customer_firstname    Thaisa

    Click Element     id=customer_lastname
    Input Text        id=customer_lastname    Andrade

    Click Element     id=passwd
    Input Text        id=passwd    Test@1

    Click Element     id=address1
    Input Text        id=address1  Rua Teste

    Click Element     id=city
    Input Text        id=city  Ibaté

    Click Element     id=id_state
    Click Element    //*[@id="id_state"]/option[34]

    Click Element     id=postcode
    Input Text        id=postcode  14815

    Click Element     id=phone_mobile
    Input Text        id=phone_mobile  993779000

Clicar em "Register"para finalizar o cadastro
    Click Button     //*[@id="submitAccount"][@type='submit'][@name='submitAccount']
    Wait Until Element Is Visible  //*[@id="center_column"]/p[@class='info-account']