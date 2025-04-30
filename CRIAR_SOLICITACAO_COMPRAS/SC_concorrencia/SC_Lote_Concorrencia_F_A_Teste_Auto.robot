*** Settings ***
Documentation    Fluxo Feliz - Cadastro de Solicitação de Compras
Library          SeleniumLibrary
Library          Browser
Library          OperatingSystem
Resource        ../../Resources/Resource_login.robot
Resource        ../../Resources/Resource_Cadastro_SC.robot

*** Test Cases ***

CT01 - Criar SC - Aba dados Gerais

    Configurar Variáveis de SC
    Dado que acesso o sistema
    E faço login com usuário "solicitante.120101"
    E acesso a Tela de Lista de Solicitação de Compras
    E clico em 'Incluir'
    Então preencho os campos da Aba Dados gerais - Concorrencia


# CT02 - Incluir Itens na Solicitação de Compras

#     Configurar Variáveis de SC
#     Dado que acesso o sistema
#     E faço login com usuário "solicitante.120101"
#     E acesso a Tela de Lista de Solicitação de Compras
#     E seleciono a SC da lista
#     E Clico na aba 'Itens'
#     E acesso a tela de incluir Itens
#     Então incluo os itens e agrupo por lote

CT02 - Agrupar Itens por Lote

    Configurar Variáveis de SC
    Dado que acesso o sistema
    E faço login com usuário "solicitante.120101"
    E acesso a Tela de Lista de Solicitação de Compras
    E seleciono a SC da lista
    E Clico na aba 'Itens'
    Então agrupo os item por Lote


CT03 - Incluir Documento na Solicitação de Compras

    Configurar Variáveis de SC
    Dado que acesso o sistema
    E faço login com usuário "solicitante.120101"
    E acesso a Tela de Lista de Solicitação de Compras
    E seleciono a SC da lista
    E Clico na Aba 'Documentos do Processo'
    Então incluo o documento do tipo Termo Referencia


CT04 - Assinar documento

    Configurar Variáveis de SC
    Dado que acesso o sistema
    E faço login com usuário "solicitante.120101"
    E acesso a Tela de Lista de Solicitação de Compras
    E seleciono a SC da lista
    E Clico na Aba 'Documentos do Processo'
    Então assino o documento


CT05 - Encaminhar SC para precificação

    Configurar Variáveis de SC
    Dado que acesso o sistema
    E faço login com usuário "solicitante.120101"
    E acesso a Tela de Lista de Solicitação de Compras
    E seleciono a SC da lista
    Então encaminho a Solicitação de compra para precificação
    

CT06 - Planejamento com Solicitante

    Configurar Variáveis de SC
    Dado que acesso o sistema
    E faço login com usuário "solicitante.120101"
    E acesso a Tela de Lista de Solicitação de Compras
    E acesso a Lista de SC em Precificação
    Então faço planejamento da SC para Concorrencia - Solicitante
   

CT07 - Definir Natureza de despesa com o Financeiro

    Configurar Variáveis de SC
    Dado que acesso o sistema
    E faço login com usuário "financeiro.120101"
    E acesso a Tela de Lista de Solicitação de Compras
    E seleciono a SC da lista
    E Clico na aba 'Itens'
    Então defino a natureza de despesa


CT08 - Aprovação orçamentária

    Configurar Variáveis de SC
    Dado que acesso o sistema
    E faço login com usuário "orcamento.120101"
    E acesso 'Minhas Tarefas'
    E seleciono a SC para aprovação
    Então Clique no botão Aprovar com orçamento
    

CT09 - Aprovação com o Ordenador

    Configurar Variáveis de SC
    Dado que acesso o sistema
    E faço login com usuário "ordenador.120101"
    E acesso 'Minhas Tarefas'
    E seleciono a SC para aprovação
    E Clico em Ciente
    Então Clique no botão Aprovar com ordenador


CT10 - Liberar SC com autoridade central

    Configurar Variáveis de SC
    Dado que acesso o sistema
    E faço login com usuário "autoridadecentral"
    E acesso a lista de SC centralizada
    E pesquiso por SC 'Aguardando Liberação'
    Então seleciono a SC e aprovo


CT11 - Deliberar SC com autoridade da UG

    Configurar Variáveis de SC
    Dado que acesso o sistema
    E faço login com usuário "autoridade.120101"
    E acesso a Tela de Lista de Solicitação de Compras
    E pesquiso por SC 'Aguardando Deliberação'
    E seleciono a SC e clico
    Então faço a deliberação da SC


CT12 - Planejamento com Ordenador

    Configurar Variáveis de SC
    Dado que acesso o sistema
    E faço login com usuário "ordenador.120101"
    E acesso a lista de Planejamento de Compras
    E seleciono o filtro SC em Planejamento - Ordenador
    E seleciono a SC
    Então faço planejamento da SC para Concorrencia - Ordenador


CT13 - Atribuir Comissão

    Configurar Variáveis de SC
    Dado que acesso o sistema
    E Faço login com usuário "gestorlicitacaocentral.120101"
    E acesso a tela de Solicitação de compras centralizadas
    E pesquiso por SC aguradando atribuir comissão
    E seleciono a SC para atribuir comissão com Gestor Central
    Então atribuo a Comissão Permanente de Licitação


CT14 - Aprovar SC com Pregoeiro Central

    Configurar Variáveis de SC
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso 'Minhas Tarefas'
    E seleciono a SC para aprovação
    Então Clique no botão Aprovar com orçamento

















