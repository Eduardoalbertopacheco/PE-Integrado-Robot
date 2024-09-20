*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/Resource_login.robot
Resource    ../../Resources/Resource_Almoxarifado.robot

*** Keywords ***
Então seleciono os itens para transaferência

    Switch Window    
    Select Frame    //frame[contains(@name,'main')]

    # Clique na aba 'Itens'
    Wait Until Element Is Visible    //span[contains(.,'Itens')]    20
    Click Element    //span[contains(.,'Itens')]
    
    # Clique de Incluir 
    Wait Until Element Is Visible    //a[contains(.,'Incluir')]    30
    Click Element    //a[contains(.,'Incluir')]
    Sleep    2

    Wait Until Element Is Visible    //input[contains(@description,'1000241')]    15
    Click Element    //input[contains(@description,'1000241')]
    Sleep    1
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    10
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    3

    Wait Until Element Is Visible    //span[contains(@class,'k-icon k-i-arrow-n')]    20
    ${elementos}    Get WebElements    //span[contains(@class,'k-icon k-i-arrow-n')]
    ${elemento}    Set Variable    ${elementos}[0]
    Double Click Element    ${elemento}
    Double Click Element    ${elemento}
    Click Element    //span[contains(.,'Itens')]
    Sleep    4
    Capture Page Screenshot

Então aprovo a solicitação de Transferência
    Wait Until Element Is Visible    //a[contains(.,'Aprovar')]    10
    Click Element    //a[contains(.,'Aprovar')]
    Sleep    1
    Capture Page Screenshot

    # Clique sim do popup
    Sleep    1
    Wait Until Element Is Visible    //a[contains(.,'Sim')]    10
    Click Element    //a[contains(.,'Sim')]
    Sleep    3


Então encaminho a solicitação de Transferencia
    Wait Until Element Is Visible    //a[contains(.,'Encaminhar')]    10
    Click Element    //a[contains(.,'Encaminhar')]
    Sleep    1
    Capture Page Screenshot

    # Clique sim do popup
    Sleep    1
    Wait Until Element Is Visible    //a[contains(.,'Sim')]    10
    Click Element    //a[contains(.,'Sim')]
    Sleep    3






*** Test Cases ***

CT01 - Criar Nova Requisição
    [Tags]    Incluir
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Transferências
    Então incluo uma nova Transferências


CT02 - Incluir Itens para Transfência
    [Tags]    Incluir_itens
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Transferências
    E pesquiso pela Transferência
    E clico na Transferência da lista
    Então seleciono os itens para transaferência
    E vejo a Auditoria do almoxarifado


CT03 - Encaminhar Transferência
    [Tags]    Encaminhar
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Transferências
    E pesquiso pela Transferência
    E seleciono a transferência da lista
    Então encaminho a solicitação de Transferencia


CT04 - Aprovar Transferencia
    [Tags]    Aprovar
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Transferências
    E pesquiso pela Transferência
    E seleciono a transferência da lista
    Então aprovo a solicitação de Transferência

CT05 - Encaminhar RMT para Expedição
    [Tags]    Aprovar
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de preparação
    E Pesquiso pela TRN
    