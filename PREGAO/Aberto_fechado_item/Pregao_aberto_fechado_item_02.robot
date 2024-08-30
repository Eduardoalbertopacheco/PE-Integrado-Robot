*** Settings ***
Documentation    Fluxo feliz - Cadastro de Pregão Eletronico
Library          SeleniumLibrary
Library          Browser
Library          DateTime
Library          OperatingSystem
Resource        ../../Resources/Resource_login.robot
Resource        ../../Resources/Resource_cadastro_pregao.robot

*** Test Cases ***

# Estes cenários só pode ser rodado depois de 15min + Autoencerramento
Cenário 19 - Abrir Item para disputa Sigilosa 5 min
    Configurar variável aberto_fechado_item

    [Tags]    abrir_item-disputa_sigilosa
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então abro Item para disputa sigilosa


Cenário 18 - Enviar disputa sigilosa Forn01
    Configurar variável aberto_fechado_item

    [Tags]    enviar_disputa_sigilosa01
    Dado que acesso o sistema
    E faço login com usuário "29219904403.256"
    E acesso a tela de Licitações Eletrônicas
    E seleciono todos os pregões
    E seleciono a licitação da lista
    Então envio o lance 01 para disputa Sigilosa


Cenário 19 - Enviar disputa sigilosa Forn02
    Configurar variável aberto_fechado_item

    [Tags]    enviar_disputa_sigilosa02
    Dado que acesso o sistema
    E faço login com usuário "29219904403.256"
    E acesso a tela de Licitações Eletrônicas
    E seleciono todos os pregões
    E seleciono a licitação da lista
    Então envio o lance 02 para disputa Sigilosa
   

Cenário 20 - Encerrar Disputa
    Configurar variável aberto_fechado_item

    [Tags]    encerrar_disputa_sigilosa
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então ecerro a disputa
    

Cenário 21 - Abrir Itens para Lei 123
    Configurar variável aberto_fechado_item

    [Tags]    abrir_item_lei_123
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então abro Item para Lei 123


Cenário 22 - Encerrar Itens para Lei 123
    Configurar variável aberto_fechado_item

    [Tags]    encerrar_item_lei_123
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então encerro Item para Lei 123


Cenário 21 - Convocar vencedor
    Configurar variável aberto_fechado_item

    [Tags]    convocar_vencedor
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então faço a convocação do vencedor


Cenário 22 - Anexar documento - Vencedor
    Configurar variável aberto_fechado_item

    [Tags]    anexar_documento_vencedor
    Dado que acesso o sistema
    E faço login com usuário "29219904403.256"
    E acesso a tela de Licitações Eletrônicas
    E seleciono todos os pregões
    E seleciono a licitação da lista
    Então anexo o documento


Cenário 23 - Habilitar fornecedor vencedor
    Configurar variável aberto_fechado_item

    [Tags]    habilitar_fornecedor
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então habilito o fonecedor vencedor (Aberto_item)


Cenário 24 - Encerrar etapa
    Configurar variável aberto_fechado_item

    [Tags]    encerrar_etapa
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então encerro a etapa de pregão eletrônico

Cenário 25 - Registrar intenção de recursos
    Configurar variável aberto_fechado_item
    
    [Tags]    registrar_recurso
    Dado que acesso o sistema
    E faço login com usuário "29219904403.256"
    E acesso a tela de Licitações Eletrônicas
    E seleciono todos os pregões
    E seleciono a licitação da lista
    Então registro intenção de recurso