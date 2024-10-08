*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/Resource_login.robot
Resource    ../../Resources/Resource_Almoxarifado.robot

*** Keywords ***


*** Test Cases ***


CT01 - Criar um novo Inventário

    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de inventários
    Então crio um novo Inventário


CT02 - Agendar Inventário

    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de inventários
    E pesquiso pelo Inventário
    E seleciono o inventário da lista
    Então agendo o Inventário


CT03 - Abrir Inventário

    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de inventários
    E pesquiso pelo Inventário
    E clico no inventário da Lista
    Então abro o inventário


CT04 - Encerrar Contagem

    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de inventários
    E pesquiso pelo Inventário
    E clico no Inventário Aberto
    Então encerro a Contagem do Inventário


CT05 - Encerrar Inventário

    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de inventários
    E pesquiso pelo Inventário
    E clico no Inventário Aberto
    Então Encerro o Inventário

CT06 - Aprovar Inventário

    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de inventários
    E pesquiso pelo Inventário
    E clico no inventário Agurdando Aprovação
    Então aprovo o inventário
