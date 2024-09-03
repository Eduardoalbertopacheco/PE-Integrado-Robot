*** Settings ***
Documentation    Fluxo feliz - Cadastro de Pregão Eletronico
Library          SeleniumLibrary
Library          Browser
Library          DateTime
Library          OperatingSystem
Resource        ../../Resources/Resource_login.robot
Resource        ../../Resources/Resource_cadastro_pregao.robot

*** Test Cases ***
Cenário 01 - Criar Concorrência Eletrônica - Aba Dados Gerais
    Configurar Variáveis de Pregão

    [Tags]    criar_pregao
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E clico em Incluir Processo

    E seleciono a modalidade para Concorrência Eletrônica
    E Seleciono o Critério de Concorrência Eletrônica
    E insiro as datas para agendamento
    E insiro a Comissão e Salvo
    E Seleciono o Modo de Disputa Aberto
    Então preencho a Aba de Dados Gerais
    E mostro a auditoria


Cenário 02 - Incluir SC na Concorrência
    Configurar Variáveis de Pregão
    Usar SC_Item_Concorrencia_aberto


    [Tags]    incluir_sc_pregao
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso a tela com filtro todas as Licitações
    E clico na licitação da lista
    Então incluo a SC Por Item ao Pregão
    E mostro a auditoria


Cenário 03 - Incluir Documento - Edital
    Configurar Variáveis de Pregão

    [Tags]    Incluir_doc_pregao
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso a tela com filtro todas as Licitações
    E clico na licitação da lista
    E incluo um documento do tipo Edital
    E mostro a auditoria


Cenário 04 - Assinar Documento
    Configurar Variáveis de Pregão

    [Tags]    assinar_doc_pregao
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso a tela com filtro todas as Licitações
    E clico na licitação da lista
    E seleciono assino o documento do tipo Edital
    E mostro a auditoria


Cenário 05 - Solicitar Parecer para Ordenador
    Configurar Variáveis de Pregão

    [Tags]    solicitar_parecer_pregao
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso a tela com filtro todas as Licitações
    E clico na licitação da lista
    E solicito o parecer para o Ordenador
    Então encaminho o Parecer para o ordenador


Cenário 06 - Aprovar parecer Ordenador
    Configurar Variáveis de Pregão

    [Tags]    aprovar_parecer
    Dado que acesso o sistema
    E faço login com usuário "ordenador.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso a tela com filtro todas as Licitações
    E clico na licitação da lista
    E Clique no botão Parecer
    E seleciono o parecer
    Então finalizo o parecer


Cenário 07 - Solicitar Autorização
    Configurar Variáveis de Pregão

    [Tags]    solicitar_autorizacao
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso a tela com filtro todas as Licitações
    E clico na licitação da lista
    E clico no botão solicitar autorização
    Então solicito autorização central


Cenário 08 - Aprovar autorização
    Configurar Variáveis de Pregão

    [Tags]    aprovar_autorizacao
    Dado que acesso o sistema
    E faço login com usuário "autoridadecentral"
    E acesso a tela de Licitações Eletrônicas
    E acesso a tela com filtro todas as Licitações
    E clico na licitação da lista
    E clico em Deliberar
    Então aprovo a autorização
    E mostro a auditoria


Cenário 09 - Agendar Concorrência eletrônica
    Configurar Variáveis de Pregão

    [Tags]    agendar_pregao
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E seleciono a licitação para agendamento
    Então faço o reagendamento
 

Cenário 10 - Envio de propostas Fornecedor 01
    Configurar Variáveis de Pregão

    [Tags]    enviar_proposta01
    Dado que acesso o sistema
    E faço login com usuário "29219904403.256"
    E acesso a tela de Licitações Eletrônicas
    E seleciono todos os pregões
    E seleciono a SC Em propotas da lista
    E seleciono não para lei 123 e confirmo

    E preencho os dados do lance por Item
    Então envio a proposta
    # E vejo a Auditoria
    

Cenário 11 - Envio de propostas Fornecedor 02
    Configurar Variáveis de Pregão

    [Tags]    enviar_proposta02
    Dado que acesso o sistema
    E faço login com usuário "02355633000148"
    E acesso a tela de Licitações Eletrônicas
    E seleciono todos os pregões
    E seleciono a licitação da lista
    E seleciono não para lei 123 e confirmo
    E preencho os dados do lance por Item
    Então envio a proposta
    # E vejo a Auditoria


Cenário 12 - Prorrogar Concorrência
    Configurar Variáveis de Pregão

    [Tags]    prorrogar_pregao
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    E clico em prorrogar pregão
    E insiro as novas datas
    Então faço o prorrogamento
    # E Acesso a Auditoria


Cenário 13 - Abertura das propostas
    Configurar Variáveis de Pregão

    [Tags]    abrir_propostas
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação em abertura de proposta da lista
    Então abro as proposta


Cenário 14 - Iniciar disputa
    Configurar Variáveis de Pregão

    [Tags]    iniciar_disputa
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então inicio a disputa

Cenário 15 - Abrir Itens/Lotes para disputa
    Configurar Variáveis de Pregão

    [Tags]    abrir_itens
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então abros os itens


Cenário 16 - Enviar disputa Fornecedor 01
    Configurar Variáveis de Pregão

    [Tags]    enviar_disputa01
    Dado que acesso o sistema
    E faço login com usuário "29219904403.256"
    E acesso a tela de Licitações Eletrônicas
    E seleciono todos os pregões
    E seleciono a licitação da lista
    Então envio o lance


Cenário 17 - Enviar disputa Fornecedor 02
    Configurar Variáveis de Pregão

    [Tags]    enviar_disputa02
    Dado que acesso o sistema
    E faço login com usuário "02355633000148"
    E acesso a tela de Licitações Eletrônicas
    E seleciono todos os pregões
    E seleciono a licitação da lista
    Então envio o segundo lances


   



    
    
    



    





