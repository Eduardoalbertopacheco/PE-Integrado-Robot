*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/Resource_login.robot
Resource    ../../Resources/Resource_Almoxarifado.robot

*** Keywords ***



*** Test Cases ***

CT01 - Incluir um Novo Almoxarifado
    [Tags]    Incluir
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Almoxarifados
    Então Adiciono um novo almoxarifado
    E vejo a Auditoria do almoxarifado


CT02 - Incluir Mascaras de Endereço
    [Tags]    Mascara
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Almoxarifados
    E pesquiso pelo Almoxarifado
    E clico no Almoxarifado da lista
    Então incluo a Máscara de Endereço


CT03 - Incluir Endereço de Entrada
    [Tags]    Teste
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Almoxarifados
    E pesquiso pelo Almoxarifado
    E clico no Almoxarifado da lista
    Então incluo o Endereço de Entrada


CT03 - Incluir Endereço de Estoque
    [Tags]    Teste
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Almoxarifados
    E pesquiso pelo Almoxarifado
    E clico no Almoxarifado da lista
    Então incluo o Endereço de Estoque


CT4 - Incluir Requisitante
    [Tags]    Incluir_requisitante
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Almoxarifados
    E pesquiso pelo Almoxarifado
    E clico no Almoxarifado da lista
    Então incluo um requisitante


CT05 - Incluir Itens no Almoxarifado
    [Tags]    Incluir_itens
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Almoxarifados
    E pesquiso pelo Almoxarifado
    E clico em Itens do Almoxarifado
    Então incluo os Itens no Almoxarifado








    