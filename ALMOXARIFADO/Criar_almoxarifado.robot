*** Settings ***
Library    SeleniumLibrary

Resource    ../Resources/Resource_login.robot

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

E vejo a Auditoria do almoxarifado
    Sleep    2
    Wait Until Element Is Visible    //span[contains(.,'Auditoria')]    15
    Click Element    //span[contains(.,'Auditoria')]
    Sleep       2
    Capture Page Screenshot

E pesquiso pelo Almoxarifado

    # Switch Window
    Select Frame    //iframe[contains(@name,'frmConteudo')]

    Wait Until Element Is Visible
    ...    //input[@name='ctl00$oPesquisaAvancada$dtgPesquisaAvancadaControle$ctl01$edtCampo_2']    15
    # ...    //input[contains(@name,'ctl00') and contains(@name,'edtCampo_2')]    15
    Input Text
    # ...    //input[contains(@name,'ctl00') and contains(@name,'edtCampo_2')]    ${NOME_ALMOX}
    ...    ...    //input[@name='ctl00$oPesquisaAvancada$dtgPesquisaAvancadaControle$ctl01$edtCampo_2']    ${NOME_ALMOX}
    Wait Until Element Is Visible    //a[contains(.,'Pesquisar')]    15
    Click Element    //a[contains(.,'Pesquisar')]
    Capture Page Screenshot



*** Test Cases ***

Cenário 01 - Incluir um Novo Almoxarifado
    [Tags]    Incluir
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Almoxarifados
    Então incluo um novo Almoxarifado
    E vejo a Auditoria do almoxarifado


Cenário 02 - Incluir Itens no Almoxarifado
    [Tags]    Incluir_itens
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Almoxarifados
    E pesquiso pelo Almoxarifado
    