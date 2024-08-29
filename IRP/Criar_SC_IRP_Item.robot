*** Settings ***
Documentation    Cadastro de uma SC oriunda de uma IRP por Item - Fluxo Feliz

Resource    ../Resources/Resource_IRP.robot
Resource    ../Resources/Resource_login.robot

*** Keywords ***

Então Gero a SC da IRP
    Switch Window
    Select Frame    //frame[@name='main']

    Wait Until Element Is Visible    //a[contains(.,'Gerar SC')]    30
    Click Element    //a[contains(.,'Gerar SC')]

    # confirmação do popup
    Wait Until Element Is Visible    //a[contains(.,'Sim')]    30
    Click Element    //a[contains(.,'Sim')]
    Sleep    3


*** Test Cases ***

Cenário 01 - Gerar SC por Item de Uma IRP
    [Tags]    criar_sc
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a lista de IRPs
    E clico na IRP da Lista
    Então Gero a SC da IRP