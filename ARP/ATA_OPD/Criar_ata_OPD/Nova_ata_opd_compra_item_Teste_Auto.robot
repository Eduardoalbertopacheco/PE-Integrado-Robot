*** Settings ***
Documentation    Fluxo feliz - Cadastro de Ata de Registro de Preço
Library          SeleniumLibrary
Library          DateTime
Library          Browser
Resource       ../../../Resources/Resource_login.robot
Resource        ../../../Resources/Resource_ARP.robot

*** Test Cases ***

CT01 - Gerar ARP OPD da Compra Direta
    [Tags]    gerar_ata
    Dado que acesso o sistema
    E faço login com usuário "gestorata.070001"
    E acesso a lista de todas as Compras Direta
    E seleciono o filtro Compras diretas encerradas
    E clico na Compra Direta da lista
    Então gero a ARP


CT02 - Configurar Ata - Dados Gerais
    [Tags]    configurar_ata
    Dado que acesso o sistema
    E faço login com usuário "gestorata.070001"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata de Compra Direta da Lista - OPD
    E configuro a Aba Dados Gerais
    Então salvo os dados


CT03 - Inluir Documento
    [Tags]    Incluir_documento
    Dado que acesso o sistema
    E faço login com usuário "gestorata.070001"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata de Compra Direta da Lista - OPD
    Então incluo o Documento na ARP
    E vejo a Auditoria da ARP


CT04 - Assinar Documento
    [Tags]    assinar_documento
    Dado que acesso o sistema
    E faço login com usuário "gestorata.070001"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata de Compra Direta da Lista - OPD
    Então assino o documento na ARP
    E vejo a Auditoria da ARP


CT05 - Ativar ARP
    [Tags]    ativar_ata
    Dado que acesso o sistema
    E faço login com usuário "gestorata.070001"
    E acesso a lista de Atas de Registro de preços
    E seleciono a Ata de Compra Direta da Lista - OPD
    Então ativo a ARP


CT06 - Concluir Análise com Gestor Central de ATA OPD
    [Tags]    Concluir_análise
    Dado que acesso o sistema
    E faço login com usuário "GESTORCENTRALDEATAOPD.070001"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata de Compra Direta da Lista - OPD
    Então concluo a análise da Ata

CT07 - Deliberar ATA OPD
    [Tags]    Deliberar_ata
    Dado que acesso o sistema
    E faço login com usuário "GESTORCENTRALDEATAOPD.070001"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata de Compra Direta da Lista - OPD
    Então Delibero a Ata Externa


CT08 - Configurar Gestão da Ata
    [Tags]    configurar_gestao_ata
    Dado que acesso o sistema
    E faço login com usuário "gestorata.070001"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata de Compra Direta da Lista - OPD
    E clico em Gestão da ata
    Então configuro a gestão da Ata
    E vejo a Auditoria da ARP