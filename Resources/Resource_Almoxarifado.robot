*** Settings ***
Documentation    Recursos do Módulo de Almoxarifado
Library          SeleniumLibrary

*** Variables ***

${NOME_ALMOX}    Almoxarifado Testeauto


*** Keywords ***
E acesso a lista de Almoxarifados
    Select Frame    xpath=//frame[contains(@name,'main')]

    # Clique em Almoxarifado
    Wait Until Element Is Visible    xpath=//div[@unselectable='on'][contains(.,'Almoxarifado')]    timeout=30s
    Click Element    xpath=//div[@unselectable='on'][contains(.,'Almoxarifado')]


    # Clique em Lista de Almoxarifados
    Wait Until Element Is Visible    //td[@class='label'][contains(.,'Lista de almoxarifados')]    timeout=30s
    Sleep    2
    Click Element    //td[@class='label'][contains(.,'Lista de almoxarifados')]
    Capture Page Screenshot


Então incluo um novo Almoxarifado
    Select Frame    //iframe[@name='frmConteudo']
    Wait Until Element Is Visible    //a[@onclick='IncluirAlmoxarifado();']    30
    Click Element    //a[@onclick='IncluirAlmoxarifado();']

    Switch Window    
    Select Frame    //frame[contains(@name,'main')]

    Sleep    2
    Wait Until Element Is Visible    //input[contains(@name,'tbxSigla')]    15
    Input Text    //input[contains(@name,'tbxSigla')]    testeauto

    Wait Until Element Is Visible    //input[@name='ctl00$ContentPrincipal$tbxNome']    15
    Input Text    //input[@name='ctl00$ContentPrincipal$tbxNome']    ${NOME_ALMOX}

    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlTipoControleEstoque_listbox']    15
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlTipoControleEstoque_listbox']

    Sleep    2
    # Selecionar Tipo controle
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'FIFO')]    15
    Click Element    //li[@tabindex='-1'][contains(.,'FIFO')]

    Sleep    2
    # Selecionar Uidade gestora
    Wait Until Element Is Visible    //input[contains(@name,'autUnidadeGestora')]    15
    Input Text    //input[contains(@name,'autUnidadeGestora')]    Adm
    Sleep    3

    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'SECRETARIA DE ADMINISTRAÇÃO')]    15
    Click Element    //li[@tabindex='-1'][contains(.,'SECRETARIA DE ADMINISTRAÇÃO')]

    Sleep    2
    # Selecionar Endereço
    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlEndereco_listbox']    15
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlEndereco_listbox']
    
    Sleep    2
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'AVENIDA ANTONIO DE GOES')]    15
    Click Element    //li[@tabindex='-1'][contains(.,'AVENIDA ANTONIO DE GOES')]

    Sleep    2
    # Selecioanr Resposável
    Wait Until Element Is Visible    //input[contains(@name,'autResponsavel')]    15
    Input Text    //input[contains(@name,'autResponsavel')]    Gestor Almoxarifado
    Sleep    3

    Click Element    //li[@tabindex='-1'][contains(.,'Gestor Almoxarifado')]
    Capture Page Screenshot


    # Clique do botão Salvar
    Wait Until Element Is Visible    //a[@onclick='SalvarDadosGeraisAlmoxarifado(false);']    15
    Click Element    //a[@onclick='SalvarDadosGeraisAlmoxarifado(false);']
    Sleep    3


    # Aba dados complematáres - MASCARA DE ENTRADA
    Wait Until Element Is Visible    //span[contains(.,'Dados complementares')]    15
    Click Element    //span[contains(.,'Dados complementares')]

    Wait Until Element Is Visible    //a[@onclick='IncluirMascara();']    15
    Click Element    //a[@onclick='IncluirMascara();']

    # Epressão regular
    Wait Until Element Is Visible    //input[contains(@name,'tbxRegularExpression')]    15
    Input Text    //input[contains(@name,'tbxRegularExpression')]    ENTRADA

    # Modelo
    Wait Until Element Is Visible    //input[contains(@name,'tbxRegularExpression')]    10
    Input Text    //input[contains(@name,'tbxRegularExpression')]    ENTRADA

    # Descrição
    Wait Until Element Is Visible    //input[contains(@name,'tbxRegularExpression')]    15
    Input Text    //input[contains(@name,'tbxRegularExpression')]    MÁSCARA DE ENTRADA

    Wait Until Element Is Visible    //a[@onclick='SalvarMascara(true);']    10
    Click Element    //a[@onclick='SalvarMascara(true);']
    Sleep    3


    # Aba dados complematáres - MASCARA DE ENTRDA
    Wait Until Element Is Visible    //span[contains(.,'Dados complementares')]    15
    Click Element    //span[contains(.,'Dados complementares')]

    Wait Until Element Is Visible    //a[@onclick='IncluirMascara();']    15
    Click Element    //a[@onclick='IncluirMascara();']

    # Epressão regular
    Wait Until Element Is Visible    //input[contains(@name,'tbxRegularExpression')]    15
    Input Text    //input[contains(@name,'tbxRegularExpression')]    ESTOQUE

    # Modelo
    Wait Until Element Is Visible    //input[contains(@name,'tbxRegularExpression')]    10
    Input Text    //input[contains(@name,'tbxRegularExpression')]    ESTOQUE

    # Descrição
    Wait Until Element Is Visible    //input[contains(@name,'tbxRegularExpression')]    15
    Input Text    //input[contains(@name,'tbxRegularExpression')]    MÁSCARA DE ESTOQUE

    Wait Until Element Is Visible    //a[@onclick='SalvarMascara(true);']    10
    Click Element    //a[@onclick='SalvarMascara(true);']
    Sleep    3
    Capture Page Screenshot    


    # Aba Endereço de estoque - Entrada
    Wait Until Element Is Visible    //span[contains(.,'Endereço de estoque')]    20
    Click Element    //span[contains(.,'Endereço de estoque')]

    Wait Until Element Is Visible    //a[@onclick='IncluirEnderecoEstoque();']    10
    Click Element    //a[@onclick='IncluirEnderecoEstoque();']

    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlMascara_listbox']    20
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlMascara_listbox']

    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'ENTRADA - ENDEREÇO DE ENTRADA')]    10
    Sleep    1
    Click Element    //li[@tabindex='-1'][contains(.,'ENTRADA - ENDEREÇO DE ENTRADA')]

    Wait Until Element Is Visible    //input[contains(@name,'tbxCodigoEndereco')]    10
    Input Text    //input[contains(@name,'tbxCodigoEndereco')]    ENTRADA

    Wait Until Element Is Visible    //input[contains(@name,'tbxDescricao')]    10
    Input Text    //input[contains(@name,'tbxDescricao')]    ENDEREÇO DE ENTRADA

    Wait Until Element Is Visible    //a[@onclick='SalvarEnderecoEstoqueDadosGerais(true);']    10
    Click Element    //a[@onclick='SalvarEnderecoEstoqueDadosGerais(true);']
    Sleep    3
    Capture Page Screenshot  


    # Aba Endereço de estoque - Estoque
    Wait Until Element Is Visible    //span[contains(.,'Endereço de estoque')]    20
    Click Element    //span[contains(.,'Endereço de estoque')]

    Wait Until Element Is Visible    //a[@onclick='IncluirEnderecoEstoque();']    10
    Click Element    //a[@onclick='IncluirEnderecoEstoque();']

    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlMascara_listbox']    20
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlMascara_listbox']

    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'ESTOQUE - ENDEREÇO DE ESTOQUE')]    10
    Sleep    1
    Click Element    //li[@tabindex='-1'][contains(.,'ESTOQUE - ENDEREÇO DE ESTOQUE')]

    Wait Until Element Is Visible    //input[contains(@name,'tbxCodigoEndereco')]    10
    Input Text    //input[contains(@name,'tbxCodigoEndereco')]    ESTOQUE

    Wait Until Element Is Visible    //input[contains(@name,'tbxDescricao')]    10
    Input Text    //input[contains(@name,'tbxDescricao')]    ENDEREÇO DE ESTOQUE

    Wait Until Element Is Visible    //a[@onclick='SalvarEnderecoEstoqueDadosGerais(true);']    10
    Click Element    //a[@onclick='SalvarEnderecoEstoqueDadosGerais(true);']
    Sleep    3
    Capture Page Screenshot  

E vejo a Auditoria do almoxarifado
    Sleep    2
    Wait Until Element Is Visible    //span[contains(.,'Auditoria')]    15
    Click Element    //span[contains(.,'Auditoria')]
    Sleep       2
    Capture Page Screenshot

E pesquiso pelo Almoxarifado
    Select Frame    //iframe[contains(@name,'frmConteudo')]

    Wait Until Element Is Visible
    ...    //input[contains(@name,'ctl00') and contains(@name,'edtCampo_2')]    15
    Input Text
    ...    //input[contains(@name,'ctl00') and contains(@name,'edtCampo_2')]    ${NOME_ALMOX}
    Sleep   2

    Wait Until Element Is Visible    //a[contains(.,'Pesquisar')]    15
    Click Element    //a[contains(.,'Pesquisar')]
    Capture Page Screenshot


E clico no Almoxarifado da lista
    Select Frame    //iframe[contains(@name,'frmConteudo')]

    Wait Until Element Is Visible    //table[@id="ctl00_ContentPrincipal_dtgPesquisa"]//tr[td/a[text()='${NOME_ALMOX}']]//a
    Click Element    //table[@id="ctl00_ContentPrincipal_dtgPesquisa"]//tr[td/a[text()='${NOME_ALMOX}']]//a

