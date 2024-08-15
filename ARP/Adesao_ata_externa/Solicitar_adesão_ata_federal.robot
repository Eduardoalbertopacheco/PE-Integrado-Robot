*** Settings ***

Resource        ../Ressource_ARP.robot


*** Variables ***

${VARIABLE_FILE}    variables.txt

*** Keywords ***

E solicito adesão
    Switch Window
    Select Frame    //frame[@name='main']

    Wait Until Element Is Visible    //a[@onclick='SolicitarConsumoAdesao();']    timeout=30s
    Click Element    //a[@onclick='SolicitarConsumoAdesao();']

E seleciono o grupo de compras

    # Seleção do grupo de compras
    Wait Until Element Is Visible    ${LUPA_GRUPO_COMPRA_ATA}
    Click Element    ${LUPA_GRUPO_COMPRA_ATA}

    # Switch Window
    Wait Until Element Is Visible    //span[contains(.,'Selecionar grupo de compras')]   timeout=30s
    Wait Until Element Is Visible    ${INPUT_PESQ_GRUPO_COMPRA}
    Input Text    ${INPUT_PESQ_GRUPO_COMPRA}    CIVIL	
    Wait Until Element Is Visible    //a[contains(.,'Pesquisar')]   timeout=30s
    Click Element    //a[contains(.,'Pesquisar')] 


    Wait Until Element Is Visible    
    ...    //input[contains(@value,'46|Grupo de Compras Padrão - SECRETARIA EXECUTIVA DE DEFESA CIVIL')]    timeout=30s
    Click Element    //input[contains(@value,'46|Grupo de Compras Padrão - SECRETARIA EXECUTIVA DE DEFESA CIVIL')]
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    2


Então confirmo a solicitação de adesão
    Wait Until Element Is Visible    //a[contains(.,'Salvar e fechar')]    timeout=30s
    Click Element    //a[contains(.,'Salvar e fechar')]
    Sleep    3




*** Test Cases ***
Cenário 01 - Solicitar Adesão de Ata Externa Estadual
    [Tags]    solicitar_adesao
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata Externa da Lista
    E solicito adesão
    E seleciono o grupo de compras
    Então confirmo a solicitação de adesão
    E vejo a Auditoria da ARP


Cenário 02 - Selecionar itens da ARP para Adesão
    [Tags]    solicitar_adesao
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata Externa da Lista

Cenário 03 - Incluir Documento

Cenário 04 - Assianr Documento

Cenário 05 - Encaminhar Adesão
