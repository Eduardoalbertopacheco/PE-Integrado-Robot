*** Settings ***
Library    SeleniumLibrary

Resource    ../Login.resource

*** Variables ***

*** Keywords ***

*** Test Cases ***
Incluir um Novo Almoxarifado
    [Tags]    Incluir
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"