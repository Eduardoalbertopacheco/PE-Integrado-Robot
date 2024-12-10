*** Settings ***
Documentation    Ações e Elementos da Página de Login
Library    SeleniumLibrary
# Library    Browser

*** Variables ***

${URL}     https://www.homologpeintegrado.pe.gov.br/
# ${URL}     https://www.homolog05.peintegrado.pe.gov.br/Default.aspx
# ${URL}     https://www.homolog03.peintegrado.pe.gov.br/default.aspx
# ${URL}     https://www.hotfix.peintegrado.pe.gov.br/core/default.aspx
# ${URL}     http://www.treinapeintegrado.pe.gov.br/default.aspx

${HOMOLOTREI}    http://www.treinapeintegrado.pe.gov.br/core/default.aspx?

*** Keywords ***

# Dado que acesso o sistema
#     New Browser    browser=chromium    headless=False
#     New Context     viewport={ "width": 1200, "height": 720 }
#     New Page    ${URL}
#     Capture Page Screenshot

Dado que acesso o sistema
    SeleniumLibrary.Open Browser    ${URL}    browser=chrome
    Maximize Browser Window
    Capture Page Screenshot


Dado que acesso o sistema no PE Treinamento
    SeleniumLibrary.Open Browser    ${HOMOLOTREI}    browser=chrome
    Maximize Browser Window
    Capture Page Screenshot

E faço login com usuário "${usuario}"
    Input Text        css=input[placeholder='Login']    ${usuario}
    Input Text        css=input[placeholder='Senha']    PE@123456
    Capture Page Screenshot
    Click Element     css=input[type='submit']
    Sleep    3
    Capture Page Screenshot

