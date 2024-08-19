*** Settings ***
Documentation    Fluxo Feliz - Cadastro de Ata de Registro de Preço até a ativação
Library          SeleniumLibrary
Library          DateTime
Library          Browser
Resource         ../../Solicitacao_compra/Resource_Cadastro_SC.resource
Resource         ../Ressource_ARP.robot

       

*** Test Cases ***

Cenário 01 - Gerar ARP do Pregão
    [Tags]    gerar_ata
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de Licitações
    E seleciono o filtro Licitações Homologadas
    E clico no Licitação da lista para gerar ARP
    Então gero a ARP


Cenário 02 - Configurar Ata
    [Tags]    configurar_ata
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata de Pregão da lista
    E configuro a Aba Dados Gerais
    Então salvo os dados



Cenário 03 - Inluir Documento
    [Tags]    Incluir_documento
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata de Pregão da lista
    Então incluo o Documento na ARP
    E vejo a Auditoria da ARP


Cenário 04 - Assinar Documento
    [Tags]    assinar_documento
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata de Pregão da lista
    Então assino o documento na ARP
    E vejo a Auditoria da ARP


Cenário 05 - Ativar ARP
    [Tags]    ativar_ata
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de Atas de Registro de preços
    E seleciono a Ata de Pregão da Lista
    Então ativo a ARP
