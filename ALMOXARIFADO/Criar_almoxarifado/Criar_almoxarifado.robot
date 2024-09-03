*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/Resource_login.robot
Resource    ../../Resources/Resource_Almoxarifado.robot

*** Keywords ***




*** Test Cases ***

Cenário 01 - Incluir um Novo Almoxarifado
    [Tags]    Incluir
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Almoxarifados
    Então incluo um novo Almoxarifado
    E vejo a Auditoria do almoxarifado


Cenário 02 - Incluir Itens no Almoxarifado
    [Tags]    Incluir_itens
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Almoxarifados
    E pesquiso pelo Almoxarifado
    # E clico no Almoxarifado da lista
    E clico em Itens do Almoxarifado
    Então incluo os Itens no Almoxarifado
    