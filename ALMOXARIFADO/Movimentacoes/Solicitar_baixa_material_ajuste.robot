*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/Resource_login.robot
Resource    ../../Resources/Resource_Almoxarifado.robot


*** Test Cases ***

CT01 - Incluir Nova Baixa de Material por Ajuste
    [Tags]    Incluir_baixa
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Baixas
    Então incluo uma nova Baixa de Material por Ajuste


CT02 - Incluir Itens para Baixa
    [Tags]    Incluir_baixa
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Baixas
    E pesquiso pela baixa
    E clico na Baixa da lista
    Então seleciono os itens para transaferência
    E vejo a Auditoria do almoxarifado


CT03 - Encaminhar Baixa
    [Tags]    Encaminhar_baixa
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Baixas
    E pesquiso pela baixa
    E seleciono a Baixa da lista
    Então encaminho a solicitação de Transferencia


CT04 - Aprovar Baixa
    [Tags]    Aprovar_baixa
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Baixas
    E pesquiso pela baixa
    E seleciono a Baixa da lista
    Então aprovo a solicitação de Transferência


CT05 - Encaminhar RMT para Expedição
    [Tags]    Encaminhar_RMT
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de preparação
    E pesquiso pela BX
    Então encaminho a RMT para Expedição


CT06 - Aprovar Guia de Remessa
    [Tags]    Aprova_guia
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Guias de Remessas
    Então aprovo a Guia de Remessa

