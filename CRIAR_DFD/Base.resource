*** Settings ***

Documentation    Arquivo principal do projeto Robot
Library          SeleniumLibrary

Resource    ../DFD/Resources/Login.resource

*** Variables ***
${URL}           https://www.homologpeintegrado.pe.gov.br/default.aspx

*** Keywords ***
Dado que acesso o sistema
    SeleniumLibrary.Open Browser    ${URL}    browser=chrome    # options=add_argument(${CHROME_OPTIONS})
    Maximize Browser Window
    Capture Page Screenshot
