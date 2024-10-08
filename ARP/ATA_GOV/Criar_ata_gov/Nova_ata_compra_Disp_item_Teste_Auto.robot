*** Settings ***
Documentation    Fluxo feliz - Cadastro de Ata de Registro de Preço
Library          SeleniumLibrary
Library          DateTime
Library          Browser
Resource       ../../../Resources/Resource_login.robot
Resource        ../../../Resources/Resource_ARP.robot


*** Test Cases ***

CT01 - Gerar ARP da Compra Direta
    Configurar variável Compra_direta_disp_item

    [Tags]    gerar_ata
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de todas as Compras Direta
    E seleciono o filtro Compras diretas encerradas
    E clico na Compra Direta da lista
    Então gero a ARP


CT02 - Configurar Ata - Dados Gerais
    Configurar variável Compra_direta_disp_item

    [Tags]    configurar_ata
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata de Compra Direta da Lista
    E configuro a Aba Dados Gerais
    Então salvo os dados


CT03 - Inluir Documento
    Configurar variável Compra_direta_disp_item

    [Tags]    Incluir_documento
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata de Compra Direta da Lista
    Então incluo o Documento na ARP
    E vejo a Auditoria da ARP


CT04 - Assinar Documento
    Configurar variável Compra_direta_disp_item

    [Tags]    assinar_documento
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata de Compra Direta da Lista
    Então assino o documento na ARP
    E vejo a Auditoria da ARP


CT05 - Ativar ARP
    Configurar variável Compra_direta_disp_item

    [Tags]    ativar_ata
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de Atas de Registro de preços
    E seleciono a Ata de Compra Direta da Lista
    Então ativo a ARP


CT06 - Configurar Gestão da Ata
    Configurar variável Compra_direta_disp_item

    [Tags]    configurar_gestao_ata
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata de Compra Direta da Lista
    E clico em Gestão da ata
    Então configuro a gestão da Ata
    E vejo a Auditoria da ARP