*** Settings ***
Documentation    Fluxo feliz - Cadastro de Pregão Eletronico
Library          SeleniumLibrary
Library          Browser
Library          DateTime
Library          OperatingSystem
Resource        ../../Resources/Resource_login.robot
Resource        ../../Resources/Resource_cadastro_pregao.robot

*** Test Cases ***

CT19 - Abrir Item para disputa Sigilosa 5 min
    Configurar variável Conc_aberto_fechado_item

    [Tags]    abrir_item-disputa_sigilosa
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então abro Item para Lei 123


CT18 - Enviar disputa sigilosa Forn01
    Configurar variável Conc_aberto_fechado_item

    [Tags]    enviar_disputa_sigilosa01
    Dado que acesso o sistema
    E faço login com usuário "29219904403.256"
    E acesso a tela de Licitações Eletrônicas
    E seleciono todos os pregões
    E seleciono a licitação da lista
    Então envio o lance 01 para disputa Sigilosa


CT19 - Enviar disputa sigilosa Forn02
    Configurar variável Conc_aberto_fechado_item

    [Tags]    enviar_disputa_sigilosa02
    Dado que acesso o sistema
    E faço login com usuário "29219904403.256"
    E acesso a tela de Licitações Eletrônicas
    E seleciono todos os pregões
    E seleciono a licitação da lista
    Então envio o lance 02 para disputa Sigilosa
   

CT20 - Encerrar Disputa
    Configurar variável Conc_aberto_fechado_item

    [Tags]    encerrar_disputa_sigilosa
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então ecerro a disputa
    

CT21 - Abrir Itens para Lei 123
    Configurar variável Conc_aberto_fechado_item

    [Tags]    abrir_item_lei_123
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então abro Item para Lei 123


CT22 - Encerrar Itens para Lei 123
    Configurar variável Conc_aberto_fechado_item

    [Tags]    encerrar_item_lei_123
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então encerro Item para Lei 123


CT21 - Convocar vencedor
    Configurar variável Conc_aberto_fechado_item

    [Tags]    convocar_vencedor
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então faço a convocação do vencedor


CT22 - Anexar documento - Vencedor
    Configurar variável Conc_aberto_fechado_item

    [Tags]    anexar_documento_vencedor
    Dado que acesso o sistema
    E faço login com usuário "02355633000148"
    E acesso a tela de Licitações Eletrônicas
    E seleciono todos os pregões
    E seleciono a licitação da lista
    Então anexo o documento

CT23 - Habilitar fornecedor vencedor
    Configurar variável Conc_aberto_fechado_item

    [Tags]    habilitar_fornecedor
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então habilito o fonecedor vencedor (Aberto_item)

CT24 - Encerrar etapa
    Configurar variável Conc_aberto_fechado_item

    [Tags]    encerrar_etapa
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então encerro a etapa de pregão eletrônico

CT25 - Registrar intenção de recursos
    Configurar variável Conc_aberto_fechado_item
    
    [Tags]    registrar_recurso
    Dado que acesso o sistema
    E faço login com usuário "29219904403.256"
    E acesso a tela de Licitações Eletrônicas
    E seleciono todos os pregões
    E seleciono a licitação da lista
    Então registro intenção de recurso