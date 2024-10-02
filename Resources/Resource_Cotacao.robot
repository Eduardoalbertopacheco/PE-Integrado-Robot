*** Settings ***
Documentation    Recursos, Ações e Elementos do Módulo de Cotação
Library          SeleniumLibrary
Library          DateTime
Library          OperatingSystem
Library          String

*** Variables ***
${DESC_COTACAO}    Cotação Teste Edu


*** Keywords ***
E acesso a lista de cotações
    Select Frame    xpath=//frame[contains(@name,'main')]

    # Clique em negociação
    Wait Until Element Is Visible    xpath=//div[@unselectable='on'][contains(.,'Negociação')]    timeout=30s
    Click Element    xpath=//div[@unselectable='on'][contains(.,'Negociação')]

    # mouse over em Cotação
    ${elemento}    Get WebElement    
    ...    xpath=//td[@class='label'][contains(.,'Cotação')]
    Mouse Over    ${elemento}
    
    # Clique em Lista de Cotações
    Wait Until Element Is Visible    
    ...    xpath=//td[@class='label'][contains(.,'Lista de cotações')]    timeout=30s
    Click Element    
    ...    xpath=//td[@class='label'][contains(.,'Lista de cotações')]
    
    Capture Page Screenshot
    Sleep    1

E clico em Inclir Cotação
    Select Frame    //iframe[@name='frmConteudo']
    Wait Until Element Is Visible    //a[contains(.,'Incluir')]
    Click Element    //a[contains(.,'Incluir')]
    Sleep    2

Quando preencho todos os dados da Aba Dados Gerais

    ${hora_atual-03min}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(minutes=3)).strftime('%d-%m-%Y %H:%M:%S')    datetime

    Switch Window    NEW
    Wait Until Element Is Visible    //input[@name='_cCOTACAO_x_sDsCotacao']    20
    Input Text    //input[@name='_cCOTACAO_x_sDsCotacao']    ${DESC_COTACAO}

    # Data Inicial
    Wait Until Element Is Visible    id=_cCOTACAO_x_tDtInicial
    Click Element    id=_cCOTACAO_x_tDtInicial
    Sleep    1
    Clear Element Text    id=_cCOTACAO_x_tDtInicial
    Sleep    1
    Set Focus To Element    id=_cCOTACAO_x_tDtInicial
    Sleep    1
    Execute JavaScript    document.getElementById("_cCOTACAO_x_tDtInicial").value="${hora_atual-03min}";
    Sleep    1
    Capture Page Screenshot


Então verifico que os dados foram salvos

    Wait Until Element Is Visible    //input[@value='Salvar']    20
    Click Element    //input[@value='Salvar']
    Sleep    3
    Handle Alert    ACCEPT
    Capture Page Screenshot
    SeleniumLibrary.Close Browser

E vejo a Auditoria da Cotação
    
    Sleep    2
    Wait Until Element Is Visible    //a[contains(.,'Auditoria')]    20
    Click Element    //a[contains(.,'Auditoria')]
    Capture Page Screenshot
    SeleniumLibrary.Close Browser


E seleciono o filtro todas a cotações

    Select Frame    //iframe[@name='frmConteudo']

    # Clicar no campo Exibir
    Wait Until Element Is Visible    xpath=//select[@id= "ctl00_ddlVisoes"]    timeout=30s
    Click Element    xpath=//select[@id= "ctl00_ddlVisoes"]

   # Clicar na seleção 'Tdas as Lictações'
   Click Element    xpath=//select[@id= "ctl00_ddlVisoes"]//*[@value='8500']

   # Clique no botão Pesquisar
   Wait Until Element Is Visible    xpath=//input[@value= "Pesquisar"]    timeout=30s
   Click Element    xpath=//input[@value= "Pesquisar"]
   Capture Page Screenshot

E seleciono a cotação da lista
    Sleep    2
    Wait Until Element Is Visible    //table[@id="ctl00_pesquisaDataGrid_dtgPesquisa"]//tr//td//a[text() = "${DESC_COTACAO}"]/ancestor::tr//td[10]//input    20
    Click Element    //table[@id="ctl00_pesquisaDataGrid_dtgPesquisa"]//tr//td//a[text() = "${DESC_COTACAO}"]/ancestor::tr//td[10]//input


E clico na cotação da lista
    Sleep    2
    Wait Until Element Is Visible    //table[@id="ctl00_pesquisaDataGrid_dtgPesquisa"]//tr//td//a[text() = "${DESC_COTACAO}"]    20
    Click Element    //table[@id="ctl00_pesquisaDataGrid_dtgPesquisa"]//tr//td//a[text() = "${DESC_COTACAO}"] 


Então agendo a cotação
    Sleep    2
    Wait Until Element Is Visible    //a[contains(.,'Agendar')]    20
    Click Element    //a[contains(.,'Agendar')]
    Capture Page Screenshot
    Handle Alert    ACCEPT
    Sleep    1
    Handle Alert    ACCEPT
    Sleep    3


Então incluo a SC na Cotação
    Switch Window    NEW
    ${Janelas}    Get Window Handles
    ${Janela02}    Set Variable    ${Janelas}[1]
    
    Switch Window    ${Janela02}

    # Clique em Itens
    Wait Until Element Is Visible    //a[contains(.,'Itens')]    15
    Click Element    //a[contains(.,'Itens')]
    Sleep    1

    # Clique de Incluir Itens da Solicitação
    Wait Until Element Is Visible    //a[contains(.,'Incluir item(ns) da solicitação')]    20
    Click Element    //a[contains(.,'Incluir item(ns) da solicitação')]
    Sleep    2

    Switch Window    NEW

    ${NUM_SC}    Get File    ${EXECDIR}/test/num_sc_cotacao.txt

    Wait Until Element Is Visible    //input[contains(@name,'sCdOrdemCompra')]    20
    Input Text    //input[contains(@name,'sCdOrdemCompra')]    ${NUM_SC}
    Capture Page Screenshot

    Wait Until Element Is Visible    //input[contains(@name,'btnPesquisar')]    20
    Click Element    //input[contains(@name,'btnPesquisar')]
    Sleep    2

    Wait Until Element Is Visible    //input[@class='classRdoList']    20
    Click Element    //input[@class='classRdoList']

    Wait Until Element Is Visible    //a[contains(@onclick,'objConfirmaAgrupar);')]    20
    Capture Page Screenshot
    Click Element    //a[contains(@onclick,'objConfirmaAgrupar);')]
    Sleep   1
    Handle Alert    ACCEPT
    Sleep   2
    SeleniumLibrary.Close Browser

