*** Settings ***
Documentation    Fluxo feliz - Cadastro de Pregão Eletronico
Library          SeleniumLibrary
Library          Browser
Library          DateTime
Library          OperatingSystem
Resource        ../../Resources/Resource_login.robot
Resource        ../../Resources/Resource_cadastro_pregao.robot
     

*** Test Cases ***

CT19 - Abrir Lote para disputa Sigilosa 5 min

    Configurar variável Conc_aberto_fechado_lote
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então abros os Lotes


CT20 - Enviar disputa sigilosa Forn01

    Configurar variável Conc_aberto_fechado_lote
    Dado que acesso o sistema
    E faço login com usuário "29219904403.256"
    E acesso a tela de Licitações Eletrônicas
    E seleciono todos os pregões
    E seleciono a licitação da lista
    Então envio o lance 01 para disputa Sigilosa


CT21 - Enviar disputa sigilosa Forn02

    Configurar variável Conc_aberto_fechado_lote
    Dado que acesso o sistema
    E faço login com usuário "29219904403.256"
    E acesso a tela de Licitações Eletrônicas
    E seleciono todos os pregões
    E seleciono a licitação da lista
    Então envio o lance 02 para disputa Sigilosa


CT23 - Encerrar disputa

    Configurar variável Conc_aberto_fechado_lote
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então ecerro a disputa Por Lote
    

CT24 - Abrir Item/Lote para Lei 123

    Configurar variável Conc_aberto_fechado_lote
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então abros os Lotes


CT25 - Encerrar Item/Lote para Lei 123

    Configurar variável Conc_aberto_fechado_lote
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então encerro Lote para Lei 123

CT26 - Convocar vencedor

    Configurar variável Conc_aberto_fechado_lote
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então faço a convocação do vencedor


CT27 - Anexar documento - Vencedor

    Configurar variável Conc_aberto_fechado_lote
    Dado que acesso o sistema
    E faço login com usuário "29219904403.256" 
    E acesso a tela de Licitações Eletrônicas
    E seleciono todos os pregões
    E seleciono a licitação da lista
    Então anexo o documento


CT28 - Habilitar fornecedor vencedor

    Configurar variável Conc_aberto_fechado_lote
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então habilito o fonecedor vencedor (Aberto_Fechado_item)


CT29 - Encerrar etapa

    Configurar variável Conc_aberto_fechado_lote
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então encerro a etapa de pregão eletrônico


CT30 - Registrar intenção de recursos

    Configurar variável Conc_aberto_fechado_lote
    Dado que acesso o sistema
    E faço login com usuário "29219904403.256"
    E acesso a tela de Licitações Eletrônicas
    E seleciono todos os pregões
    E seleciono a licitação da lista
    Então registro intenção de recurso