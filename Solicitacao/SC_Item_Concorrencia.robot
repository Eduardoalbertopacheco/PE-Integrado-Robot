*** Settings ***
Documentation    Fluxo Feliz - Cadastro de Solicitação de Compras
Library          SeleniumLibrary
Library          Browser
Library          OperatingSystem
Resource         Resource_Cadastro_SC.robot

*** Test Cases ***

Cenário 01 - Criar SC - Aba dados Gerais
    [Tags]    criar_sc
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a Tela de Lista de Solicitação de Compras
    E acesso a URL de criar Solicitação de compras
    Então preencho os campos da Aba Dados gerais


Cenário 02 - Incluir Itens na Solicitação de Compras
    [Tags]    incluir_itens
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a Tela de Lista de Solicitação de Compras
    E seleciono a SC da lista
    Então incluo os itens


Cenário 03 - Incluir Documento na Solicitação de Compras
    [Tags]    incluir_documento
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a Tela de Lista de Solicitação de Compras
    E seleciono a SC da lista
    Então incluo o documento do tipo Termo Referencia


Cenário 04 - Assinar documento
    [Tags]    assinar_documento
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a Tela de Lista de Solicitação de Compras
    E seleciono a SC da lista
    Então assino o documento


Cenário 05 - Encaminhar SC para precificação
    [Tags]    encaminhar_SC
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a Tela de Lista de Solicitação de Compras
    E seleciono a SC da lista
    Então encaminho a Solicitação de compra para precificação
    

Cenário 06 - Planejamento com Solicitante
    [Tags]    planejamento_solicitante
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a Tela de Lista de Solicitação de Compras
    E acesso a Lista de SC em Precificação
    Então faço planejamento da SC para Pregão eletronico

Cenário 07 - Definir Natureza de despesa com o Financeiro
    [Tags]    definir_natureza
    Dado que acesso o sistema
    E faço login com usuário "financeiro.110402"
    E acesso a Tela de Lista de Solicitação de Compras
    Então defino a natureza de despesa


Cenário 08 - Aprovação orçamentária
    [Tags]    aprovacao_orcamentaria
    Dado que acesso o sistema
    E faço login com usuário "orcamento.110402"
    E acesso Minhas tarefas
    E seleciono a SC para aprovação
    Então Clique no botão Aprovar com orçamento
    

Cenário 09 - Aprovação com o Ordenador
    [Tags]    aprovacao_ordenador
    Dado que acesso o sistema
    E faço login com usuário "ordenador.110402"
    E acesso Minhas tarefas
    E seleciono a SC para aprovação
    E Clico em Ciente
    Então Clique no botão Aprovar com ordenador


Cenário 10 - Liberar SC com autoridade central
    [Tags]    liberacao_autoridade
    Dado que acesso o sistema
    E faço login com usuário "autoridadecentral"
    E acesso a lista de SC centralizada
    E pesquiso por SC aguardando liberação
    Então seleciono a SC e aprovo


Cenário 11 - Deliberar SC com autoridade da UG
    [Tags]    deliberar_autoridade_ug
    Dado que acesso o sistema
    E faço login com usuário "autoridade.110402"
    E acesso a Tela de Lista de Solicitação de Compras
    E pesquiso por SC aguardando deliberação
    E seleciono a SC e clico
    Então faço a deliberação da SC


Cenário 12 - Planejamento com Ordenador
    [Tags]    planejar_ordenador
    Dado que acesso o sistema
    E faço login com usuário "ordenador.110402"
    E acesso a lista de Planejamento de Compras
    E seleciono o filtro SC em Planejamento - Ordenador
    E seleciono a SC
    Então faço planejamento da SC para Concorrencia - Ordenador

Cenário 13 - Atribuir Comissão
    [Tags]    atribuir_comissao
    Dado que acesso o sistema

    # Fluxo para Pregão e Concorrencia
    E Faço login com usuário "gestorlicitacaocentral.120101"
    E acesso a tela de Solicitação de compras centralizadas
    E pesquiso por SC aguradando atribuir comissão
    E seleciono a SC para atribuir comissão com Gestor Central
    Então atribuo a Comissão Permanente de Licitação


# Fluxo Somente para Pregão Eletronico e Concorrencia
Cenário 14 - Aprovar SC com Pregoeiro Central
    [Tags]    aprovacao_pregoeiro_central
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso Minhas tarefas
    E seleciono a SC para aprovação
    Então Clique no botão Aprovar com orçamento




















