
*** Settings ***
Documentation    Recursos, Ações e Elementos do Módulo de Cotação
Library          SeleniumLibrary
Library          DateTime
Library          OperatingSystem
Library          String

*** Variables ***
${DESC_COTACAO}    Cotação Teste_Auto

${data_atual}    Evaluate    datetime.datetime.now().strftime('%d-%m-%Y %H:%M:%S')    datetime

# ${DATA_ATUAL+10D}    Evaluate    (datetime.datetime.now() + datetime.timedelta(days=10)).strftime('%d-%m-%Y %H:%M:%S')    datetime


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


Então encerro a cotação
    Wait Until Element Is Visible    //frame[contains(@name,'frmPainelBotoes')]    10
    Select Frame    //frame[contains(@name,'frmPainelBotoes')]
    Sleep    2
    Wait Until Element Is Visible    //img[@title='Painel de controle']    20
    Click Element    //img[@title='Painel de controle']

    Switch Window
    Select Frame    //frame[contains(@name,'main')]
    Select Frame    //iframe[@name='frmConteudo']
    Select Frame    //frame[@name='frmDetalheCotacao']

    # Clique de Encerrar Cotação
    Wait Until Element Is Visible    //a[contains(.,'Encerrar cotação')]    15
    Click Element    //a[contains(.,'Encerrar cotação')]
    Capture Page Screenshot

    Switch Window    NEW

    Wait Until Element Is Visible    //textarea[contains(@name,'tbxJustificativa')]    15
    Input Text    //textarea[contains(@name,'tbxJustificativa')]    Justificativa
    Capture Page Screenshot

    Wait Until Element Is Visible    //input[@value='Sim']
    Click Element    //input[@value='Sim']

    Handle Alert    ACCEPT
    Sleep    5

    Switch Window    NEW
    Wait Until Element Is Visible    //input[@value='Confirmar']    15
    Click Element    //input[@value='Confirmar']
    Sleep    2
    

Então agendo a cotação
    Sleep    2
    Wait Until Element Is Visible    //a[contains(.,'Agendar')]    20
    Click Element    //a[contains(.,'Agendar')]
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

    ${NUM_SC}    Get File    ${EXECDIR}/test/processos/num_sc_cotacao.txt

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



Então faço a representação

    FOR    ${index}    IN RANGE    1    4

        Wait Until Element Is Visible    //frame[contains(@name,'frmPainelBotoes')]    10
        Select Frame    //frame[contains(@name,'frmPainelBotoes')]
        Sleep    2
        Wait Until Element Is Visible    //img[@title='Painel de controle']    20
        Click Element    //img[@title='Painel de controle']

        Switch Window
        Select Frame    //frame[contains(@name,'main')]
        Select Frame    //iframe[@name='frmConteudo']
        Select Frame    //frame[@name='frmDetalheCotacao']

        Wait Until Element Is Visible    //a[contains(.,'Participantes')]    15
        Click Element    //a[contains(.,'Participantes')]
    

        Sleep    3
        Switch Window    New
        Capture Page Screenshot
        Wait Until Element Is Visible    (//img[@id='imgFichaFornecedor'])[${index}]    15
        Click Element    (//img[@id='imgFichaFornecedor'])[${index}]

        Switch Window    New
        Sleep    2

        # Justificativa
        Wait Until Element Is Visible    //textarea[contains(@name,'tbxJustificativa')]    15
        Input Text    //textarea[contains(@name,'tbxJustificativa')]    Justificativa
        Capture Page Screenshot
        ${Janelas}    Get Window Handles

        Wait Until Element Is Visible    //input[@value='Sim']    15
        Click Element    //input[@value='Sim']
        Sleep    1

        ${Janelas}    Get Window Handles
        ${Janela01}    Set Variable    ${Janelas}[0]

        Switch Window    ${Janela01}

        Select Frame    //frame[contains(@name,'main')]
        Select Frame    //iframe[@name='frmConteudo']
        Select Frame    //frame[contains(@name,'frmNegociacao')]

        Sleep    1

        ${Janelas}    Get Window Handles
        ${Janela01}    Set Variable    ${Janelas}[0]
        Switch Window    ${Janela01}

        Select Frame    //frame[contains(@name,'main')]
        Select Frame    //iframe[@name='frmConteudo']
        Select Frame    //frame[contains(@name,'frmNegociacao')]

        # Clique de Nova Proposta
        Sleep    2
        Wait Until Element Is Visible    //a[contains(.,'Nova proposta')]
        Click Element    //a[contains(.,'Nova proposta')]
        Sleep    3

        Switch Window    New

        # Incluir Anexo
        Wait Until Element Is Visible    //img[contains(@src,'anexo.gif')]    15
        Click Element    //img[contains(@src,'anexo.gif')]

        # Switch Window
        # Select Frame    //frame[contains(@name,'main')]

        Wait Until Element Is Visible    //input[@type='file']
        Choose File    //input[@type='file']    ${EXECDIR}\\test\\Fixtures\\Mod03-Locators.pdf
        Capture Page Screenshot

        Wait Until Element Is Visible    //input[@value='Anexar']
        Sleep    1
        Click Element    //input[@value='Anexar']

        Wait Until Element Is Visible    //a[contains(.,'Fechar')]    10
        Click Element    //a[contains(.,'Fechar')]



        # Valor Unitário
        Wait Until Element Is Visible    (//input[@type='text'])[1]    10
        Sleep    1
        Input Text    (//input[@type='text'])[1]    100

        # Validade da proposta
        ${data+10d}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(days=10)).strftime('%d-%m-%Y %H:%M:%S')    datetime

        Wait Until Element Is Visible    id=_cCOTACAO_PROPOSTA_x_tDtValidade
        Click Element    id=_cCOTACAO_PROPOSTA_x_tDtValidade
        Sleep    1
        Set Focus To Element    id=_cCOTACAO_PROPOSTA_x_tDtValidade
        Execute JavaScript    document.getElementById("_cCOTACAO_PROPOSTA_x_tDtValidade").value="${data+10d}";
        Sleep    1
        Capture Page Screenshot

        # Data de entrega
        Wait Until Element Is Visible    id=oCotacaoPropostaEndereco_rptPropostaItemEndereco_ctl00_tDtEntrega
        Click Element    id=oCotacaoPropostaEndereco_rptPropostaItemEndereco_ctl00_tDtEntrega
        Sleep    1
        Set Focus To Element    id=oCotacaoPropostaEndereco_rptPropostaItemEndereco_ctl00_tDtEntrega
        Execute JavaScript    document.getElementById("oCotacaoPropostaEndereco_rptPropostaItemEndereco_ctl00_tDtEntrega").value="${data+10d}";
        Sleep    1
        Capture Page Screenshot

        # Clique de Salvar e Fechar
        Wait Until Element Is Visible    //input[@value='Salvar e fechar']    15
        Click Element    //input[@value='Salvar e fechar']
        Sleep    3
        Handle Alert    ACCEPT
        Sleep    3

        Switch Window
        Select Frame       //frame[contains(@name,'main')]
        Select Frame    //iframe[@name='frmConteudo']
    END











    # # Clique de Icone para representar Fornecedor
    # Sleep    15
    # Switch Window    New
    # Capture Page Screenshot
    # Wait Until Element Is Visible    (//img[@id='imgFichaFornecedor'])[1]    15
    # Click Element    (//img[@id='imgFichaFornecedor'])[1]

    # Switch Window    New
    # Sleep    2

    # # Justificativa
    # Wait Until Element Is Visible    //textarea[contains(@name,'tbxJustificativa')]    15
    # Input Text    //textarea[contains(@name,'tbxJustificativa')]    Justificativa
    # Capture Page Screenshot
    # ${Janelas}    Get Window Handles

    # Wait Until Element Is Visible    //input[@value='Sim']    15
    # Click Element    //input[@value='Sim']
    # Sleep    1

    # ${Janelas}    Get Window Handles
    # ${Janela01}    Set Variable    ${Janelas}[0]

    # Switch Window    ${Janela01}

    # Select Frame    //frame[contains(@name,'main')]
    # Select Frame    //iframe[@name='frmConteudo']
    # Select Frame    //frame[contains(@name,'frmNegociacao')]

    # Sleep    1
    

    # # Anexar proposta
    # Wait Until Element Is Visible    //a[contains(.,'Anexar proposta')]    10
    # Click Element    //a[contains(.,'Anexar proposta')]

    # Switch Window
    # Select Frame    //frame[contains(@name,'main')]

    # Wait Until Element Is Visible    //input[@type='file']
    # Choose File    //input[@type='file']    ${EXECDIR}\\test\\Fixtures\\Mod03-Locators.pdf
    # Capture Page Screenshot

    # Wait Until Element Is Visible    //input[@value='Anexar']
    # Sleep    1
    # Click Element    //input[@value='Anexar']


    # Run Keyword And Ignore Error    Wait Until Element Is Visible    //a[contains(.,'OK')]    10
    # Run Keyword And Ignore Error    Click Element    //a[contains(.,'OK')]

    # Sleep    2


    # # Clique de OK do Popup
    # Switch Window
    # Select Frame    //frame[contains(@name,'main')]
    # Wait Until Element Is Visible    //a[@id="idBtPrimeiro_ctl00_ContentPrincipal_AnexoCotacao_mbxAnexo"]    10
    # Sleep    1
    # Click Element    //a[@id="idBtPrimeiro_ctl00_ContentPrincipal_AnexoCotacao_mbxAnexo"]
    # Wait Until Element Is Visible    //a[contains(.,'Fechar')]    10
    # Click Element    //a[contains(.,'Fechar')]


    # ${Janelas}    Get Window Handles
    # ${Janela01}    Set Variable    ${Janelas}[0]
    # Switch Window    ${Janela01}

    # Select Frame    //frame[contains(@name,'main')]
    # Select Frame    //iframe[@name='frmConteudo']
    # Select Frame    //frame[contains(@name,'frmNegociacao')]


    # Sleep    2
    # Wait Until Element Is Visible    //a[contains(.,'Nova proposta')]
    # Click Element    //a[contains(.,'Nova proposta')]
    # Sleep    3

    # Switch Window    NEW

    # # Valor Unitário
    # Wait Until Element Is Visible    (//input[@type='text'])[1]    10
    # Input Text    (//input[@type='text'])[1]    100

    # # Validade da proposta
    # ${data+10d}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(days=10)).strftime('%d-%m-%Y %H:%M:%S')    datetime


    # Wait Until Element Is Visible    id=_cCOTACAO_PROPOSTA_x_tDtValidade
    # Click Element    id=_cCOTACAO_PROPOSTA_x_tDtValidade
    # Sleep    1
    # Set Focus To Element    id=_cCOTACAO_PROPOSTA_x_tDtValidade
    # Execute JavaScript    document.getElementById("_cCOTACAO_PROPOSTA_x_tDtValidade").value="${data+10d}";
    # Sleep    1
    # Capture Page Screenshot

    # # Data de entrega
    # Wait Until Element Is Visible    id=oCotacaoPropostaEndereco_rptPropostaItemEndereco_ctl00_tDtEntrega
    # Click Element    id=oCotacaoPropostaEndereco_rptPropostaItemEndereco_ctl00_tDtEntrega
    # Sleep    1
    # Set Focus To Element    id=oCotacaoPropostaEndereco_rptPropostaItemEndereco_ctl00_tDtEntrega
    # Execute JavaScript    document.getElementById("oCotacaoPropostaEndereco_rptPropostaItemEndereco_ctl00_tDtEntrega").value="${data+10d}";
    # Sleep    1
    # Capture Page Screenshot


    # #Clique de Salvar e Fechar
    # Wait Until Element Is Visible    //input[@value='Salvar e fechar']    15
    # Click Element    //input[@value='Salvar e fechar']
    # Sleep    3
    # Handle Alert    ACCEPT

   

