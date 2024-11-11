*** Settings ***
Documentation    Fluxo Feliz - Cadastro de Compra Direta
Library          SeleniumLibrary
Library          Browser
Resource        ../../Resources/Resource_login.robot
Resource        ../../Resources/Resource_compra_direta.robot

*** Test Cases ***

CT01 - Cadastro de Compra Direta - Aba dados Gerais
    Configurar Variáveis Compra Direta

    [Tags]    criar_Compra
    Dado que acesso o sistema
    E faço login com usuário "mi.comprador.110402"
    E acesso a lista de todas as Compras Direta
    E seleciono o filtro Todas as compras diretas
    E clico em Incluir Processo de Compra Direta
    E incluo as datas do agendamento
    E seleciono o modalidade para Dispensa
    E seleciono Critério para LEI 14.133/2021, ART. 75, VIII - DISPENSA
    Então preencho todos os campos da Aba Dados gerais


CT02 - Incluir Itens da SC na Compra Direta
    Configurar Variáveis Compra Direta
    Usar SC_Item_Compra_Disp

    [Tags]    incluir_item_cp
    Dado que acesso o sistema
    E faço login com usuário "mi.comprador.110402"
    E acesso a lista de todas as Compras Direta
    E seleciono o filtro Todas as compras diretas
    E clico na Compra Direta da lista
    Então incluo a SC Item na compra Direta

CT03 - Agendar compra Direta
    Configurar Variáveis Compra Direta

    [Tags]    agendar_CP
    Dado que acesso o sistema
    E faço login com usuário "mi.comprador.110402"
    E acesso a lista de todas as Compras Direta
    E seleciono o filtro Todas as compras diretas
    E seleciono a Compra Direta da lista
    Então faço o agendamento da compra Direta
    E configuro o agendamento


CT04 - Enviar lances com Fornecedor 01
    Configurar Variáveis Compra Direta

    [Tags]    enviar_lance_01
    Dado que acesso o sistema
    E faço login com usuário "29219904403.256"
    E acesso a lista de todas as Compras Direta
    E seleciono o filtro Compra diretas em andamento
    E clico na compra direta em recebimento de lances
    E preencho os dados do lance na Compra Direta por Item
    Então envio o lance na compra direta


CT05 - Enviar lances com Fornecedor 02
    Configurar Variáveis Compra Direta

    [Tags]    enviar_lance_02
    Dado que acesso o sistema
    E faço login com usuário "02355633000148"
    E acesso a lista de todas as Compras Direta
    E seleciono o filtro Compra diretas em andamento
    E clico na compra direta em recebimento de lances
    E preencho os dados do segundo lance na Compra Direta por item
    Então envio o lance na compra direta


CT06 - Prorrogar Compra direta
    Configurar Variáveis Compra Direta

    [Tags]    prorrogar_compra_direta
    Dado que acesso o sistema
    E faço login com usuário "mi.comprador.110402"
    E acesso a lista de todas as Compras Direta
    E seleciono o filtro Todas as compras diretas
    E clico na Compra Direta da lista
    E clico em prorrogar pregão na compra Direta
    E insiro as novas datas para prorrogar Compra Direta
    Então faço o prorrogamento da compra direta


CT07 - Encerrar Itens
    Configurar Variáveis Compra Direta
   
    Dado que acesso o sistema
    E faço login com usuário "mi.comprador.110402"
    E acesso a lista de todas as Compras Direta
    E seleciono o filtro Todas as compras diretas
    E clico na Compra Direta da lista
    Então encerro os Itens/Lotes


CT07 - Finalizar Compra Direta
    Configurar Variáveis Compra Direta

  [Tags]    finalizar_compra_direta
    Dado que acesso o sistema
    E faço login com usuário "mi.comprador.110402"
    E acesso a lista de todas as Compras Direta
    E seleciono o filtro Todas as compras diretas
    E clico na Compra Direta da lista
    Então finalizo a Compra Direta


CT08 - Ratificar compra Direta
    Configurar Variáveis Compra Direta

  [Tags]    ratificar_compra_direta
    Dado que acesso o sistema
    E faço login com usuário "autoridade.110402"
    E acesso a lista de todas as Compras Direta
    E seleciono o filtro Todas as compras diretas
    E clico na Compra Direta da lista Aguardando ratificação
    Então ratifico a Compra Direta