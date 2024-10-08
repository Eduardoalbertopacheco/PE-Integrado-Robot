*** Settings ***
Documentation    Ações e Elementos da Página de Login
Library    SeleniumLibrary

*** Variables ***

${URL}     https://www.homologpeintegrado.pe.gov.br/default.aspx
# ${URL}     https://www.homolog05.peintegrado.pe.gov.br/Default.aspx
# ${URL}     https://www.homolog03.peintegrado.pe.gov.br/default.aspx
# ${URL}     https://www.hotfix.peintegrado.pe.gov.br/core/default.aspx

*** Keywords ***
Dado que acesso o sistema
    SeleniumLibrary.Open Browser    ${URL}    browser=chrome
    # SeleniumLibrary.Open Browser    ${URL}    chrome    options=--headless
    Maximize Browser Window
    Capture Page Screenshot
    

E faço login com usuário "${usuario}"
    Input Text        css=input[placeholder='Login']    ${usuario}
    Input Text        css=input[placeholder='Senha']    PE@123456
    Capture Page Screenshot
    Click Element     css=input[type='submit']
    Sleep    3
    Capture Page Screenshot

