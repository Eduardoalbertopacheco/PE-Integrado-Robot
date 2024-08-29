*** Settings ***
Documentation    Fluxo Feliz - Cadastro de Ata de Registro de Preço até a ativação
Library          SeleniumLibrary
Library          DateTime
Library          Browser
Resource       ../../../Resources/Resource_login.robot
Resource        ../../../Resources/Resource_ARP.robot



*** Test Cases ***

Cenário 01 - Gerar ARP do Pregão
    [Tags]    gerar_ata
    Dado que acesso o sistema
    E faço login com usuário "gestorata.070001"
    E acesso a lista de Licitações
    E seleciono o filtro Licitações Homologadas
    E clico no Licitação da lista para gerar ARP
    Então gero a ARP


Cenário 02 - Configurar Ata
    [Tags]    configurar_ata
    Dado que acesso o sistema
    E faço login com usuário "gestorata.070001"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata de Pregão da lista
    E configuro a Aba Dados Gerais
    Então salvo os dados


Cenário 03 - Inluir Documento
    [Tags]    Incluir_documento
    Dado que acesso o sistema
    E faço login com usuário "gestorata.070001"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata de Pregão da lista
    Então incluo o Documento na ARP
    E vejo a Auditoria da ARP


Cenário 04 - Assinar Documento
    [Tags]    assinar_documento
    Dado que acesso o sistema
    E faço login com usuário "gestorata.070001"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata de Pregão da lista
    Então assino o documento na ARP
    E vejo a Auditoria da ARP


Cenário 05 - Ativar ARP
    [Tags]    ativar_ata
    Dado que acesso o sistema
    E faço login com usuário "gestorata.070001"
    E acesso a lista de Atas de Registro de preços
    E seleciono a Ata de Pregão da Lista
    Então ativo a ARP


Cenário 06 - Concluir Análise com Gestor Central de ATA OPD
    [Tags]    Concluir_análise
    Dado que acesso o sistema
    E faço login com usuário "GESTORCENTRALDEATAOPD.070001"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata de Compra Direta da Lista - OPD
    Então concluo a análise da Ata


Cenário 07 - Deliberar ATA OPD
    [Tags]    Deliberar_ata
    Dado que acesso o sistema
    E faço login com usuário "GESTORCENTRALDEATAOPD.070001"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata de Compra Direta da Lista - OPD
    Então Delibero a Ata Externa


Cenário 08 - Configurar Gestão da Ata
    [Tags]    configurar_gestao_ata
    Dado que acesso o sistema
    E faço login com usuário "gestorata.070001"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata de Compra Direta da Lista - OPD
    E clico em Gestão da ata
    Então configuro a gestão da Ata
    E vejo a Auditoria da ARP
