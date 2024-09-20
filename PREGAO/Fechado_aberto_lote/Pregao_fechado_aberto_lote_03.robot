*** Settings ***
Documentation    Fluxo feliz - Cadastro de Pregão Eletronico
Library          SeleniumLibrary
Library          Browser
Resource        ../../Resources/Resource_login.robot
Resource        ../../Resources/Resource_cadastro_pregao.robot
     

*** Test Cases ***

# Estes cenários só podem ser rodados após 10min
CT26 - Não acatar intenção de recursos
    Configurar variável fechado_aberto_lote

    [Tags]    nao_acatar_recurso
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então não acato a intenção de recurso


CT27 - Gravar preço dos Lotes
    Configurar variável fechado_aberto_lote

    [Tags]    Reajuste_Lote
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então gravo o valor do lote


CT28 - Adjudicar Pregão
    Configurar variável fechado_aberto_lote

    [Tags]    adjudicar_pregao
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E clico na licitação em Adjudicação da lista
    Então adjudico o pregão eletrônico

CT29 - Homologar Pregão
    Configurar variável fechado_aberto_lote
    
    [Tags]    homologar_pregao
    Dado que acesso o sistema
    E faço login com usuário "autoridade.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então homologo o pregão