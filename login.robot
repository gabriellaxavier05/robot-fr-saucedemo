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
    Wait Until Page Contains Element    xpath=//span[text()='Products']    timeout=5s   # Aguarda no máximo 5s até que o elemento esteja presente na página
    Page Should Contain Element    xpath=//span[text()='Products']   # Verifica se o elemento está presente na página
    Close Browser     # Fecha o navegador