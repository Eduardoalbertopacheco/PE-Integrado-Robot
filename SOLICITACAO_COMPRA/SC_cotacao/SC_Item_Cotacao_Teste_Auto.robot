*** Settings ***
Documentation    Cenário: Criar Um Solicitação de Compras Por Item e Encaminhar Para Cotação - Fluxo Feliz
Library          SeleniumLibrary
Library          Browser
Resource        ../../Resources/Resource_login.robot
Resource        ../../Resources/Resource_Cadastro_SC.robot

*** Test Cases ***

CT01 - Criar SC - Aba dados Gerais
    Configurar Variáveis de SC

    [Tags]    criar_sc
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a Tela de Lista de Solicitação de Compras
    Então preencho os campos da Aba Dados gerais da SC


CT02 - Incluir Itens na Solicitação de Compras
    Configurar Variáveis de SC

    [Tags]    incluir_itens
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a Tela de Lista de Solicitação de Compras
    E seleciono a SC da lista
    Então incluo os itens


CT03 - Incluir Documento na Solicitação de Compras
    Configurar Variáveis de SC

    [Tags]    incluir_documento
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a Tela de Lista de Solicitação de Compras
    E seleciono a SC da lista
    Então incluo o documento do tipo Termo Referencia


CT04 - Assinar documento
    Configurar Variáveis de SC

    [Tags]    assinar_documento
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a Tela de Lista de Solicitação de Compras
    E seleciono a SC da lista
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
    Então faço o planejamento da SC para Cotação
    