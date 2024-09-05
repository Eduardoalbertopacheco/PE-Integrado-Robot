*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/Resource_login.robot
Resource    ../../Resources/Resource_Almoxarifado.robot

*** Keywords ***

*** Test Cases ***

Cenário 01 - Fazer um Novo recebimento do Almoxarifado
    Definir Data Atual
    [Tags]    Incluir
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Recebimento
    Definir Data Atual
    Então incluo um novo Recebimento    ${current_date}


Cenário 02 - Incluir itens para recebimento
    [Tags]    Incluir_itens
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Recebimento
    E clico no recebimento da lista
    Então incluo os Itens para recebimento


Cenário 03 - Encaminhar Recebimento
    [Tags]    Encaminhar
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Recebimento
    E clico no recebimento da lista
    Então faço o encaminhamento do Recebimento


Cenário 04 - Realizar atestado Técnico
    [Tags]    Aprovar_atestado
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Recebimento
    E clico no registro em Recebimento da lista
    Então realizo o atestado técnico


Cenário 05 - Incluir Nota Fiscal
    [Tags]    Incluir_nota
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Recebimento
    E clico no registro em Recebimento da lista
    Então incluo a nota fiscal


Cenário 06 - Responder avaliação de Conformidade
    [Tags]    Responder_conformidade
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Recebimento
    E clico no registro em Recebimento da lista
    Então respondo a avaliação de conformidade


Cenário 07 - Aprovar Recebimento Provisório
    [Tags]    Aprovar
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Recebimento
    E clico no registro em Recebimento da lista
    Então aprovo o recebimento provisório


Cenário 08 - Aprovar Recebimento Definitivo
    [Tags]    Aprovar
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Recebimento
    E clico no registro em Recebimento da lista
    Então aprovo o recebimento definitivo


Cenário 09 - Fazer estocagem dos Itens
    [Tags]    Estocar
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Almoxarifados
    E pesquiso pelo Almoxarifado
    E clico em Itens do Almoxarifado
    E seleciono no filtro exibir todos os produtos
    Então movimento os itens para estoque