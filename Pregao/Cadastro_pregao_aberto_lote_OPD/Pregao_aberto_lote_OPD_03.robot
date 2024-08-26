*** Settings ***
Documentation    Fluxo feliz - Cadastro de Pregão Eletronico
Library          SeleniumLibrary
Library          Browser
Library          DateTime
Library          OperatingSystem
Resource        ../../Pages/Login.robot
Resource        ../../Pages/Resource_Cadastro_pregao.robot
     

*** Test Cases ***

# Estes cenários só podem ser rodados após 10min
Cenário 26 - Não acatar intenção de recursos
    [Tags]    nao_acatar_recurso
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.070001"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então não acato a intenção de recurso


Cenário 27 - Gravar valor do Lote
    [Tags]    gravar_Lote
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.070001"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação em ajuste de preços da lista
    # E seleciono a licitação da lista
    Então gravo o valor do lote


Cenário 27 - Adjudicar Pregão
    [Tags]    adjudicar_pregao
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.070001"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então adjudico o pregão eletrônico

Cenário 28 - Homologar Pregão
    [Tags]    homologar_pregao
    Dado que acesso o sistema
    E faço login com usuário "autoridade.070001"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então homologo o pregão