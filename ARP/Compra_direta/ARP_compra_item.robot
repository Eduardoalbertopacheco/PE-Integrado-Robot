*** Settings ***
Documentation    Fluxo feliz - Cadastro de Ata de Registro de Preço
Library          SeleniumLibrary
Library          DateTime
Library          Browser
Resource         ../../Ressource//Resource_Cadastro_pregão.robot
Resource         ../../Ressource//Resource_compra_direta.robot
     
*** Variables ***

*** Keywords ***

Então gero a ARP
    Select Frame    //frame[contains(@name,'frmNegociacao')]
    Wait Until Element Is Visible    //a[@onclick='GerarARP();']    timeout=30s
    Click Element    //a[@onclick='GerarARP();']

    # Selecionar todos o itens
    Wait Until Element Is Visible    //input[contains(@title,'Selecionar todos')]    timeout=30s
    Click Element    //input[contains(@title,'Selecionar todos')]
    Capture Page Screenshot
    
    # Confirmar
    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    timeout=30s
    Click Element    //a[contains(.,'Confirmar')]

    
    Wait Until Element Is Visible    //a[contains(.,'Sim')]    timeout=30s
    Capture Page Screenshot
    Click Element    //a[contains(.,'Sim')]
    Sleep    4

    Click Element    //a[contains(.,'Fechar')]


E acesso a lista de Atas de Registro de preços
    Select Frame    //frame[@name='main']

    # Clique em ata de registro de preços
    Wait Until Element Is Visible    xpath=//div[@unselectable='on'][contains(.,'Ata de Registro de Preços')]    timeout=30s
    Click Element    xpath=//div[@unselectable='on'][contains(.,'Ata de Registro de Preços')]

    # mouse over em lista de Atas
    ${elemento}    Get WebElement    
    ...    xpath=//td[@class='label'][contains(.,'Lista de Atas de Registro de Preços')]
    Mouse Over    ${elemento}


    # Clique em todas as Atas
    Wait Until Element Is Visible    
    ...    xpath=//td[@class='label'][contains(.,'Todas as Atas de Registro de Preços')]    timeout=30s
    Click Element    
    ...    xpath=//td[@class='label'][contains(.,'Todas as Atas de Registro de Preços')]
    Sleep    2
    Capture Page Screenshot


E clico na Ata da Lista


    Select Frame    //iframe[@name='frmConteudo']
    Wait Until Element Is Visible    //table[@id = "dtgPesquisa"]//tbody//tr[td/a[text()='${OBJETO_CP}']]//a    timeout=30s
    Click Element    //table[@id = "dtgPesquisa"]//tbody//tr[td/a[text()='${OBJETO_CP}']]//a
    Sleep    2
    Capture Page Screenshot


E configuro a Aba Dados Gerais
    ${all_windows}=    Get Window Handles
    ${second_window}=    Set Variable    ${all_windows}[0]
    Switch Window    ${all_windows}[0]

    Select Frame    //frame[@name='main']

    ${DATA_ATUAL}=    Evaluate    datetime.datetime.now().strftime('%d-%m-%Y')   datetime
    Log    ${DATA_ATUAL}

    ${ULTIMO_DIA_ANO}=    Evaluate    datetime.datetime(datetime.datetime.now().year, 12, 31).strftime('%d-%m-%Y')    datetime
    Log    ${ULTIMO_DIA_ANO}

    # Data inicio vigencia
    Wait Until Element Is Visible    //input[contains(@name,'tDtInicio')]    
    Input Text    //input[contains(@name,'tDtInicio')]    ${DATA_ATUAL}
    
    # Dara encerramento
    Wait Until Element Is Visible    //input[contains(@name,'tDtEncerramento')]
    Input Text    //input[contains(@name,'tDtEncerramento')]    ${ULTIMO_DIA_ANO}

    # Nr dias para aviso de encerramento
    Wait Until Element Is Visible    //fieldset[2]/table[1]/tbody[1]/tr[1]/td[3]/span[1]/span[1]/input[1]
    Input Text    //fieldset[2]/table[1]/tbody[1]/tr[1]/td[3]/span[1]/span[1]/input[1]    10
    Capture Page Screenshot


E incluo o Documento na ARP


    Wait Until Element Is Visible    //li[contains(.,'Documentos do processo')]    timeout=30s
    Click Element        //li[contains(.,'Documentos do processo')]

    Wait Until Element Is Visible    css=input[type="file"]    timeout=30s
    Choose File    css=input[type="file"]    C:\\Users\\Basis\\Downloads\\shareFile.pdf

    
    # Clique e escrevo no campo 'Tipo do documento'
    Wait Until Element Is Visible    
    ...    //input[@name='ctl00$ContentPrincipal$objListagemDeDocumentos$autoTipoDeDocumento']    timeout=30s
    Input Text    
    ...    //input[@name='ctl00$ContentPrincipal$objListagemDeDocumentos$autoTipoDeDocumento']
    ...    Ata de Registro
    Sleep    2
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Ata de Registro de Preços')]    timeout=30s
    Click Element    //li[@tabindex='-1'][contains(.,'Ata de Registro de Preços')]


    # Clique no botão 'Anexar' o arquivo
    Capture Page Screenshot
    Click Element    //input[@value='Anexar']
    Handle Alert    ACCEPT
    # SeleniumLibrary.Close Browser

    
E assino o documento na ARP

    # Wait Until Element Is Visible    xpath=//a[contains(.,'Documentos do processo')]    timeout=30s
    # Click Element        xpath=//a[contains(.,'Documentos do processo')]


    # Selecionar o documento
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Wait Until Element Is Visible    //table[@id="ctl00_ContentPrincipal_objListagemDeDocumentos_dtgPesquisaNovo"]//tr[td/a[text()='Ata de Registro de Preços']]//td[10]//input    timeout=30s
    Select Checkbox     //table[@id="ctl00_ContentPrincipal_objListagemDeDocumentos_dtgPesquisaNovo"]//tr[td/a[text()='Ata de Registro de Preços']]//td[10]//input

    # Clicar no botão 'Assinar Documento'
    Wait Until Element Is Visible    xpath=//a[contains(.,'Assinar documento')]    timeout=30s
    Click Element    xpath=//a[contains(.,'Assinar documento')]


    # E Preencho os campos de assinatura
    Sleep    2
    Wait Until Element Is Visible    //span[text()="Assinatura Eletrônica"]    timeout=30s

    Wait Until Element Is Visible    css=input[id="ctl00_ContentPrincipal_tbxCargo"]    timeout=30s
    Input Text    css=input[id="ctl00_ContentPrincipal_tbxCargo"]    Teste

    Wait Until Element Is Visible    css=input[id="tbxSenhaAcesso"]    timeout=30s
    Input Text    css=input[id="tbxSenhaAcesso"]    PE@123456

    # E clico no botão assinar
    Capture Page Screenshot
    Click Element    xpath=//a[text()= 'Assinar']
    Sleep    3
    # SeleniumLibrary.Close Browser

Então salvo os dados
    Wait Until Element Is Visible    //span[contains(.,'Dados gerais')]
    Click Element    //span[contains(.,'Dados gerais')]
    Sleep    2

    Wait Until Element Is Visible    //a[contains(.,'Salvar e fechar')]
    Click Element    //a[contains(.,'Salvar e fechar')]
    Sleep    3




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
    E clico na Ata da Lista
    E configuro a Aba Dados Gerais

    E incluo o Documento na ARP
    E assino o documento na ARP
    Então salvo os dados

Cenário 03 - Ativar AT
