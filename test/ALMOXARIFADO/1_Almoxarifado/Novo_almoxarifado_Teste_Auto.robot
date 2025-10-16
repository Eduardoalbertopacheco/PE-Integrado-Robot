*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/Resource_login.robot
Resource    ../../Resources/Resource_Almoxarifado.robot


*** Test Cases ***

CT01 - Incluir um Novo Almoxarifado

    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Almoxarifados
    Então Adiciono um novo almoxarifado
    E vejo a Auditoria do almoxarifado


CT02 - Incluir Mascaras de Endereço

    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Almoxarifados
    E pesquiso pelo Almoxarifado
    E clico no Almoxarifado da lista
    Então incluo a Máscara de Endereço


CT03 - Incluir Endereço de Entrada
    
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Almoxarifados
    E pesquiso pelo Almoxarifado
    E clico no Almoxarifado da lista
    Então incluo o Endereço de Entrada


CT03 - Incluir Endereço de Estoque
    
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Almoxarifados
    E pesquiso pelo Almoxarifado
    E clico no Almoxarifado da lista
    Então incluo o Endereço de Estoque


CT4 - Incluir Requisitante
    
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Almoxarifados
    E pesquiso pelo Almoxarifado
    E clico no Almoxarifado da lista
    Então incluo um requisitante


CT05 - Incluir Itens no Almoxarifado
    
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Almoxarifados
    E pesquiso pelo Almoxarifado
    E clico em Itens do Almoxarifado
    Então incluo os Itens no Almoxarifado








    