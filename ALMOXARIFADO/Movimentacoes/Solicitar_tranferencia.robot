*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/Resource_login.robot
Resource    ../../Resources/Resource_Almoxarifado.robot

*** Keywords ***

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


    