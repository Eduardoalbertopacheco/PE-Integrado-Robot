*** Settings ***
Documentation    Fluxo feliz - Cadastro de Pregão Eletronico
Library          SeleniumLibrary
Library          Browser
Library          DateTime
Library          OperatingSystem
Resource        ../../Resources/Resource_login.robot
Resource        ../../Resources/Resource_cadastro_pregao.robot

*** Test Cases ***

CT23 - Encerrar disputa
    Configurar variável fechado_aberto_lote

    [Tags]    encerrar_disputa
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então ecerro a disputa Por Lote
    

CT24 - Abrir Item/Lote para Lei 123
    Configurar variável fechado_aberto_lote

    [Tags]    abrir_lei_123
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então abros os Lotes


CT25 - Encerrar Item/Lote para Lei 123
    Configurar variável fechado_aberto_lote

    [Tags]    encerrar_lei_123
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então encerro Lote para Lei 123


CT26 - Convocar vencedor
    Configurar variável fechado_aberto_lote

    [Tags]    convocar_vencedor
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então faço a convocação do vencedor


CT27 - Anexar documento - Vencedor
    Configurar variável fechado_aberto_lote

    [Tags]    anexar_documento_vencedor
    Dado que acesso o sistema
    E faço login com usuário "02355633000148"
    E acesso a tela de Licitações Eletrônicas
    E seleciono todos os pregões
    E seleciono a licitação da lista
    Então anexo o documento


CT28 - Habilitar fornecedor vencedor
    Configurar variável fechado_aberto_lote

    [Tags]    habilitar_fornecedor
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então habilito o fonecedor vencedor (Aberto_item)


CT29 - Encerrar etapa
    Configurar variável fechado_aberto_lote

    [Tags]    encerrar_etapa
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então encerro a etapa de pregão eletrônico


CT30 - Registrar intenção de recursos
    Configurar variável fechado_aberto_lote
    
    [Tags]    registrar_recurso
    Dado que acesso o sistema
    E faço login com usuário "29219904403.256"
    E acesso a tela de Licitações Eletrônicas
    E seleciono todos os pregões
    E seleciono a licitação da lista
    Então registro intenção de recurso