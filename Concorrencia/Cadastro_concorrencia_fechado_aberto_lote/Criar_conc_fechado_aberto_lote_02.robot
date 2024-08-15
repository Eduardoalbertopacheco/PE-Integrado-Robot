*** Settings ***
Documentation    Fluxo feliz - Cadastro de Pregão Eletronico
Library          SeleniumLibrary
Library          Browser
Library          DateTime
Library          OperatingSystem
Resource         ../../Solicitacao_compra/Resource_Cadastro_SC.resource
Resource         ../../Pregao/Resource_Cadastro_pregão.resource
     

*** Test Cases ***

# Estes cenários só pode ser rodado depois de 15min + autoencerramento
# Cenário 19 - Abrir Lote para disputa Sigilosa 5 min
#     [Tags]    abrir_item-disputa_sigilosa
#     Dado que acesso o sistema
#     E faço login com usuário "pregoeiro.120101"
#     E acesso a tela de Licitações Eletrônicas
#     E acesso todos as licitações da lista
#     E seleciono a licitação da lista
#     Então abros os Lotes


# Cenário 20 - Enviar disputa sigilosa Forn01
#     [Tags]    enviar_disputa_sigilosa01
#     Dado que acesso o sistema
#     E faço login com usuário "29219904403.256"
#     E acesso a tela de Licitações Eletrônicas
#     E seleciono todos os pregões
#     E seleciono a licitação da lista
#     Então envio o lance 01 para disputa Sigilosa


# Cenário 21 - Enviar disputa sigilosa Forn02
#     [Tags]    enviar_disputa_sigilosa02
#     Dado que acesso o sistema
#     E faço login com usuário "29219904403.256"
#     E acesso a tela de Licitações Eletrônicas
#     E seleciono todos os pregões
#     E seleciono a licitação da lista
#     Então envio o lance 02 para disputa Sigilosa


Cenário 23 - Encerrar disputa
    [Tags]    encerrar_disputa
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então ecerro a disputa Por Lote
    

Cenário 24 - Abrir Item/Lote para Lei 123
    [Tags]    abrir_lei_123
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então abros os Lotes

Cenário 25 - Encerrar Item/Lote para Lei 123
    [Tags]    encerrar_lei_123
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então encerro Lote para Lei 123

Cenário 26 - Convocar vencedor
    [Tags]    convocar_vencedor
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então faço a convocação do vencedor


Cenário 27 - Anexar documento - Vencedor
    [Tags]    anexar_documento_vencedor
    Dado que acesso o sistema
    E faço login com usuário "02355633000148"
    E acesso a tela de Licitações Eletrônicas
    E seleciono todos os pregões
    E seleciono a licitação da lista
    Então anexo o documento

Cenário 28 - Habilitar fornecedor vencedor
    [Tags]    habilitar_fornecedor
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então habilito o fonecedor vencedor

Cenário 29 - Encerrar etapa
    [Tags]    encerrar_etapa
    Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso todos as licitações da lista
    E seleciono a licitação da lista
    Então encerro a etapa de pregão eletrônico

Cenário 30 - Registrar intenção de recursos
    [Tags]    registrar_recurso
    Dado que acesso o sistema
    E faço login com usuário "29219904403.256"
    E acesso a tela de Licitações Eletrônicas
    E seleciono todos os pregões
    E seleciono a licitação da lista
    Então registro intenção de recurso