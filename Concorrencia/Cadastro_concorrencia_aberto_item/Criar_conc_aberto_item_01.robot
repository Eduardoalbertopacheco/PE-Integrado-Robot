*** Settings ***
Documentation    Fluxo feliz - Cadastro de Pregão Eletronico
Library          SeleniumLibrary
Library          Browser
Library          DateTime
Library          OperatingSystem
Resource         ../../Solicitacao_compra/Resource_Cadastro_SC.resource
Resource         ../../Pregao/Resource_Cadastro_pregão.resource

*** Variables ***

&{SELECAO}
...    MODALIDADE=//td[@id= "td_cP_PREGAO_x_nCdModalidade"]
...    CRITERIO=//td[@id= "td_cP_PREGAO_x_nCdCriterio"]
...    CODICAO_PAGAMENTO=//td[@id= "td_cP_PREGAO_x_nCdCondicaoPagamento"]
...    PRAZO_ENTREGA=//td[@id= "td_cP_PREGAO_x_nCdPrazoEntrega"]
...    MODO_DISPUTA=//td[@id="td_cP_PREGAO_x_nIdTipoDisputa"]
...    CAMPO_EXIBIR_INCLUIR_ITEM_SC=//select[contains(@name,'ctl00$ddlVisoes')]

&{VALOR_SELECAO}
...    MODAL_PREGAO=//li[contains(.,'Pregão Eletrônico')]
...    MODAL_CONCORRENCIA=//li[contains(.,'Concorrência Eletrônica')]
...    CRIT_PREGAO_LEI_14_133=//li[contains(.,'LICITAÇÃO NA MODALIDADE PREGÃO ELETRÔNICO - LEI FEDERAL 14.133/21 - DECRETO 54.142/22')]
...    CRIT_CONCORRENCIA_LEI_14_133_21=//li[contains(.,'LICITAÇÃO NA MODALIDADE CONCORRÊNCIA ELETRÔNICA - LEI FEDERAL 14.133/21 - DECRETO 54.142/22')]
...    COD_PAGAMENTO_AVISTA=//li[@tabindex='-1'][contains(.,'Á vista')]
...    PRAZO_ENTRG_10_DIAS=//li[@tabindex='-1'][contains(.,'10 DIAS')]
...    MODO_DISPUTA_ABERTO=(//li[@tabindex='-1'][contains(.,'Aberto')])[1]
...    MODO_DISPUTA_ABERTO_FECHADO=//li[@tabindex='-1'][contains(.,'Aberto-fechado')]
...    MODO_DISPUTA_FECHADO_ABERTO=//li[@tabindex='-1'][contains(.,'Fechado-aberto')]
...    EXIBIR_INCLUIR_ITEM_SC_POR_ITEM=//option[contains(@value,'7053')]
...    EXIBIR_INCLUIR_ITEM_SC_POR_LOTE=//option[contains(@value,'7054')]


&{SELECAO_MENU_NEGOCIACAO}    
...    SOLICITACAO_COMPRA=//td[@class='label'][contains(.,'Solicitação de compra')]
...    COTACAO=//td[@class='label'][contains(.,'Cotação')]
...    COMPRA_DIRETA=//td[@class='label'][contains(.,'Compra direta')]
...    LICITACAO=//td[@class='label'][contains(.,'Licitação')]

&{SUBMENU_SOLICITACAO_COMPRA}
...    LISTA_SOLICTACAO_COMPRA=//td[@class='label'][contains(.,'Lista de solicitações de compra')]

&{SUBMENU_COTACAO}
...    LISTA_COTACAO=//a[@title='Cota&#231;&#245;es'][contains(.,'Lista de cotações')]

&{SUBMENU_LICITACAO}
...    NOVA_LICITACAO=//td[@class='label'][contains(.,'Nova licitação eletrönica')]
...    LICITACOES_ELERONICAS=//td[@class='label'][contains(.,'Licitações eletrônicas')]


*** Test Cases ***
Cenário 01 - Criar Concorrência Eletrônica - Aba Dados Gerais
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
    [Tags]    incluir_sc_pregao
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso a tela com filtro todas as Licitações
    E clico na licitação da lista
    Então incluo a SC Por Item ao Pregão
    E mostro a auditoria


Cenário 03 - Incluir Documento - Edital
    [Tags]    Incluir_doc_pregao
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso a tela com filtro todas as Licitações
    E clico na licitação da lista
    E incluo um documento do tipo Edital
    E mostro a auditoria


Cenário 04 - Assinar Documento
    [Tags]    assinar_doc_pregao
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso a tela com filtro todas as Licitações
    E clico na licitação da lista
    E seleciono assino o documento do tipo Edital
    E mostro a auditoria


Cenário 05 - Solicitar Parecer para Ordenador
    [Tags]    solicitar_parecer_pregao
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso a tela com filtro todas as Licitações
    E clico na licitação da lista
    E solicito o parecer para o Ordenador
    Então encaminho o Parecer para o ordenador


Cenário 06 - Aprovar parecer Ordenador
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
    [Tags]    solicitar_autorizacao
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso a tela com filtro todas as Licitações
    E clico na licitação da lista
    E clico no botão solicitar autorização
    Então solicito autorização central


Cenário 08 - Aprovar autorização
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
    [Tags]    agendar_pregao
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E seleciono a licitação para agendamento
    Então faço o reagendamento
 

Cenário 10 - Envio de propostas Fornecedor 01
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
    [Tags]    abrir_propostas
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação em abertura de proposta da lista
    Então abro as proposta


Cenário 14 - Iniciar disputa
    [Tags]    iniciar_disputa
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então inicio a disputa

Cenário 15 - Abrir Itens/Lotes para disputa
    [Tags]    abrir_itens
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então abros os itens


Cenário 16 - Enviar disputa Fornecedor 01
    [Tags]    enviar_disputa01
    Dado que acesso o sistema
    E faço login com usuário "29219904403.256"
    E acesso a tela de Licitações Eletrônicas
    E seleciono todos os pregões
    E seleciono a licitação da lista
    Então envio o lance


Cenário 17 - Enviar disputa Fornecedor 02
    [Tags]    enviar_disputa02
    Dado que acesso o sistema
    E faço login com usuário "02355633000148"
    E acesso a tela de Licitações Eletrônicas
    E seleciono todos os pregões
    E seleciono a licitação da lista
    Então envio o segundo lances


   



    
    
    



    





