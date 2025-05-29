*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.saucedemo.com/    
${BROWSER}    chrome
${USERNAME}    standard_user
${PASSWORD}    secret_sauce

*** Test Cases ***
Login com sucesso    # Nome do CT
    Open Browser    ${URL}    browser=${BROWSER}    # Abre no navegador especificado a URL passada
    Wait Until Element Is Visible    id=user-name     # Espera o elemento ser visível
    Input Text    id=user-name    ${USERNAME}    # Preenche o campo de texto com o valor passado
    Input Text    id=password    ${PASSWORD}    # Preenche o campo de texto com o valor passado
    Click Button    id=login-button    # Clica no botão de login
    ${location}    Get Location    # Pega a URL atual
    Should Be Equal    ${location}    https://www.saucedemo.com/inventory.html     # Verifica se a URL é a esperada

Falha login - sem credenciais
    Open Browser    ${URL}    browser=${BROWSER}    
    Wait Until Element Is Visible    id=user-name     
    Click Button    id=login-button    
    Wait Until Element Contains    class=error-message-container    text=Epic sadface: Username is required     # Espera o elemento ser visível

Falha login - sem usuário
    Open Browser    ${URL}    browser=${BROWSER} 
    Wait Until Element Is Visible    id=user-name     
    Input Text    id=password    text=${USERNAME}    # Preenche o campo de texto com o valor passado
    Click Button    id=login-button    
    Wait Until Element Contains    class=error-message-container    text=Epic sadface: Username is required

Falha login - sem senha
    Open Browser    ${URL}    browser=${BROWSER}  
    Wait Until Element Is Visible    id=user-name     
    Input Text    id=user-name    text=${USERNAME}    # Preenche o campo de texto com o valor passado
    Click Button    id=login-button    
    Wait Until Element Contains    class=error-message-container    text=Epic sadface: Password is required

Falha login - credenciais inválidas
    Open Browser    ${URL}    browser=${BROWSER}     # Abre no navegador especificado a URL passadas
    Wait Until Element Is Visible    id=user-name     # Espera o elemento ser visível
    Input Text    id=user-name    usuario1    # Preenche o campo de texto com o valor passsado
    Input Text    id=password    senha123    # Preenche o campo de texto com o valor passado
    Click Button    id=login-button    # Clica no botão de login
    Wait Until Element Contains    class=error-message-container    text=Epic sadface: Username and password do not match any user in this service