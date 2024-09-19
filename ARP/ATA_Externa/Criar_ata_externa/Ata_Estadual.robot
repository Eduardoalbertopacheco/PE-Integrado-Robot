*** Settings ***
Documentation    Fluxo feliz - Cadastro de Ata de Registro de Preço
Library          SeleniumLibrary
Library          DateTime
Library          Browser
Resource        ../../../Resources/Resource_login.robot
Resource        ../../../Resources/Resource_ARP.robot


*** Test Cases ***

CT01 - Criar Ata Externa Estadual
    Configurar Variáveis de ARP

    [Tags]    criar_ata_municipal
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de Atas de Registro de preços
    E clico em Incluir Ata
    E seleciono Esfera administrativa como Estadual
    E seleciono o Estado de origem
    E seleciono o Orgão Gestor ATA
    E preencho todos os Dados Gerais
    E configuro as datas de vigencia
    Então salvo a ARP
    E vejo a Auditoria da ARP


CT02 - Incluir e assinar o documento
    Configurar Variáveis de ARP

    [Tags]    incluir_documento
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata Externa da Lista
    Então incluo e assino o documento na Ata
    E vejo a Auditoria da ARP


CT03 - Ativar ATA Externa
    Configurar Variáveis de ARP

    [Tags]    ativar_ata
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de Atas de Registro de preços
    E seleciono a Ata Externa da Lista
    Então ativo a ARP
    # E vejo a Auditoria da ARP

CT04 - Concluir Análise com Gestor Ata Central
    Configurar Variáveis de ARP

    [Tags]    concluir_ata
    Dado que acesso o sistema
    E faço login com usuário "Gestoratacentral2.120101"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata Externa da Lista
    Então concluo a análise da Ata


CT05 - Deliberar Ata
    Configurar Variáveis de ARP

    [Tags]    deliberar_ata
    Dado que acesso o sistema
    E faço login com usuário "Gestoratacentral2.120101"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata Externa da Lista
    Então Delibero a Ata Externa
    E vejo a Auditoria da ARP


CT06 - Incluir Itens com Gestor Central de ATA
    Configurar Variáveis de ARP
    
    [Tags]    incluir_item_ata
    Dado que acesso o sistema
    E faço login com usuário "Gestoratacentral2.120101"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata Externa da Lista
    Então incluo os itens na ATA Externa
    E vejo a Auditoria da ARP