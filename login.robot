*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Login com sucesso    # Nome do CT
    Open Browser    url=https://www.saucedemo.com/    browser=Chrome    # Abre no navegador especificado a URL passada
    Wait Until Element Is Visible    id=user-name     # Espera o elemento ser visível
    Input Text    id=user-name    standard_user    # Preenche o campo de texto com o valor passado
    Input Text    id=password    secret_sauce    # Preenche o campo de texto com o valor passado
    Click Button    id=login-button    # Clica no botão de login
