*** Settings ***
Documentation    Fluxo feliz - Cadastro de Ata de Registro de Preço
Library          SeleniumLibrary
Library          DateTime
Library          Browser
Resource         ../../Solicitacao_compra/Resource_Cadastro_SC.resource
Resource         ../Ressource_ARP.robot


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
    E clico na Ata de Compra Direta da Lista
    E configuro a Aba Dados Gerais
    Então salvo os dados

Cenário 04 - Inluir Documento
    [Tags]    Incluir_documento
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata de Compra Direta da Lista
    Então incluo o Documento na ARP
    E vejo a Auditoria da ARP


Cenário 05 - Assinar Documento
    [Tags]    assinar_documento
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata de Compra Direta da Lista
    Então assino o documento na ARP
    E vejo a Auditoria da ARP


Cenário 03 - Ativar ARP
    [Tags]    ativar_ata
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de Atas de Registro de preços
    E seleciono a Ata de Compra Direta da Lista
    Então ativo a ARP
