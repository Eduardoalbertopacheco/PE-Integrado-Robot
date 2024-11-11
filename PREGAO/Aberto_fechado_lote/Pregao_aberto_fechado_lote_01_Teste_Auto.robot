*** Settings ***
Documentation    Fluxo feliz - Cadastro de Pregão Eletronico
Library          SeleniumLibrary
Library          Browser
Library          DateTime
Library          OperatingSystem
Resource        ../../Resources/Resource_login.robot
Resource        ../../Resources/Resource_cadastro_pregao.robot
     

*** Test Cases ***
CT01 - Criar Pregão - Aba Dados Gerais

    Configurar Variáveis de Pregão
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E clico em Incluir Processo
    E seleciono a modalidade para Pregão Eletrônico
    E Seleciono o Critério de Pregão Eletrônico
    E insiro as datas para agendamento
    E insiro a Comissão e Salvo
    E Seleciono o Modo de Disputa Aberto-Fechado
    Então preencho a Aba de Dados Gerais
    E mostro a auditoria


CT02 - Incluir SC ao Pregão

    Configurar Variáveis de Pregão
    Usar SC_Lote_Pregao_aberto_fechado
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso a tela com filtro todas as Licitações
    E clico na licitação da lista
    E clico na aba 'Itens'
    E acesso a tela de 'Incluir Itens da Solicitação'
    Então incluo a SC Por Lote ao Pregão
    E mostro a auditoria


CT03 - Incluir Documento - Edital

    Configurar Variáveis de Pregão
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso a tela com filtro todas as Licitações
    E clico na licitação da lista
    E acesso a tela de 'Documentos do Processo'
    Então incluo os Documentos do tipo Edital
    E mostro a auditoria


CT04 - Assinar Documento

    Configurar Variáveis de Pregão
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso a tela com filtro todas as Licitações
    E clico na licitação da lista
    E seleciono assino o documento do tipo Edital
    E mostro a auditoria


CT05 - Solicitar Parecer para Ordenador

    Configurar Variáveis de Pregão
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso a tela com filtro todas as Licitações
    E clico na licitação da lista
    E acesso a tela de Solicitar Parecer
    E solicito o parecer para o Ordenador
    Então encaminho o Parecer para o ordenador


CT06 - Aprovar parecer Ordenador

    Configurar Variáveis de Pregão
    Dado que acesso o sistema
    E faço login com usuário "ordenador.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso a tela com filtro todas as Licitações
    E clico na licitação da lista
    E acesso a tela de Solicitar Parecer
    E seleciono o parecer
    Então finalizo o parecer


CT07 - Solicitar Autorização
    Configurar Variáveis de Pregão
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso a tela com filtro todas as Licitações
    E clico na licitação da lista
    E clico no botão solicitar autorização
    Então solicito autorização central


CT08 - Deliberar autorização

    Configurar Variáveis de Pregão
    Dado que acesso o sistema
    E faço login com usuário "autoridadecentral"
    E acesso a tela de Licitações Eletrônicas
    E acesso a tela com filtro todas as Licitações
    E clico na licitação Aguardando autorização da Lista
    E acesso a tela de Deliberar Autorização
    Então aprovo a autorização
    E mostro a auditoria


CT09 - Agendar Pregão eletrônico

    Configurar Variáveis de Pregão
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E seleciono a licitação para agendamento
    E acesso a tela do agendamento
    Então faço o reagendamento


CT10 - Envio de propostas Fornecedor 01

    Configurar Variáveis de Pregão
    Dado que acesso o sistema
    E faço login com usuário "29219904403.256"
    E acesso a tela de Licitações Eletrônicas
    E seleciono todos os pregões
    E seleciono a SC Em propotas da lista
    E seleciono não para lei 123 e confirmo
    E preencho os dados do lance por Lote
    Então envio a proposta
    

CT11 - Envio de propostas Fornecedor 02

    Configurar Variáveis de Pregão
    Dado que acesso o sistema
    E faço login com usuário "02355633000148"
    E acesso a tela de Licitações Eletrônicas
    E seleciono todos os pregões
    E seleciono a licitação da lista
    E seleciono não para lei 123 e confirmo
    E preencho os dados do lance por Lote
    Então envio a proposta


CT12 - Prorrogar Pregão

    Configurar Variáveis de Pregão
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    E clico em prorrogar pregão
    E insiro as novas datas
    Então faço o prorrogamento


CT13 - Abertura das propostas

    Configurar Variáveis de Pregão
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação em abertura de proposta da lista
    Então abro as proposta


CT14 - Iniciar disputa

    Configurar Variáveis de Pregão
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então inicio a disputa


CT15 - Abrir Itens/Lotes para disputa

    Configurar Variáveis de Pregão
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então abros os Lotes


CT16 - Enviar disputa Fornecedor 01

    Configurar Variáveis de Pregão
    Dado que acesso o sistema
    E faço login com usuário "29219904403.256"
    E acesso a tela de Licitações Eletrônicas
    E seleciono todos os pregões
    E seleciono a licitação da lista
    Então envio o lance


CT17 - Enviar disputa Fornecedor 02

    Configurar Variáveis de Pregão
    Dado que acesso o sistema
    E faço login com usuário "02355633000148"
    E acesso a tela de Licitações Eletrônicas
    E seleciono todos os pregões
    E seleciono a licitação da lista
    Então envio o segundo lances


   



    
    
    



    





