*** Settings ***

Library          SeleniumLibrary
Resource        ../Ressource_ARP.robot


*** Keywords ***


*** Test Cases ***
Cenário 01 - Solicitar Adesão de Ata Externa Estadual
    [Tags]    solicitar_adesao
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata Externa da Lista
    E solicito adesão
    E seleciono o grupo de compras
    E confirmo a solicitação de adesão
    E seleciono itens da ARP para Adesão
    # E vejo a Auditoria da ARP


Cenário 03 - Incluir e assinar documento


Cenário 04 - Encaminhar Adesão
