*** Settings ***
Documentation    Fluxo feliz - Cadastro de Ata de Registro de Preço
Library          SeleniumLibrary
Library          DateTime
Library          Browser
Resource         ../../Ressource//Resource_Cadastro_pregão.robot
Resource         ../../Ressource//Resource_compra_direta.robot
Resource         ../../Ressource/Ressource_ARP.robot
     
*** Test Cases ***

Cenário 01 - Gerar ARP da Compra Direta
    [Tags]    gerar_ata
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de todas as Compras Direta
    E seleciono o filtro Compras diretas encerradas
    E clico na Compra Direta da lista
    Então gero a ARP


Cenário 02 - Configurar Ata
    [Tags]    configurar_ata
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata da Lista
    E configuro a Aba Dados Gerais
    E incluo o Documento na ARP
    E assino o documento na ARP
    Então salvo os dados


Cenário 03 - Ativar ARP
    [Tags]    ativar_ata
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de Atas de Registro de preços
    E seleciono a Ata da Lista
    Então ativo a ARP
