*** Settings ***
Documentation    Fluxo feliz - Cadastro de Pregão Eletronico
Library          SeleniumLibrary
Library          Browser
Library          DateTime
Library          OperatingSystem
Resource        ../../../Resources/Resource_login.robot
Resource        ../../../Resources/Resource_cadastro_pregao.robot
     

*** Test Cases ***

CT26 - Não acatar intenção de recursos

    Configurar variável aberto_lote
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    Sleep    1
    E seleciono a licitação da lista
    Então não acato a intenção de recurso


CT27 - Gravar valor do Lote

    Configurar variável aberto_lote
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação em ajuste de preços da lista
    Então gravo o valor do lote


CT28 - Adjudicar Pregão

    Configurar variável aberto_lote
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E clico na licitação em Adjudicação da lista
    Então adjudico o pregão eletrônico


CT29 - Homologar Pregão

    Configurar variável aberto_lote
    Dado que acesso o sistema
    E faço login com usuário "autoridade.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então homologo o pregão