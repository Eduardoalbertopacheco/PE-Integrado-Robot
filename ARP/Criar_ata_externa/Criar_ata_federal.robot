*** Settings ***
Documentation    Fluxo feliz - Cadastro de Ata de Registro de Preço
Library          SeleniumLibrary
Library          DateTime
Library          Browser
Resource         ../../Solicitacao_compra/Resource_Cadastro_SC.resource
Resource         ../Ressource_ARP.robot


*** Test Cases ***

Cenário 01 - Criar Ata Externa Federal
    [Tags]    criar_ata_federal
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de Atas de Registro de preços
    E clico em Incluir Ata
    E seleciono Esfera administrativa como Federal
    E seleciono o Estado de origem
    E seleciono o Orgão Gestor ATA
    E preencho todos os Dados Gerais
    E configuro as datas de vigencia
    Então salvo a ARP
    E vejo a Auditoria da ARP


Cenário 02 - Incluir Documento e assinar documento
    [Tags]    incluir_documento
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata Externa da Lista
    Então incluo e assino o documento na Ata
    E vejo a Auditoria da ARP


# Cenário 03 - Assinar Documento
#     [Tags]    assinar_documento
#     Dado que acesso o sistema
#     E faço login com usuário "edu.gestorata.110402"
#     E acesso a lista de Atas de Registro de preços
#     E clico na Ata Externa da Lista
#     Então assino o documento da Ata
#     E vejo a Auditoria da ARP


Cenário 04 - Ativar ATA Externa
    [Tags]    ativar_ata
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de Atas de Registro de preços
    E seleciono a Ata Externa da Lista
    Então ativo a ARP
    # E vejo a Auditoria da ARP

Cenário 05 - Concluir Análise com Gestor Ata Central
    [Tags]    concluir_ata
    Dado que acesso o sistema
    E faço login com usuário "Gestoratacentral2.120101"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata Externa da Lista
    Então concluo a análise da Ata


Cenário 06 - Deliberar Ata
    [Tags]    deliberar_ata
    Dado que acesso o sistema
    E faço login com usuário "Gestoratacentral2.120101"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata Externa da Lista
    Então Delibero a Ata Externa
    E vejo a Auditoria da ARP


Cenário 07 - Incluir Itens com Gestor Central de ATA
    [Tags]    incluir_item_ata
    Dado que acesso o sistema
    E faço login com usuário "Gestoratacentral2.120101"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata Externa da Lista
    Então incluo os itens na ATA Externa
    E vejo a Auditoria da ARP