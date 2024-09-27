*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/Resource_login.robot
Resource    ../../Resources/Resource_Almoxarifado.robot

*** Test Cases ***

CT01 - Criar Nova Transferência Interna
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


CT03 - Encaminhar Transferência Interna
    [Tags]    Encaminhar
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Transferências
    E pesquiso pela Transferência
    E seleciono a transferência da lista
    Então encaminho a solicitação de Transferencia


CT04 - Aprovar Transferencia Interna
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
    Então encaminho a RMT para Expedição


CT06 - Aprovar Guia de Remessa
    [Tags]    Guia
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Guias de Remessas
    Então aprovo a Guia de Remessa


    