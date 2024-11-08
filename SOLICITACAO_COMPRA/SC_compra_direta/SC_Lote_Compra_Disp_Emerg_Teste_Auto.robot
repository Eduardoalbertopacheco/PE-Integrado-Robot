*** Settings ***
Documentation    Cenário: Criar Um Solicitação de Compras Por Lote e Encaminhar Para Compra Direta - Dispensa Emergencial- Fluxo Feliz
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
    E clico em 'Incluir'
    Então preencho os campos da Aba Dados gerais


CT02 - Incluir Itens na Solicitação de Compras
    Configurar Variáveis de SC

    [Tags]    incluir_itens
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a Tela de Lista de Solicitação de Compras
    E seleciono a SC da lista
    E Clico na aba 'Itens'
    E acesso a tela de incluir Itens
    Então incluo os itens e agrupo por lote


CT03 - Incluir Documento na Solicitação de Compras
    Configurar Variáveis de SC

    [Tags]    incluir_documento
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a Tela de Lista de Solicitação de Compras
    E seleciono a SC da lista
    E Clico na Aba 'Documentos do Processo'
    Então incluo o documento do tipo Termo Referencia


CT04 - Assinar documento
    Configurar Variáveis de SC

    [Tags]    assinar_documento
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a Tela de Lista de Solicitação de Compras
    E seleciono a SC da lista
    E Clico na Aba 'Documentos do Processo'
    Então assino o documento


CT05 - Encaminhar SC para precificação
    Configurar Variáveis de SC

    [Tags]    encaminhar_SC
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a Tela de Lista de Solicitação de Compras
    E seleciono a SC da lista
    Então encaminho a Solicitação de compra para precificação
    

CT06 - Planejamento com Solicitante
    Configurar Variáveis de SC

    [Tags]    planejamento_solicitante
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a Tela de Lista de Solicitação de Compras
    E acesso a Lista de SC em Precificação
    Então faço planejamento da SC para compra Direta - Dispensa Emergencial - Solicitante


CT07 - Definir Natureza de despesa com o Financeiro
    Configurar Variáveis de SC

    [Tags]    definir_natureza
    Dado que acesso o sistema
    E faço login com usuário "financeiro.110402"
    E acesso a Tela de Lista de Solicitação de Compras
    E seleciono a SC da lista
    E Clico na aba 'Itens'
    Então defino a natureza de despesa


CT08 - Aprovação orçamentária
    Configurar Variáveis de SC

    [Tags]    aprovacao_orcamentaria
    Dado que acesso o sistema
    E faço login com usuário "orcamento.110402"
    E acesso 'Minhas Tarefas'
    E seleciono a SC para aprovação
    Então Clique no botão Aprovar com orçamento
    

CT09 - Aprovação com o Ordenador
    Configurar Variáveis de SC

    [Tags]    aprovacao_ordenador
    Dado que acesso o sistema
    E faço login com usuário "ordenador.110402"
    E acesso 'Minhas Tarefas'
    E seleciono a SC para aprovação
    E Clico em Ciente
    Então Clique no botão Aprovar com ordenador


CT10 - Liberar SC com autoridade central
    Configurar Variáveis de SC

    [Tags]    liberacao_autoridade
    Dado que acesso o sistema
    E faço login com usuário "autoridadecentral"
    E acesso a lista de SC centralizada
    E pesquiso por SC 'Aguardando Liberação'
    Então seleciono a SC e aprovo


CT11 - Deliberar SC com autoridade da UG
    Configurar Variáveis de SC

    [Tags]    deliberar_autoridade_ug
    Dado que acesso o sistema
    E faço login com usuário "autoridade.110402"
    E acesso a Tela de Lista de Solicitação de Compras
    E pesquiso por SC 'Aguardando Deliberação'
    E seleciono a SC e clico
    Então faço a deliberação da SC


CT12 - Planejamento com Ordenador
    Configurar Variáveis de SC

    [Tags]    planejar_ordenador
    Dado que acesso o sistema
    E faço login com usuário "ordenador.110402"
    E acesso a lista de Planejamento de Compras
    E seleciono o filtro SC em Planejamento - Ordenador
    E seleciono a SC
    Então faço planejamento da SC para compra Direta - Dispensa Emergencial - Ordenador
 

CT13 - Atribuir Comissão
    Configurar Variáveis de SC

    [Tags]    atribuir_comissao
    Dado que acesso o sistema
    E faço login com usuário "planejador.110402"
    E acesso a tela de Planejamento de compras
    E pesquiso por atribuir comissão com planejador
    E seleciono a SC para atribuir comissão com Planejador
    E clico em Atribuir Comissão
    Então atribuo a comissão de Compra Direta



















