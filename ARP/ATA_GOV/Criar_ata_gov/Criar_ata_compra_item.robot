*** Settings ***
Documentation    Fluxo feliz - Cadastro de Ata de Registro de Preço
Library          SeleniumLibrary
Library          DateTime
Library          Browser
Resource         ../../Ressource_ARP.robot

*** Test Cases ***

Cenário 01 - Gerar ARP da Compra Direta
    [Tags]    gerar_ata
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de todas as Compras Direta
    E seleciono o filtro Compras diretas encerradas
    E clico na Compra Direta da lista
    Então gero a ARP


Cenário 02 - Configurar Ata - Dados Gerais
    [Tags]    configurar_ata
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata de Compra Direta da Lista
    E configuro a Aba Dados Gerais
    Então salvo os dados


Cenário 03 - Inluir Documento
    [Tags]    Incluir_documento
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata de Compra Direta da Lista
    Então incluo o Documento na ARP
    E vejo a Auditoria da ARP


Cenário 04 - Assinar Documento
    [Tags]    assinar_documento
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata de Compra Direta da Lista
    Então assino o documento na ARP
    E vejo a Auditoria da ARP


Cenário 05 - Ativar ARP
    [Tags]    ativar_ata
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de Atas de Registro de preços
    E seleciono a Ata de Compra Direta da Lista
    Então ativo a ARP


Cenário 06 - Configurar Gestão da Ata
    [Tags]    configurar_gestao_ata
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata de Compra Direta da Lista
    E clico em Gestão da ata
    Então configuro a gestão da Ata
    E vejo a Auditoria da ARP