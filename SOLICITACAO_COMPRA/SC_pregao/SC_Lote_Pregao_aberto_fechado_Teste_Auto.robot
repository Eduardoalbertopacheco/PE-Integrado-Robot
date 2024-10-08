*** Settings ***
Documentation    Cenário: Criar Um Solicitação de Compras Por Lote e Encaminhar Para Pregão Eletrônico - Fluxo Feliz
Library          SeleniumLibrary
Library          Browser
Library          OperatingSystem
Resource        ../../Resources/Resource_login.robot
Resource        ../../Resources/Resource_Cadastro_SC.robot

*** Test Cases ***

CT01 - Criar SC - Aba dados Gerais
    Configurar Variáveis de SC
    
    [Tags]    criar_sc
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a Tela de Lista de Solicitação de Compras
    Então preencho os campos da Aba Dados gerais


CT02 - Incluir Itens na Solicitação de Compras
    [Tags]    incluir_itens
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a Tela de Lista de Solicitação de Compras
    E seleciono a SC da lista
    Então incluo os itens e agrupo por lote


CT03 - Incluir Documento na Solicitação de Compras
    [Tags]    incluir_documento
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a Tela de Lista de Solicitação de Compras
    E seleciono a SC da lista
    Então incluo o documento do tipo Termo Referencia


CT04 - Assinar documento
    [Tags]    assinar_documento
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a Tela de Lista de Solicitação de Compras
    E seleciono a SC da lista
    Então assino o documento


CT05 - Encaminhar SC para precificação
    [Tags]    encaminhar_SC
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a Tela de Lista de Solicitação de Compras
    E seleciono a SC da lista
    Então encaminho a Solicitação de compra para precificação
    

CT06 - Planejamento com Solicitante
    [Tags]    planejamento_solicitante
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a Tela de Lista de Solicitação de Compras
    E acesso a Lista de SC em Precificação
    Então faço planejamento da SC para Pregão eletronico
   

CT07 - Definir Natureza de despesa com o Financeiro
    [Tags]    definir_natureza
    Dado que acesso o sistema
    E faço login com usuário "financeiro.110402"
    E acesso a Tela de Lista de Solicitação de Compras
    Então defino a natureza de despesa


CT08 - Aprovação orçamentária
    [Tags]    aprovacao_orcamentaria
    Dado que acesso o sistema
    E faço login com usuário "orcamento.110402"
    E acesso Minhas tarefas
    E seleciono a SC para aprovação
    Então Clique no botão Aprovar com orçamento
    

CT09 - Aprovação com o Ordenador
    [Tags]    aprovacao_ordenador
    Dado que acesso o sistema
    E faço login com usuário "ordenador.110402"
    E acesso Minhas tarefas
    E seleciono a SC para aprovação
    E Clico em Ciente
    Então Clique no botão Aprovar com ordenador


CT10 - Liberar SC com autoridade central
    [Tags]    liberacao_autoridade
    Dado que acesso o sistema
    E faço login com usuário "autoridadecentral"
    E acesso a lista de SC centralizada
    E pesquiso por SC aguardando liberação
    Então seleciono a SC e aprovo


CT11 - Deliberar SC com autoridade da UG
    [Tags]    deliberar_autoridade_ug
    Dado que acesso o sistema
    E faço login com usuário "autoridade.110402"
    E acesso a Tela de Lista de Solicitação de Compras
    E pesquiso por SC aguardando deliberação
    E seleciono a SC e clico
    Então faço a deliberação da SC


CT12 - Planejamento com Ordenador
    Usar SC_Lote_Pregao_aberto_fechado

    [Tags]    planejar_ordenador
    Dado que acesso o sistema
    E faço login com usuário "ordenador.110402"
    E acesso a lista de Planejamento de Compras
    E seleciono o filtro SC em Planejamento - Ordenador
    E seleciono a SC
    Então faço o planejamento para Pregão Eletrônico


CT13 - Atribuir Comissão
    Usar SC_Lote_Pregao_aberto_fechado

    [Tags]    atribuir_comissao
    Dado que acesso o sistema
    E Faço login com usuário "gestorlicitacaocentral.120101"
    E acesso a tela de Solicitação de compras centralizadas
    E pesquiso por SC aguradando atribuir comissão
    E seleciono a SC para atribuir comissão com Gestor Central
    Então atribuo a Comissão Permanente de Licitação



CT14 - Aprovar SC com Pregoeiro Central
    Usar SC_Lote_Pregao_aberto_fechado

    [Tags]    aprovacao_pregoeiro_central
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso Minhas tarefas
    E seleciono a SC para aprovação
    Então Clique no botão Aprovar com orçamento




















