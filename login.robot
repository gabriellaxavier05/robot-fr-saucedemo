*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Login com sucesso    # Nome do CT
    Open Browser    url=https://www.saucedemo.com/    browser=Chrome    # Abre no navegador especificado a URL passada
    Wait Until Element Is Visible    id=user-name     # Espera o elemento ser visível
    Input Text    id=user-name    standard_user    # Preenche o campo de texto com o valor passado
    Input Text    id=password    secret_sauce    # Preenche o campo de texto com o valor passado
    Click Button    id=login-button    # Clica no botão de login

Falha login - sem credenciais
    Open Browser    url=https://www.saucedemo.com/    browser=Chrome    
    Wait Until Element Is Visible    id=user-name     
    Click Button    id=login-button    
    Wait Until Element Contains    class=error-message-container    text=Epic sadface: Username is required     # Espera o elemento ser visível

Falha login - sem usuário
    Open Browser    url=https://www.saucedemo.com/    browser=Chrome    
    Wait Until Element Is Visible    id=user-name     
    Input Text    id=password    text=secret_sauce    # Preenche o campo de texto com o valor passado
    Click Button    id=login-button    
    Wait Until Element Contains    class=error-message-container    text=Epic sadface: Username is required

Falha login - sem senha
    Open Browser    url=https://www.saucedemo.com/    browser=Chrome    
    Wait Until Element Is Visible    id=user-name     
    Input Text    id=user-name    text=standard_user    # Preenche o campo de texto com o valor passado
    Click Button    id=login-button    
    Wait Until Element Contains    class=error-message-container    text=Epic sadface: Password is required

Falha login - credenciais inválidas
    Open Browser    url=https://www.saucedemo.com/    browser=Chrome    # Abre no navegador especificado a URL passadas
    Wait Until Element Is Visible    id=user-name     # Espera o elemento ser visível
    Input Text    id=user-name    usuario1    # Preenche o campo de texto com o valor passsado
    Input Text    id=password    senha123    # Preenche o campo de texto com o valor passado
    Click Button    id=login-button    # Clica no botão de login
    Wait Until Element Contains    class=error-message-container    text=Epic sadface: Username and password do not match any user in this service