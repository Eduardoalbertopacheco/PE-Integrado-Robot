*** Settings ***
Library    SeleniumLibrary

*** Variables ***

${URL}     https://www.homologpeintegrado.pe.gov.br/default.aspx

*** Keywords ***
Dado que acesso o sistema
    SeleniumLibrary.Open Browser    ${URL}    browser=chrome
    Maximize Browser Window
    Capture Page Screenshot
    

E faço login com usuário "${usuario}"
    Input Text        css=input[placeholder='Login']    ${usuario}
    Input Text        css=input[placeholder='Senha']    PE@123456
    Capture Page Screenshot
    Click Element     css=input[type='submit']
    Sleep    3
    Capture Page Screenshot

