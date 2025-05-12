*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.saucedemo.com/
${USER}    standard_user
${SENHA}    secret_sauce
${Browser}    Chrome

*** Test Cases ***
Login com sucesso no SauceDemo
    [Documentation]    Teste de login com sucesso no SauceDemo
    Open Browser    ${URL}    ${Browser}     # Abre o navegador especificado
    Input Text   id=user-name    ${USER}   # Preenche o campo de usuário
    Input Text   id=password    ${SENHA}     # Preenche o campo de senha
    Click Button    id=login-button     # Clica no botão de login
    Sleep    10s   # Aguarda 10 segundos antes de prosseguir o próximo passo
    Close Browser     # Fecha o navegador
