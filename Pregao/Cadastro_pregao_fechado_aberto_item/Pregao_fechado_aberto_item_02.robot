*** Settings ***
Documentation    Fluxo feliz - Cadastro de Pregão Eletronico
Library          SeleniumLibrary
Library          Browser
Library          DateTime
Library          OperatingSystem
Resource         ../../Ressource/Resource_Cadastro_SC.robot
Resource         ../../Ressource/Resource_Cadastro_pregão.robot
     

*** Test Cases ***

# Estes cenários só pode ser rodado depois de 15min + Autoencerramento
# Cenário 19 - Abrir Item para disputa Sigilosa 5 min
#     [Tags]    abrir_item-disputa_sigilosa
#     Dado que acesso o sistema
#     E faço login com usuário "pregoeiro.120101"
#     E acesso a tela de Licitações Eletrônicas
#     E acesso todos as licitações da lista
#     E seleciono a licitação da lista
#     Então abro Item para Lei 123


# Cenário 18 - Enviar disputa sigilosa Forn01
#     [Tags]    enviar_disputa_sigilosa01
#     Dado que acesso o sistema
#     E faço login com usuário "29219904403.256"
#     E acesso a tela de Licitações Eletrônicas
#     E seleciono todos os pregões
#     E seleciono a licitação da lista
#     Então envio o lance 01 para disputa Sigilosa


# Cenário 19 - Enviar disputa sigilosa Forn02
#     [Tags]    enviar_disputa_sigilosa02
#     Dado que acesso o sistema
#     E faço login com usuário "29219904403.256"
#     E acesso a tela de Licitações Eletrônicas
#     E seleciono todos os pregões
#     E seleciono a licitação da lista
#     Então envio o lance 02 para disputa Sigilosa
   

Cenário 20 - Encerrar Disputa
    [Tags]    encerrar_disputa
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então ecerro a disputa
    

Cenário 21 - Abrir Itens para Lei 123
    [Tags]    abrir_item_lei_123
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então abro Item para Lei 123


Cenário 22 - Encerrar Itens para Lei 123
    [Tags]    encerrar_item_lei_123
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então encerro Item para Lei 123


Cenário 21 - Convocar vencedor
    [Tags]    convocar_vencedor
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então faço a convocação do vencedor


Cenário 22 - Anexar documento - Vencedor
    [Tags]    anexar_documento_vencedor
    Dado que acesso o sistema
    E faço login com usuário "02355633000148"
    E acesso a tela de Licitações Eletrônicas
    E seleciono todos os pregões
    E seleciono a licitação da lista
    Então anexo o documento

Cenário 23 - Habilitar fornecedor vencedor
    [Tags]    habilitar_fornecedor
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então habilito o fonecedor vencedor

Cenário 24 - Encerrar etapa
    [Tags]    encerrar_etapa
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então encerro a etapa de pregão eletrônico

Cenário 25 - Registrar intenção de recursos
    [Tags]    registrar_recurso
    Dado que acesso o sistema
    E faço login com usuário "29219904403.256"
    E acesso a tela de Licitações Eletrônicas
    E seleciono todos os pregões
    E seleciono a licitação da lista
    Então registro intenção de recurso