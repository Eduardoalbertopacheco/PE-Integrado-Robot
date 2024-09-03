*** Settings ***
Documentation    Recursos do Módulo de Almoxarifado
Library          SeleniumLibrary
Library          DateTime

*** Variables ***

${NOME_ALMOX}    Almoxarifado Testeauto
@{CODIGOS_PRODUTOS}    1000241    1000268


*** Keywords ***
E acesso a lista de Almoxarifados
    Select Frame    xpath=//frame[contains(@name,'main')]

    # Clique em Almoxarifado
    Wait Until Element Is Visible    xpath=//div[@unselectable='on'][contains(.,'Almoxarifado')]    timeout=30s
    Click Element    xpath=//div[@unselectable='on'][contains(.,'Almoxarifado')]


    # Clique em Lista de Almoxarifados
    Wait Until Element Is Visible    //td[@class='label'][contains(.,'Lista de almoxarifados')]    timeout=30s
    Sleep    1
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
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Preço médio')]    15
    Click Element    //li[@tabindex='-1'][contains(.,'Preço médio')]

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
    Sleep    1
    Click Element    //span[contains(.,'Dados complementares')]

    Wait Until Element Is Visible    //a[@onclick='IncluirMascara();']    15
    Sleep    1
    Click Element    //a[@onclick='IncluirMascara();']

    # Epressão regular
    Wait Until Element Is Visible    //input[contains(@name,'tbxRegularExpression')]    15
    Sleep    1
    Input Text    //input[contains(@name,'tbxRegularExpression')]    ENTRADA

    # Modelo
    Wait Until Element Is Visible    //input[contains(@name,'tbxModelo')]    10
    Sleep    1
    Input Text    //input[contains(@name,'tbxModelo')]    ENTRADA

    # Descrição
    Wait Until Element Is Visible    //input[contains(@name,'tbxDescricao')]    15
    Sleep    1
    Input Text    //input[contains(@name,'tbxDescricao')]    ENDEREÇO DE ENTRADA

    Wait Until Element Is Visible    //a[@onclick='SalvarMascara(true);']    10
    Sleep    1
    Click Element    //a[@onclick='SalvarMascara(true);']
    Sleep    3


    # Aba dados complematáres - MASCARA DE ENTRDA
    Wait Until Element Is Visible    //a[@onclick='IncluirMascara();']    15
    Sleep    2
    Click Element    //a[@onclick='IncluirMascara();']

    # Epressão regular
    Wait Until Element Is Visible    //input[contains(@name,'tbxRegularExpression')]    15
    Sleep    1
    Input Text    //input[contains(@name,'tbxRegularExpression')]    ESTOQUE

    # Modelo
    Wait Until Element Is Visible    //input[contains(@name,'tbxModelo')]    10
    Sleep    1
    Input Text    //input[contains(@name,'tbxModelo')]    ESTOQUE

    # Descrição
    Wait Until Element Is Visible    //input[contains(@name,'tbxDescricao')]    15
    Sleep    1
    Input Text    //input[contains(@name,'tbxDescricao')]    ENDEREÇO DE ESTOQUE

    Wait Until Element Is Visible    //a[@onclick='SalvarMascara(true);']    10
    Sleep    1
    Click Element    //a[@onclick='SalvarMascara(true);']
    Sleep    3
    Capture Page Screenshot    


    # Aba Endereço de Estoque - ESTOQUE
    Wait Until Element Is Visible    //span[contains(.,'Endereço de estoque')]    20
    Click Element    //span[contains(.,'Endereço de estoque')]

    # Clique do botão Incluir
    Wait Until Element Is Visible    //a[@onclick='IncluirEnderecoEstoque();']    10
    Sleep    1
    Click Element    //a[@onclick='IncluirEnderecoEstoque();']

    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlMascara_listbox']    20
    Sleep    1
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


    # # Aba Endereço de Estoque - ENTRADA
    # Sleep    2
    # Wait Until Element Is Visible    //a[@onclick='IncluirEnderecoEstoque();']    10
    # Sleep    1
    # Click Element    //a[@onclick='IncluirEnderecoEstoque();']

    # Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlMascara_listbox']    20
    # Sleep    1
    # Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlMascara_listbox']

    # Wait Until Element Is Visible    //li[contains(.,'ENTRADA - ENDEREÇO DE ENTRADA')]    10
    # Sleep    1
    # Click Element    //li[contains(.,'ENTRADA - ENDEREÇO DE ENTRADA')]

    # Wait Until Element Is Visible    //input[contains(@name,'tbxCodigoEndereco')]    10
    # Input Text    //input[contains(@name,'tbxCodigoEndereco')]    ENTRADA

    # Wait Until Element Is Visible    //input[contains(@name,'tbxDescricao')]    10
    # Input Text    //input[contains(@name,'tbxDescricao')]    ENDEREÇO DE ENTRADA

    # Wait Until Element Is Visible    //a[@onclick='SalvarEnderecoEstoqueDadosGerais(true);']    10
    # Click Element    //a[@onclick='SalvarEnderecoEstoqueDadosGerais(true);']
    # Sleep    3
    # Capture Page Screenshot  


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



E clico em Itens do Almoxarifado

    Scroll Element Into View    (//table[@id="ctl00_ContentPrincipal_dtgPesquisa"]//tr[td/a[text()='${NOME_ALMOX}']]//td[8]//a)[last()]
    Sleep    2
    Wait Until Element Is Visible    (//table[@id="ctl00_ContentPrincipal_dtgPesquisa"]//tr[td/a[text()='${NOME_ALMOX}']]//td[8]//a)[last()]
    Sleep    1
    Click Element    (//table[@id="ctl00_ContentPrincipal_dtgPesquisa"]//tr[td/a[text()='${NOME_ALMOX}']]//td[8]//a)[last()]

Então incluo os Itens no Almoxarifado

    FOR    ${i}    IN RANGE    2
        ${codigo_produto}=    Set Variable    ${CODIGOS_PRODUTOS}[${i}]
        Sleep    2
        Set Focus To Element    //a[contains(.,'Incluir')]
        Wait Until Element Is Visible    //a[contains(.,'Incluir')]    20
        Click Element    //a[contains(.,'Incluir')]
        Sleep    2
    
        Switch Window
        Select Frame    //frame[contains(@name,'main')]

        # Lupa do Campo 'Produto'
        Wait Until Element Is Visible    //a[contains(@onclick,'AbrirJanelaPesquisarProduto();')]    30
        Click Element    //a[contains(@onclick,'AbrirJanelaPesquisarProduto();')]
        Sleep    5

        # Campo Código do produto
        Wait Until Element Is Visible    //input[@name='ctl00$ContentPrincipal$txtCodigo']    20
        Input Text    //input[@name='ctl00$ContentPrincipal$txtCodigo']    ${codigo_produto}

        # Botão 'Pesquisar'
        Wait Until Element Is Visible    //a[contains(@onclick,'AtualizarPesquisaProduto()')]    20
        Sleep    2
        Click Element    //a[contains(@onclick,'AtualizarPesquisaProduto()')]
        Sleep    2
        Capture Page Screenshot

        # Clique para marcar o produto da lista
        Wait Until Element Is Visible    //input[contains(@id,'ckbListProduto')]    20
        Click Element    //input[contains(@id,'ckbListProduto')]

        # Clique de confirmar 
        Wait Until Element Is Visible    //a[contains(@onclick,'ConfirmarProduto()')]    20
        Click Element    //a[contains(@onclick,'ConfirmarProduto()')]

        Sleep    2
        Capture Page Screenshot
        # Clique de salvar e fechar
        Wait Until Element Is Visible    //a[contains(.,'Salvar e fechar')]    20
        Click Element    //a[contains(.,'Salvar e fechar')]
        Sleep    2

        Switch Window
        Select Frame    //frame[contains(@name,'main')]
        Sleep    2
        Select Frame    //iframe[@name='frmConteudo']
        Sleep    2
    END

E acesso a lista de Recebimento
    Select Frame    xpath=//frame[contains(@name,'main')]

    # Clique em Recebimento
    Wait Until Element Is Visible    xpath=//div[@unselectable='on'][contains(.,'Recebimento')]    timeout=30s
    Click Element    xpath=//div[@unselectable='on'][contains(.,'Recebimento')]


    # Clique em Lista de Recebimentos
    Wait Until Element Is Visible    //td[@class='label'][contains(.,'Lista de recebimentos')]    timeout=30s
    Sleep    2
    Click Element    //td[@class='label'][contains(.,'Lista de recebimentos')]
    Capture Page Screenshot


Então incluo um novo Recebimento
    ${CURRENT_DATE}=    Get Current Date    result_format=%d/%m/%Y

    Select Frame    //iframe[@name='frmConteudo']
    Wait Until Element Is Visible    //a[@onclick='IncluirRecebimento();']    30
    Click Element    //a[@onclick='IncluirRecebimento();']

    Switch Window    
    Select Frame    //frame[contains(@name,'main')]

    # Tipo de movimentação
    Wait Until Element Is Visible    //span[contains(@aria-owns,'ctl00_ContentPrincipal_ddlTipoMovimentacao_listbox')]    20
    Click Element    //span[contains(@aria-owns,'ctl00_ContentPrincipal_ddlTipoMovimentacao_listbox')]
    Sleep    2
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Recebimento por nota fiscal de venda')]    20
    Sleep    2
    Click Element    //li[@tabindex='-1'][contains(.,'Recebimento por nota fiscal de venda')]
    Sleep    2
    
    # Finalidade
    Wait Until Element Is Visible    //span[contains(@aria-owns,'ctl00_ContentPrincipal_ddlFinalidade_listbox')]    20
    Click Element    //span[contains(@aria-owns,'ctl00_ContentPrincipal_ddlFinalidade_listbox')]
    Sleep    2
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Estoque')]    20
    Sleep    2
    Click Element    //li[@tabindex='-1'][contains(.,'Estoque')]
    Capture Page Screenshot

    #Almoxarifado
    Sleep    2
    Wait Until Element Is Visible    //a[contains(@onclick,'AbrirJanelaPesquisarAlmoxarifado();')]    20
    Sleep    2
    Click Element    //a[contains(@onclick,'AbrirJanelaPesquisarAlmoxarifado();')]
    Sleep    2

    Wait Until Element Is Visible    //input[@name='ctl00$ContentPrincipal$tbxDsAlmoxarifado']    20
    Input Text    //input[@name='ctl00$ContentPrincipal$tbxDsAlmoxarifado']    ${NOME_ALMOX}
    Click Element    //a[contains(.,'Pesquisar')]
    Sleep    2

    Wait Until Element Is Visible    //input[contains(@value,'126')]    20
    Click Element    //input[contains(@value,'126')]
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    20
    Click Element    //a[contains(.,'Confirmar')]

    # Fornecedor
    Wait Until Element Is Visible    //a[contains(@onclick,'AbrirJanelaFornecedor();')]    20
    Click Element    //a[contains(@onclick,'AbrirJanelaFornecedor();')]
    Sleep    2

    Wait Until Element Is Visible    //input[@data-scdestado='RR']    20
    Click Element    //input[@data-scdestado='RR']
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    20
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    2

    # Questionário
    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlQuestionario_listbox']    10
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlQuestionario_listbox']
    Sleep    2
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Avaliação de fornecedor')]    20
    Click Element    //li[@tabindex='-1'][contains(.,'Avaliação de fornecedor')]
    Sleep    2

    # Endereço de Entrega
    Wait Until Element Is Visible    //span[contains(@aria-owns,'ctl00_ContentPrincipal_ddlEnderecoEntrega_listbox')]    20
    Click Element    //span[contains(@aria-owns,'ctl00_ContentPrincipal_ddlEnderecoEntrega_listbox')]
    Sleep    2

    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'AVENIDA ANTONIO DE GOES - RECIFE - PE')]    20
    Click Element    //li[@tabindex='-1'][contains(.,'AVENIDA ANTONIO DE GOES - RECIFE - PE')]
    Capture Page Screenshot

    # Documentos
    Wait Until Element Is Visible    //input[@id='tbxNumeroDocumento_0']    20
    Input Text    //input[@id='tbxNumeroDocumento_0']    123456

    Wait Until Element Is Visible    //input[@id='tbxSerieDocumento_0']    20
    Input Text    //input[@id='tbxSerieDocumento_0']    123456

    Wait Until Element Is Visible    //table[1]/tbody[1]/tr[1]/td[4]/div[1]/span[1]/span[1]/input[1]    20
    Sleep    1
    Input Text    //table[1]/tbody[1]/tr[1]/td[4]/div[1]/span[1]/span[1]/input[1]   ${CURRENT_DATE}

    Wait Until Element Is Visible    //input[@id='tbxNumeroDocumento_1']    20
    Input Text    //input[@id='tbxNumeroDocumento_1']    123456

    Wait Until Element Is Visible    //input[contains(@id,'tbxSerieDocumento_1')]    20
    Input Text    //input[contains(@id,'tbxSerieDocumento_1')]    123456

    Wait Until Element Is Visible    //table[1]/tbody[1]/tr[2]/td[4]/div[1]/span[1]/span[1]/input[1]
    Sleep    1
    Input Text    //table[1]/tbody[1]/tr[2]/td[4]/div[1]/span[1]/span[1]/input[1]    ${CURRENT_DATE}
    Sleep    2
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[contains(.,'Salvar e fechar')]    20
    Click Element    //a[contains(.,'Salvar e fechar')]
    Sleep    3
    Close Browser

E clico no recebimento da lista
    Select Frame    //iframe[@name='frmConteudo']
    Wait Until Element Is Visible    //table[@id='ctl00_ContentPrincipal_dtgPesquisa']//tr[td[text()='${NOME_ALMOX}']]//td[1]//a    20
    Click Element    //table[@id='ctl00_ContentPrincipal_dtgPesquisa']//tr[td[text()='${NOME_ALMOX}']]//td[1]//a



Então incluo os Itens para recebimento

    Switch Window    
    Select Frame    //frame[contains(@name,'main')]

    # Clique na aba 'Itens'
    Wait Until Element Is Visible    //span[contains(.,'Itens')]    20
    Click Element    //span[contains(.,'Itens')]

    FOR    ${i}    IN RANGE    2

        # Clique em Incluir na aba Itens
        Wait Until Element Is Visible    //a[@onclick='IncluirItem()']    20
        Click Element    //a[@onclick='IncluirItem()']
        Sleep    3
        ${codigo_produto}=    Set Variable    ${CODIGOS_PRODUTOS}[${i}]
        Sleep    2

        # Campo Código do produto
        Wait Until Element Is Visible    //input[@name='ctl00$ContentPrincipal$txtCodigo']    20
        Input Text    //input[@name='ctl00$ContentPrincipal$txtCodigo']    ${codigo_produto}

        # Botão 'Pesquisar'
        Wait Until Element Is Visible    //a[contains(@onclick,'AtualizarPesquisaProduto()')]    20
        Click Element    //a[contains(@onclick,'AtualizarPesquisaProduto()')]
        Sleep    2
        Capture Page Screenshot

        # Clique para marcar o produto da lista
        Wait Until Element Is Visible    //input[contains(@id,'ckbListProduto')]    20
        Click Element    //input[contains(@id,'ckbListProduto')]

        # Clique de confirmar 
        Wait Until Element Is Visible    //a[contains(@onclick,'ConfirmarProduto()')]    20
        Click Element    //a[contains(@onclick,'ConfirmarProduto()')]

        Sleep    4
        Switch Window
        Select Frame    //frame[contains(@name,'main')]
        Sleep    2
    END

    Switch Window
    Select Frame    //frame[contains(@name,'main')]
    Sleep    2

    Wait Until Element Is Visible    //input[@title='1,0000']    20
    ${elementos}    Get WebElements    //span[contains(@class,'k-icon k-i-arrow-n')]
    ${elemento}    Set Variable    ${elementos}[1]
    Double Click Element    ${elemento}
    Double Click Element    ${elemento}
    Double Click Element    ${elemento}
    Double Click Element    ${elemento}
    Double Click Element    ${elemento}
    Click Element    //span[contains(.,'Itens')]
    Sleep    4


    Wait Until Element Is Visible    //input[@title='1,0000']    20
    ${elementos3}    Get WebElements    //span[contains(@class,'k-icon k-i-arrow-n')]
    ${elemento3}    Set Variable    ${elementos3}[3]
    Double Click Element    ${elemento3}
    Double Click Element    ${elemento3}
    Double Click Element    ${elemento3}
    Double Click Element    ${elemento3}
    Double Click Element    ${elemento3}
    Click Element    //span[contains(.,'Itens')]
    Sleep    3
    Capture Page Screenshot

Então faço o encaminhamento do Recebimento
    Switch Window    
    Select Frame    //frame[contains(@name,'main')]

    # Clique para Encaminhar
    Wait Until Element Is Visible    //a[contains(.,'Encaminhar')]    20
    Click Element    //a[contains(.,'Encaminhar')]
    Sleep    3
