*** Settings ***
Documentation    Ações e Elementos do Módulo de IRP

Library    SeleniumLibrary
Resource        ./Variaveis.robot

*** Keywords ***

E Prencho os Campos da Aba Dados Gerais
    Switch Window
    Select Frame    //frame[@name='main']
    
    # Campo objeto IRP
    Wait Until Element Is Visible    //textarea[contains(@name,'txtObjeto')]    timeout=30s
    Input Text    //textarea[contains(@name,'txtObjeto')]    ${OBJETO_IRP}


    # Tipo Objeto
    Wait Until Element Is Visible    //input[contains(@name,'autTipoObjeto')]    30s
    Input Text    //input[contains(@name,'autTipoObjeto')]    AQUISIÇÃO DE IMÓVEIS
    Sleep    2
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'AQUISIÇÃO DE IMÓVEIS')]    15
    Sleep    2
    Click Element    //li[@tabindex='-1'][contains(.,'AQUISIÇÃO DE IMÓVEIS')]

    # Grupo de compras
    Wait Until Element Is Visible    //input[contains(@name,'autGrupoCompras')]    30
    Input Text    //input[contains(@name,'autGrupoCompras')]    Civil
    Sleep    2
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Grupo de Compras Padrão - SECRETARIA EXECUTIVA DE DEFESA CIVIL')]    20
    Click Element    //li[@tabindex='-1'][contains(.,'Grupo de Compras Padrão - SECRETARIA EXECUTIVA DE DEFESA CIVIL')]

    # Permite soicitação novos Items 'SIM'
    Wait Until Element Is Visible    //input[@value='1']    30
    Click Element    //input[@value='1']


E configuro as datas de vigencia da IRP
    ${DATA_ATUAL}=    Evaluate    datetime.datetime.now().strftime('%d/%m/%Y')   datetime
    Log    ${DATA_ATUAL}

    # Data inicio vigencia
    Wait Until Element Is Visible    id=ctl00_ContentPrincipal_tDtInicio    timeout=30s
    Input Text    id=ctl00_ContentPrincipal_tDtInicio     ${DATA_ATUAL}
    Sleep    2
    Set Focus To Element    id=ctl00_ContentPrincipal_tDtInicio
    Execute JavaScript    document.getElementById("ctl00_ContentPrincipal_tDtInicio").value="${DATA_ATUAL}";
    Sleep    2
    Capture Page Screenshot


    # Dara encerramento
    Wait Until Element Is Visible    id=ctl00_ContentPrincipal_tDtEncerramento    timeout=30s
    Sleep    2
    Input Text    id=ctl00_ContentPrincipal_tDtEncerramento     ${DATA_ATUAL}
    Sleep    2
    Set Focus To Element    id=ctl00_ContentPrincipal_tDtEncerramento
    Execute JavaScript    document.getElementById("ctl00_ContentPrincipal_tDtEncerramento").value="${DATA_ATUAL}";
    Sleep    2
    Capture Page Screenshot


Então salvo a IRP
   Wait Until Element Is Visible    //a[contains(@onclick,'Salvar(false);')]   30
   Click Element    //a[contains(@onclick,'Salvar(false);')]
   Sleep    3


E vejo a Auditoria da IRP
    Wait Until Element Is Visible    //span[contains(.,'Auditoria')]    10s
    Sleep    2
    Click Element    //span[contains(.,'Auditoria')]
    Sleep    2
    Capture Page Screenshot
    SeleniumLibrary.Close Browser

E clico na IRP da Lista
    Switch Window
    Select Frame    //frame[@name='main']
    Select Frame    //iframe[@name='frmConteudo']

    Wait Until Element Is Visible    //table[@id= "ctl00_ContentPrincipal_dtgPesquisa"]//tr[td//a[text() = '${OBJETO_IRP}']]//td[2]//a    timeout=30s
    Click Element     //table[@id= "ctl00_ContentPrincipal_dtgPesquisa"]//tr[td//a[text() = '${OBJETO_IRP}']]//td[2]//a
    Capture Page Screenshot

Então incluo os Itens na IRP
    Switch Window
    Select Frame    //frame[@name='main']

    # clique de itens
    Wait Until Element Is Visible    //span[@class='k-link'][contains(.,'Itens')]    timeout=15s
    Click Element    //span[@class='k-link'][contains(.,'Itens')]
    Sleep    2

    # Clique de 'Incluir'
    Wait Until Element Is Visible    //a[@onclick='IncluirItem()']    30
    Click Element    //a[@onclick='IncluirItem()']

    # selecionar os itens
    Wait Until Element Is Visible    //input[contains(@value, 'TUBO DE SILICONE')]    30
    Click Element    //input[contains(@value, 'TUBO DE SILICONE')]
    Sleep    2
    Wait Until Element Is Visible    //input[contains(@value, 'CATETER INTRAVENOSO')]    30
    Click Element    //input[contains(@value, 'CATETER INTRAVENOSO')]

    # Clique de Confirmar
    Wait Until Element Is Visible    //a[contains(@onclick,'ConfirmarProduto()')]    30
    Click Element    //a[contains(@onclick,'ConfirmarProduto()')]
    Sleep    2

    # Cnfirmação do popup
    Wait Until Element Is Visible    //a[contains(.,'Sim')]    30
    Click Element    //a[contains(.,'Sim')]
    Sleep    3

    # Seleção de Unid. medida dos itens - 01
    Wait Until Element Is Visible    //span[contains(@aria-owns,'ddlnCdUnidadeMedida_1_listbox')]    30
    Click Element    //span[contains(@aria-owns,'ddlnCdUnidadeMedida_1_listbox')]
    Sleep    2
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'BD 1 KG')]    30
    Click Element    //li[@tabindex='-1'][contains(.,'BD 1 KG')]

    # Seleção de Unid. medida dos itens - 02
    Wait Until Element Is Visible    //span[@aria-owns='ddlnCdUnidadeMedida_2_listbox']
    Click Element    //span[@aria-owns='ddlnCdUnidadeMedida_2_listbox']
    Sleep    2
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'CX 50 UNIDADES')]
    Click Element    //li[@tabindex='-1'][contains(.,'CX 50 UNIDADES')]
    Capture Page Screenshot

    # Clique para salvar
    Wait Until Element Is Visible    //a[@onclick='SalvarItens();']    30
    Click Element    //a[@onclick='SalvarItens();']
    Sleep    3

Então faço o Agendamento da IRP
    Switch Window
    Select Frame    //frame[@name='main']

    Wait Until Element Is Visible    //a[contains(.,'Agendar')]    30
    Click Element    //a[contains(.,'Agendar')]

    # Clique para confirmar no popup
    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    30
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    3

Então faço a manifestação de interesse
    Switch Window
    Select Frame    //frame[@name='main']

    # clique de itens
    Wait Until Element Is Visible    //span[@class='k-link'][contains(.,'Itens')]    timeout=15s
    Click Element    //span[@class='k-link'][contains(.,'Itens')]
    Sleep    2

    # Clique de Gerar manifestação
    Wait Until Element Is Visible    //a[contains(.,'Gerar manifestação')]    30
    Click Element    //a[contains(.,'Gerar manifestação')]


    # Grupo de compras
    Wait Until Element Is Visible   //a[@onclick='AbrirJanelaGrupoDeComprasManifestacao();']    30
    Click Element    //a[@onclick='AbrirJanelaGrupoDeComprasManifestacao();']
    

    Wait Until Element Is Visible    //input[contains(@name,'tbxGrupoCompra')]    30
    Input Text    //input[contains(@name,'tbxGrupoCompra')]    SECRETARIA DE ADMINISTRAÇÃO

    Wait Until Element Is Visible    //a[@onclick='AtualizarPesquisaGrupoCompra()']
    Click Element    //a[@onclick='AtualizarPesquisaGrupoCompra()']
    Sleep    2

    Wait Until Element Is Visible    //input[@value='17|Grupo de Compras Padrão - SECRETARIA DE ADMINISTRAÇÃO']
    Click Element    //input[@value='17|Grupo de Compras Padrão - SECRETARIA DE ADMINISTRAÇÃO']
    Sleep    2
    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]
    Click Element    //a[contains(.,'Confirmar')]


    # Quatidade solicitada
    Switch Window
    Select Frame    //frame[@name='main']
    Set Window Size    1920    1080  
    SeleniumLibrary.Press Keys    None    CONTROL -    CONTROL -    CONTROL -
    Wait Until Element Is Visible    //span[contains(@class,'k-icon k-i-arrow-n')]    timeout=15s
    Double Click Element    //span[contains(@class,'k-icon k-i-arrow-n')]
    Double Click Element    //span[contains(@class,'k-icon k-i-arrow-n')]

   ${elements}=  Get WebElements  //span[contains(@class,'k-icon k-i-arrow-n')]
    Double Click Element    ${elements}[1]
    Double Click Element    ${elements}[1]
    Sleep    2
    Capture Page Screenshot
    SeleniumLibrary.Press Keys    None    CONTROL 0
    Sleep    2

    Wait Until Element Is Visible    //a[contains(.,'Salvar e encaminhar')]    30
    Click Element    //a[contains(.,'Salvar e encaminhar')]
    Sleep    2
    Wait Until Element Is Visible    //a[contains(.,'Sim')]    30
    Click Element    //a[contains(.,'Sim')]
    Sleep    3

Então aprovo a Manifestação de Interesse
    Switch Window
    Select Frame    //frame[@name='main']

    Wait Until Element Is Visible    //span[contains(.,'Manifestação de interesse')]    20
    Click Element    //span[contains(.,'Manifestação de interesse')]
    Sleep    2

    Wait Until Element Is Visible    //table[@id="ctl00_ContentPrincipal_gridItensManifestado"]//tr[td//img[@title="Pendente"]]//td[9]//input    20
    Click Element    //table[@id="ctl00_ContentPrincipal_gridItensManifestado"]//tr[td//img[@title="Pendente"]]//td[9]//input
    Capture Page Screenshot

    # clique de aprovar MI
    Wait Until Element Is Visible    //a[contains(.,'Aprovar')]    20
    Click Element    //a[contains(.,'Aprovar')]

    # clique de confirmação do popup
    Wait Until Element Is Visible    //a[contains(.,'Sim')]    30
    Click Element    //a[contains(.,'Sim')]
    Sleep    3

Então Encerro a IRP
    Switch Window
    Select Frame    //frame[@name='main']
    Wait Until Element Is Visible    //a[contains(.,'Encerrar etapa')]    30
    Click Element    //a[contains(.,'Encerrar etapa')]
    
    # Corfimação do popup
    Wait Until Element Is Visible    id=idBtSegundo_ctl00_ContentPrincipal_mbxDadosGerais
    Click Element    id=idBtSegundo_ctl00_ContentPrincipal_mbxDadosGerais
    Sleep    3

Então Finalizo a IRP
    Switch Window
    Select Frame    //frame[@name='main']
    Wait Until Element Is Visible    //a[contains(.,'Finalizar IRP')]    30
    Click Element    //a[contains(.,'Finalizar IRP')]

    # Corfimação do popup
    Wait Until Element Is Visible    id=idBtSegundo_ctl00_ContentPrincipal_mbxDadosGerais
    Click Element    id=idBtSegundo_ctl00_ContentPrincipal_mbxDadosGerais
    Sleep    7

