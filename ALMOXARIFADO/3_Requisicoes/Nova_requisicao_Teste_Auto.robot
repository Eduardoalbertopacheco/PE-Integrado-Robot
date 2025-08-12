*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/Resource_login.robot
Resource    ../../Resources/Resource_Almoxarifado.robot

*** Test Cases ***

CT01 - Criar Nova Requisição
    [Tags]    Incluir
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de requisições
    Então incluo uma nova riquisição


CT02 - Selecionar Itens para Requisição
    [Tags]    Incluir_itens
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de requisições
    E pesquiso pela Requisição
    E clico na requisição da lista
    Então incluo os itens para Requisição


CT03 - Encaminhar Requisição
    [Tags]    Encaminhar_requisicao
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de requisições
    E pesquiso pela Requisição
    E clico na requisição da lista
    Então Encaminho a Requisição


CT04 - Encaminhar Requisição para Preparação
    [Tags]    Encaminhar_preparacao
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de requisições
    E pesquiso pela Requisição
    E clico na requisição da lista
    Então encaminho para preparação


CT05 - Encaminhar Itens para Expedição
    [Tags]    Encaminhar_expedicao
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a tela de preparação
    E pesquiso pela Requisição dos Itens
    Então encaminho para Expedição


CT06 - Aprovar a Guia De remessa
    [Tags]    Aprovar_guia
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a tela de Guias de Remessa
    Então aprovo a Guia de Remessa



