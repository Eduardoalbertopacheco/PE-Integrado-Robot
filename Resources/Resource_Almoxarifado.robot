
*** Settings ***

Documentation    Recursos, Ações e Elementos do Módulo de Almoxarifado
Library          SeleniumLibrary
Library          DateTime
Library           OperatingSystem

*** Variables ***

${NOME_ALMOX}    Novo_almoxarifado_Teste_Auto
@{CODIGOS_PRODUTOS}    1000241    1000268
${data_atual}    Get Current Date    result_format=%Y/%m/%d
${INPUT_REQ}    //*[@id="ctl00_ContentPrincipal_tbxNumero"]
${NUM_REQ}    ${EMPTY}
${NUM_TRANSF}    ${EMPTY}
${INPUT_TRANSF}    //*[@id="ctl00_ContentPrincipal_tbxNumero"]



*** Keywords ***
Definir Data Atual
    ${data_atual}     Get Current Date    result_format=%Y/%m/%d
    Set Test Variable    ${data_atual}


Então incluo a Máscara de Endereço
    Switch Window    
    Select Frame    //frame[contains(@name,'main')]

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
    Close Browser


Então incluo um requisitante
    Switch Window    
    Select Frame    //frame[contains(@name,'main')]

    # Aba Requisitantes
    Wait Until Element Is Visible    //span[contains(.,'Requisitantes')]    20
    Click Element    //span[contains(.,'Requisitantes')]

    # Clique em no Icone de Manutenção de Requisitantes
    Wait Until Element Is Visible    //img[@title='Manutenção de usuários requisitantes']    10
    Sleep    1
    Click Element    //img[@title='Manutenção de usuários requisitantes']
    Sleep    2

    # Clique de Incluir Requisitante
    Wait Until Element Is Visible    //a[@onclick='IncluirUsuarioRequisitante();']    10
    Sleep    1
    Click Element    //a[@onclick='IncluirUsuarioRequisitante();']
    Capture Page Screenshot

    Wait Until Element Is Visible    //input[contains(@name,'txtUsuario')]    10
    Sleep    1
    Input Text    //input[contains(@name,'txtUsuario')]    Gestor Almoxarifado

    Sleep    1
    Wait Until Element Is Visible    //a[@onclick='AtualizarPesquisaUsuario()']    10
    Sleep    1
    Click Element    //a[@onclick='AtualizarPesquisaUsuario()']
    Capture Page Screenshot

    Sleep    2
    Wait Until Element Is Visible    //input[@name='checkList']    10
    Sleep    1
    Click Element    //input[@name='checkList']

    Sleep    1
    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    10
    Capture Page Screenshot
    Sleep    1
    Click Element       //a[contains(.,'Confirmar')]
    Sleep    3
    Close Browser


Então incluo o Endereço de Estoque

    Switch Window    
    Select Frame    //frame[contains(@name,'main')]

    # Aba Endereço de Estoque - ENTRADA
    Wait Until Element Is Visible    //span[contains(.,'Endereço de estoque')]    20
    Sleep    1
    Click Element    //span[contains(.,'Endereço de estoque')]

    # Aba Endereço de Estoque - ESTOQUE
    Sleep    2
    Wait Until Element Is Visible    //a[@onclick='IncluirEnderecoEstoque();']    10
    Sleep    1
    Click Element    //a[@onclick='IncluirEnderecoEstoque();']

    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlMascara_listbox']    20
    Sleep    1
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlMascara_listbox']

    Wait Until Element Is Visible    //li[contains(.,'ESTOQUE - ENDEREÇO DE ESTOQUE')]    10
    Sleep    1
    Click Element    //li[contains(.,'ESTOQUE - ENDEREÇO DE ESTOQUE')]

    Wait Until Element Is Visible    //input[contains(@name,'tbxCodigoEndereco')]    10
    Input Text    //input[contains(@name,'tbxCodigoEndereco')]    ESTOQUE

    Wait Until Element Is Visible    //input[contains(@name,'tbxDescricao')]    10
    Input Text    //input[contains(@name,'tbxDescricao')]    ENDEREÇO DE ESTOQUE

    Wait Until Element Is Visible    //a[@onclick='SalvarEnderecoEstoqueDadosGerais(true);']    10
    Click Element    //a[@onclick='SalvarEnderecoEstoqueDadosGerais(true);']
    Sleep    3
    Capture Page Screenshot
    Close Browser


Então incluo o Endereço de Entrada

    Switch Window    
    Select Frame    //frame[contains(@name,'main')]

    # Aba Endereço de Estoque - ENTRADA
    Wait Until Element Is Visible    //span[contains(.,'Endereço de estoque')]    20
    Click Element    //span[contains(.,'Endereço de estoque')]

    # Clique do botão Incluir
    Wait Until Element Is Visible    //a[@onclick='IncluirEnderecoEstoque();']    10
    Sleep    1
    Click Element    //a[@onclick='IncluirEnderecoEstoque();']

    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlMascara_listbox']    20
    Sleep    1
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
    Close Browser

E acesso a lista de preparação
    Select Frame    xpath=//frame[contains(@name,'main')]

    # Clique em Almoxarifado
    Wait Until Element Is Visible    xpath=//div[@unselectable='on'][contains(.,'Almoxarifado')]    timeout=30s
    Click Element    xpath=//div[@unselectable='on'][contains(.,'Almoxarifado')]

    # Clique de Preparação
    Wait Until Element Is Visible    //td[@class='label'][contains(.,'Preparação')]    20
    Sleep    1
    Click Element    //td[@class='label'][contains(.,'Preparação')]
    Sleep    3
    Capture Page Screenshot


E acesso a lista de Guias de Remessas
    Select Frame    xpath=//frame[contains(@name,'main')]

    # Clique em Almoxarifado
    Wait Until Element Is Visible    xpath=//div[@unselectable='on'][contains(.,'Almoxarifado')]    timeout=30s
    Click Element    xpath=//div[@unselectable='on'][contains(.,'Almoxarifado')]

    # Mouse over em Guias de Remessas
    ${Guias_Remessas}    Get WebElement    //td[@class='label'][contains(.,'Guias de remessa')]
    Mouse Over    ${Guias_Remessas}

    # Clique de Guias de remessas do meu almoxarifado
    Wait Until Element Is Visible    //td[@class='label'][contains(.,'Guias de remessa do meu almoxarifado')]    20
    Sleep    1
    Click Element    //td[@class='label'][contains(.,'Guias de remessa do meu almoxarifado')]
    Sleep    3
    Capture Page Screenshot


E acesso a lista de Baixas
    Select Frame    xpath=//frame[contains(@name,'main')]

    # Clique em Almoxarifado
    Wait Until Element Is Visible    xpath=//div[@unselectable='on'][contains(.,'Almoxarifado')]    timeout=30s
    Click Element    xpath=//div[@unselectable='on'][contains(.,'Almoxarifado')]

    # Mouse over em movimentações
    ${Requisicoes}    Get WebElement    //td[@class='label'][contains(.,'Movimentações')]
    Mouse Over    ${Requisicoes}

    # Mouse over em Baixas
    ${Baixas}    Get WebElement    //td[@class='label'][contains(.,'Baixas')]
    Mouse Over    ${Baixas}

    # Clique de Lista de baixas
    Wait Until Element Is Visible    //td[@class='label'][contains(.,'Lista de baixas')]    20
    Sleep    1
    Click Element    //td[@class='label'][contains(.,'Lista de baixas')]
    Sleep    3
    Capture Page Screenshot


E acesso a lista de inventários
    Select Frame    xpath=//frame[contains(@name,'main')]

    # Clique em Almoxarifado
    Wait Until Element Is Visible    xpath=//div[@unselectable='on'][contains(.,'Almoxarifado')]    timeout=30s
    Click Element    xpath=//div[@unselectable='on'][contains(.,'Almoxarifado')]

    # Mouse over em inventários
    ${Invetarios}    Get WebElement    //td[@class='label'][contains(.,'Inventários')]
    Mouse Over    ${Invetarios}

    # Clique de Lista de Transferencias
    Wait Until Element Is Visible    //td[@class='label'][contains(.,'Lista de inventários')]    20
    Sleep    1
    Click Element    //td[@class='label'][contains(.,'Lista de inventários')]
    Sleep    3
    Capture Page Screenshot


E acesso a lista de Transferências
    Select Frame    xpath=//frame[contains(@name,'main')]

    # Clique em Almoxarifado
    Wait Until Element Is Visible    xpath=//div[@unselectable='on'][contains(.,'Almoxarifado')]    timeout=30s
    Click Element    xpath=//div[@unselectable='on'][contains(.,'Almoxarifado')]

    # Mouse over em movimentações
    ${Requisicoes}    Get WebElement    //td[@class='label'][contains(.,'Movimentações')]
    Mouse Over    ${Requisicoes}

    # Mouse over em transferencia
    ${Transferencia}    Get WebElement    //td[@class='label'][contains(.,'Transferências')]
    Mouse Over    ${Transferencia}

    # Clique de Lista de Transferencias
    Wait Until Element Is Visible    //td[@class='label'][contains(.,'Lista de transferências')]    20
    Sleep    1
    Click Element    //td[@class='label'][contains(.,'Lista de transferências')]
    Sleep    3
    Capture Page Screenshot


E acesso a lista de requisições
    Select Frame    xpath=//frame[contains(@name,'main')]

    # Clique em Almoxarifado
    Wait Until Element Is Visible    xpath=//div[@unselectable='on'][contains(.,'Almoxarifado')]    timeout=30s
    Click Element    xpath=//div[@unselectable='on'][contains(.,'Almoxarifado')]

    # Mouse over em requisições
    ${Requisicoes}    Get WebElement    //td[@class='label'][contains(.,'Requisições')]
    Mouse Over    ${Requisicoes}

    # Clique de Lista de requisições
    Wait Until Element Is Visible    //td[@class='label'][contains(.,'Lista de requisições de material')]    20
    Sleep    1
    Click Element    //td[@class='label'][contains(.,'Lista de requisições de material')]
    Sleep    3
    Capture Page Screenshot


E acesso a lista de Almoxarifados
    Select Frame    xpath=//frame[contains(@name,'main')]

    # Clique em Almoxarifado
    Wait Until Element Is Visible    xpath=//div[@unselectable='on'][contains(.,'Almoxarifado')]    timeout=30s
    Click Element    xpath=//div[@unselectable='on'][contains(.,'Almoxarifado')]


    # Clique em Lista de Almoxarifados
    Wait Until Element Is Visible    //td[@class='label'][contains(.,'Lista de almoxarifados')]    timeout=30s
    Sleep    1
    Click Element    //td[@class='label'][contains(.,'Lista de almoxarifados')]
    Sleep    3
    Capture Page Screenshot


Então Adiciono um novo almoxarifado
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


E vejo a Auditoria do almoxarifado
    Sleep    2
    Wait Until Element Is Visible    //span[contains(.,'Auditoria')]    15
    Click Element    //span[contains(.,'Auditoria')]
    Sleep       2
    Capture Page Screenshot
    Close Browser


E pesquiso pelo Almoxarifado

    Select Frame    //iframe[contains(@name,'frmConteudo')]

    Wait Until Element Is Visible
    ...    //input[contains(@name,'ctl00') and contains(@name,'edtCampo_2')]    15
    Input Text
    ...    //input[contains(@name,'ctl00') and contains(@name,'edtCampo_2')]    ${NOME_ALMOX}
    Sleep   2

    Wait Until Element Is Visible    //a[contains(.,'Pesquisar')]    15
    Click Element    //a[contains(.,'Pesquisar')]
    Sleep    2
    Capture Page Screenshot


E clico no Almoxarifado da lista
 
    Wait Until Element Is Visible     (//table[@id="ctl00_ContentPrincipal_dtgPesquisa"]//tr[td/a[text()='${NOME_ALMOX}']]//td[3]//a)[last()]
    Click Element    (//table[@id="ctl00_ContentPrincipal_dtgPesquisa"]//tr[td/a[text()='${NOME_ALMOX}']]//td[3]//a)[last()]


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
    Sleep    3
    Capture Page Screenshot


Então incluo um novo Recebimento    

    [Arguments]    ${date}
    ${year}        Evaluate    '${date}'.split('/')[0]
    ${month}       Evaluate    int('${date}'.split('/')[1])
    ${day}         Evaluate    int('${date}'.split('/')[2])

    ${month}       Evaluate    int('${date}'.split('/')[1]) - 1
    ${DATA_VALUE}  Set Variable    ${year}/${month}/${day}


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

    Wait Until Element Is Visible    (//input[contains(@id,'rbList')])[last()]    20
    Click Element    (//input[contains(@id,'rbList')])[last()] 
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

    # Data da nota fiscal
    ${Icones}    Get WebElements    //span[@class='k-icon k-i-calendar']
    ${Icone2}    Set Variable    ${Icones}[1]
    Wait Until Element Is Visible    ${Icone2}
    Sleep    1
    Click Element    ${Icone2}
    
    Sleep    1
    
    ${data_xpath}  Set Variable    xpath=//a[@data-value='${DATA_VALUE}']
    
    Wait Until Element Is Visible    ${data_xpath}
    Sleep    1
    Click Element    ${data_xpath}
    Capture Page Screenshot

 
    Wait Until Element Is Visible    //input[@id='tbxNumeroDocumento_1']    20
    Input Text    //input[@id='tbxNumeroDocumento_1']    123456
    Wait Until Element Is Visible    //input[contains(@id,'tbxSerieDocumento_1')]    20
    Input Text    //input[contains(@id,'tbxSerieDocumento_1')]    123456

    ${Icones1}    Get WebElements    //span[@class='k-icon k-i-calendar']
    ${Icone3}    Set Variable    ${Icones1}[2]
    Wait Until Element Is Visible    ${Icone3}
    Sleep    1
    Click Element    ${Icone3}


    ${data_xpath}  Set Variable    xpath=//a[@data-value='${DATA_VALUE}']
    
    Wait Until Element Is Visible    ${data_xpath}
    Sleep    2
    Click Element    ${data_xpath}
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
    Close Browser


Então faço o encaminhamento do Recebimento
    Switch Window    
    Select Frame    //frame[contains(@name,'main')]

    # Clique para Encaminhar
    Wait Until Element Is Visible    //a[contains(.,'Encaminhar')]    20
    Click Element    //a[contains(.,'Encaminhar')]
    Sleep    3
    Close Browser


E clico no registro em Recebimento da lista
    Select Frame    //iframe[@name='frmConteudo']
    Wait Until Element Is Visible    //table[@id='ctl00_ContentPrincipal_dtgPesquisa']//tr[td[text()='${NOME_ALMOX}'] and td[8]//img[contains(@title,'Em recebimento')]]//td[1]//a   20
    Click Element    //table[@id='ctl00_ContentPrincipal_dtgPesquisa']//tr[td[text()='${NOME_ALMOX}'] and td[8]//img[contains(@title,'Em recebimento')]]//td[1]//a
    Capture Page Screenshot


Então realizo o atestado técnico
    Switch Window    
    Select Frame    //frame[contains(@name,'main')]
    Select Frame    //iframe[@class='ifrmConteudo']

    # Realizar atestado técnico
    Wait Until Element Is Visible    css=#ckbList_Itens    10
    ${Elementos}    Get WebElements    css=#ckbList_Itens
    ${Elemento}    Set Variable    ${Elementos}[0]
    Click Element     ${Elemento}
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[contains(.,'Realizar atesto técnico')]    10
    Click Element    //a[contains(.,'Realizar atesto técnico')]

    Switch Window
    Select Frame    //frame[contains(@name,'main')]

    # Realizar Atestado Técnico
    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlSituacao_listbox']    10
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlSituacao_listbox']
    Sleep    1
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Atesto técnico aprovado')]    10
    Sleep    1
    Click Element    //li[@tabindex='-1'][contains(.,'Atesto técnico aprovado')]

    Wait Until Element Is Visible    //a[contains(.,'Salvar e fechar')]    10
    Click Element    //a[contains(.,'Salvar e fechar')]
    Sleep    3
    Close Browser


Então incluo a nota fiscal
    Switch Window
    Select Frame    //frame[contains(@name,'main')]
    Select Frame    //iframe[@class='ifrmConteudo']

    # Incluir notas Ficais
    Sleep    2
    Wait Until Element Is Visible    //span[contains(.,'Notas fiscais')]    10
    Click Element    //span[contains(.,'Notas fiscais')]

    Switch Window
    Select Frame    //frame[contains(@name,'main')]
   
    # Clique de Anexo
    Wait Until Element Is Visible    //img[@alt='Anexo']    10
    Click Element    //img[@alt='Anexo']
    Sleep    2

    Switch Window
    Select Frame    //frame[contains(@name,'main')]
    Select Frame    //iframe[contains(@name,'ifrAnexo')]
    Sleep    2
    Wait Until Element Is Visible    css=input[type="file"]    10
    Choose File    css=input[type="file"]    ${EXECDIR}\\test\\Fixtures\\Mod03-Locators.pdf

    Click Element    //input[@value='Anexar']
    Capture Page Screenshot
    Sleep    2
    Close Browser


Então respondo a avaliação de conformidade

    Switch Window
    Select Frame    //frame[contains(@name,'main')]
    Select Frame    //iframe[@class='ifrmConteudo']

    Sleep    2
    Wait Until Element Is Visible    //span[contains(.,'Responder avaliação de conformidade')]    20
    Click Element    //span[contains(.,'Responder avaliação de conformidade')]

    Switch Window
    Sleep    1
    Select Frame    //frame[contains(@name,'main')]
    Sleep    1
    Select Frame    //iframe[@class='ifrmConteudo']
    Sleep    1
    Switch Window    NEW

    Sleep    1
    Scroll Element Into View    (//input[@value='9'])[1]
    Click Element    (//input[@value='9'])[1]

    Sleep    1
    Scroll Element Into View    //input[@value='33']
    Click Element    //input[@value='33']

    Sleep    1
    Scroll Element Into View    (//input[@value='11'])[1]
    Click Element    (//input[@value='11'])[1]

    Sleep    1
    Scroll Element Into View    (//input[@value='13'])[1]
    Click Element    (//input[@value='13'])[1]

    Sleep    1
    Scroll Element Into View    //input[@value='15']
    Click Element    //input[@value='15']

    Sleep    1
    Scroll Element Into View    //input[@value='17']
    Click Element    //input[@value='17']

    Sleep    1
    Scroll Element Into View    //input[@value='19']
    Click Element    //input[@value='19']

    Sleep    1
    Scroll Element Into View    //input[@value='21']
    Click Element    //input[@value='21']

    Sleep    1
    Scroll Element Into View    //input[@value='23']
    Click Element    //input[@value='23']

    Sleep    1
    Scroll Element Into View    //input[@value='25']
    Click Element    //input[@value='25']

    Sleep    1
    Scroll Element Into View    //input[@value='27']
    Click Element    //input[@value='27']

    Sleep    1
    Scroll Element Into View    //input[@value='29']
    Click Element    //input[@value='29']

    Sleep    1
    Scroll Element Into View    //input[@value='31']
    Click Element    //input[@value='31']
    Capture Page Screenshot

    Wait Until Element Is Visible    //input[@value='Salvar']    10
    Sleep    1
    Click Element    //input[@value='Salvar']
    Sleep    1
    Handle Alert    ACCEPT
    Sleep    3

    Wait Until Element Is Visible    //input[@value='Confirmar']    10
    Sleep    1
    Click Element    //input[@value='Confirmar']
    Sleep    1
    Handle Alert    ACCEPT
    Close Browser


Então aprovo o recebimento provisório
    Switch Window
    Select Frame    //frame[contains(@name,'main')]
    Select Frame    //iframe[@class='ifrmConteudo']

    Wait Until Element Is Visible    //a[@id='ctl00_ContentPainelSuperior_btnAprovar']    10
    Click Element    //a[@id='ctl00_ContentPainelSuperior_btnAprovar']
    Sleep    1
    Wait Until Element Is Visible    //a[contains(.,'Sim')]    10
    Capture Page Screenshot
    Click Element    //a[contains(.,'Sim')]
    Sleep    3
    Close Browser


Então aprovo o recebimento definitivo
    Switch Window
    Select Frame    //frame[contains(@name,'main')]
    Select Frame    //iframe[@class='ifrmConteudo']

    Wait Until Element Is Visible    //a[contains(@id,'btnAprovarBemConsumo')]    10
    Click Element    //a[contains(@id,'btnAprovarBemConsumo')]
    Sleep    1
    Wait Until Element Is Visible    //a[contains(.,'Sim')]    10
    Capture Page Screenshot
    Click Element    //a[contains(.,'Sim')]
    Sleep    3
    Close Browser


E seleciono no filtro exibir todos os produtos

    Switch Window    
    Select Frame    //frame[contains(@name,'main')]
    Select Frame    //iframe[@name='frmConteudo']

    Wait Until Element Is Visible    //span[contains(@aria-owns,'ctl00_ddlVisao_listbox')]    10
    Sleep    1
    Click Element    //span[contains(@aria-owns,'ctl00_ddlVisao_listbox')]

    Sleep    1
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Todos os produtos')]    10
    Sleep    2
    Click Element    //li[@tabindex='-1'][contains(.,'Todos os produtos')]

    Wait Until Element Is Visible    //a[contains(.,'Pesquisar')]    10
    Sleep    2
    Click Element    //a[contains(.,'Pesquisar')]


Então movimento os itens para estoque

    # mover itens 1 para Estoque
    FOR    ${i}    IN RANGE    2

        Switch Window    
        Select Frame    //frame[contains(@name,'main')]
        Select Frame    //iframe[contains(@name,'frmConteudo')]
        Sleep    2

        ${Elementos}    Get WebElements    //img[@alt='Endereços de estoque']
        ${elemento}    Set Variable     ${Elementos}[${i}]
        Sleep    2
        Click Element    ${elemento}

        Switch Window    
        Select Frame    //frame[contains(@name,'main')]
    
        Wait Until Element Is Visible    //input[@scdenderecoestoque='ENTRADA']    10
        Click Element    //input[@scdenderecoestoque='ENTRADA']

        Wait Until Element Is Visible    //span[contains(@class,'k-icon k-i-arrow-n')]    10
        Double Click Element    //span[contains(@class,'k-icon k-i-arrow-n')]
        Double Click Element    //span[contains(@class,'k-icon k-i-arrow-n')]
        Capture Page Screenshot

        Wait Until Element Is Visible    //a[contains(.,'Movimentar')]    10
        Sleep    2
        Click Element    //a[contains(.,'Movimentar')]

        Wait Until Element Is Visible    //input[@description='ESTOQUE']    10
        Sleep    2
        Click Element    //input[@description='ESTOQUE']

        Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    10
        Sleep    2
        Click Element    //a[contains(.,'Confirmar')]

        Wait Until Element Is Visible    //a[contains(.,'Sim')]    10
        Sleep    2
        Capture Page Screenshot
        Click Element    //a[contains(.,'Sim')]
        Sleep    3

        Switch Window    
        Select Frame    //frame[contains(@name,'main')]
        Sleep    2

        Wait Until Element Is Visible    //a[contains(.,'Fechar')]    10
        Click Element    //a[contains(.,'Fechar')]
        Sleep    2
    END


Então crio um novo Inventário
    Select Frame    //iframe[@name='frmConteudo']
    Wait Until Element Is Visible    //a[contains(.,'Incluir')]    30
    Click Element    //a[contains(.,'Incluir')]
    Sleep    2

    Switch Window    
    Select Frame    //frame[contains(@name,'main')]
    Capture Page Screenshot


    # Tipo de Inventário - Eventual
    Wait Until Element Is Visible    //span[contains(@aria-owns,'ctl00_ContentPrincipal_ddlTipo_listbox')]    20
    Click Element    //span[contains(@aria-owns,'ctl00_ContentPrincipal_ddlTipo_listbox')]
    Sleep    2
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Eventual')]    10
    Sleep    1
    Click Element    //li[@tabindex='-1'][contains(.,'Eventual')]
    Sleep    1


    # Almoxarifado
    Wait Until Element Is Visible    //a[@onclick='AbrirJanelaPesquisarAlmoxarifado();']    20
    Sleep    1
    Click Element    //a[@onclick='AbrirJanelaPesquisarAlmoxarifado();']
    Sleep    2

    Wait Until Element Is Visible    //input[@name='ctl00$ContentPrincipal$tbxDsAlmoxarifado']    20
    Input Text    //input[@name='ctl00$ContentPrincipal$tbxDsAlmoxarifado']    ${NOME_ALMOX}
    Click Element    //a[contains(.,'Pesquisar')]
    Sleep    2

    Wait Until Element Is Visible    (//input[contains(@id,'rbList')])[last()]    20
    Click Element    (//input[contains(@id,'rbList')])[last()] 
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    20
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    2

    #Forma de coleta
    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlFormaColeta_listbox']    20
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlFormaColeta_listbox']
    Sleep    1

    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Manual')]    20
    Click Element    //li[@tabindex='-1'][contains(.,'Manual')]

    Sleep    1
    Wait Until Element Is Visible    //input[contains(@name,'tbxDescricao')]    20
    Input Text    //input[contains(@name,'tbxDescricao')]    Inventário Eventual Manual

    # Data inicio
   ${hora_atual+05min}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(minutes=5)).strftime('%d-%m-%Y %H:%M:%S')    datetime
    Log    ${hora_atual+05min}

    # Data final
    ${hora_atual+20min}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(minutes=20)).strftime('%d-%m-%Y %H:%M:%S')    datetime
    Log    ${hora_atual+20min}


    Wait Until Element Is Visible    id=ctl00_ContentPrincipal_tbxDtInicio
    Click Element    id=ctl00_ContentPrincipal_tbxDtInicio
    Sleep    2
    Set Focus To Element    id=ctl00_ContentPrincipal_tbxDtInicio
    Execute JavaScript    document.getElementById("ctl00_ContentPrincipal_tbxDtInicio").value="${hora_atual+05min}";


    Sleep    2
    Wait Until Element Is Visible    id=ctl00_ContentPrincipal_tbxDtTerminoPrevisto
    Click Element    id=ctl00_ContentPrincipal_tbxDtTerminoPrevisto
    Sleep    2
    Set Focus To Element    id=ctl00_ContentPrincipal_tbxDtTerminoPrevisto
    Execute JavaScript    document.getElementById("ctl00_ContentPrincipal_tbxDtTerminoPrevisto").value="${hora_atual+20min}";
    Sleep    2

    Wait Until Element Is Visible    //input[contains(@name,'ckbIncluirTodos')]    20
    Click Element    //input[contains(@name,'ckbIncluirTodos')]
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[contains(@onclick,'SalvarDadosGeraisInventario(false);')]    20
    Click Element    //a[contains(@onclick,'SalvarDadosGeraisInventario(false);')]
    Sleep    3

    # Esperar até que o campo de input tenha um valor preenchido
    Wait Until Keyword Succeeds    10 times    2 seconds    Valor Do Input INVENT Deve Ser Preenchido

    # Capturar o valor do campo depois que ele for preenchido
    ${NUM_INVENT}    Get Element Attribute    ${INPUT_TRANSF}    value


Valor Do Input INVENT Deve Ser Preenchido
    ${NUM_INVENT}    Get Element Attribute    ${INPUT_TRANSF}     value
    Should Not Be Empty    ${NUM_INVENT}
    
    # Salvar o valor em um arquivo de texto
    Create File    ${EXECDIR}/test/processos/num_inventario.txt    ${NUM_INVENT}
    Sleep    2
    

Então incluo uma nova Transferências
    Select Frame    //iframe[@name='frmConteudo']
    Wait Until Element Is Visible    //a[contains(.,'Incluir')]    30
    Click Element    //a[contains(.,'Incluir')]
    Sleep    2

    Switch Window    
    Select Frame    //frame[contains(@name,'main')]
    Capture Page Screenshot


    # Tipo de movimentação - Interna
    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlTipoMovimentacao_listbox']    20
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlTipoMovimentacao_listbox']
    Sleep    2
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Requisição de transferência interna de material')]    10
    Sleep    1
    Click Element    //li[@tabindex='-1'][contains(.,'Requisição de transferência interna de material')]
    Sleep    1


    # Almoxarifado Origem
    Wait Until Element Is Visible    //a[contains(@onclick,'AbrirJanelaPesquisarAlmoxarifado(true);')]    20
    Sleep    1
    Click Element    //a[contains(@onclick,'AbrirJanelaPesquisarAlmoxarifado(true);')]
    Sleep    2

    Wait Until Element Is Visible    //input[@name='ctl00$ContentPrincipal$tbxDsAlmoxarifado']    20
    Input Text    //input[@name='ctl00$ContentPrincipal$tbxDsAlmoxarifado']    ${NOME_ALMOX}
    Click Element    //a[contains(.,'Pesquisar')]
    Sleep    2

    Wait Until Element Is Visible    (//input[contains(@id,'rbList')])[last()]    20
    Click Element    (//input[contains(@id,'rbList')])[last()] 
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    20
    Click Element    //a[contains(.,'Confirmar')]


    # Unidade Gestora Destino
    Sleep    1
    Wait Until Element Is Visible    //a[contains(@onclick,'AbrirJanelaPesquisarUnidadeGestora(false);')]
    Sleep    1
    Click Element    //a[contains(@onclick,'AbrirJanelaPesquisarUnidadeGestora(false);')]
    Sleep    1
    Wait Until Element Is Visible    //input[contains(@name,'txtNome')]    15
    Input Text    //input[contains(@name,'txtNome')]    SECRETARIA DE ADMINISTRAÇÃO
    Sleep    1
    Wait Until Element Is Visible    //a[contains(.,'Pesquisar')]    10
    Sleep    1
    Click Element    //a[contains(.,'Pesquisar')]
    Sleep    1
    Wait Until Element Is Visible    //input[@value='3|SECRETARIA DE ADMINISTRAÇÃO|1|0']    10
    Click Element    //input[@value='3|SECRETARIA DE ADMINISTRAÇÃO|1|0']

    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    10
    Click Element    //a[contains(.,'Confirmar')]


    # Almoxarifado de Destino
    Sleep    2
    Wait Until Element Is Visible    //input[contains(@name,'ctl00$ContentPrincipal$autAlmoxarifadoDestino')]
    Sleep    1
    Scroll Element Into View    //input[contains(@name,'ctl00$ContentPrincipal$autAlmoxarifadoDestino')]
    Sleep    1
    Input Text    //input[contains(@name,'ctl00$ContentPrincipal$autAlmoxarifadoDestino')]    SAD
    Sleep    2
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'ALMOXARIFADO - SAD')]
    Sleep    1
    Click Element    //li[@tabindex='-1'][contains(.,'ALMOXARIFADO - SAD')]

    #Endereço
    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlEnderecoEntrega_listbox']    15
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlEnderecoEntrega_listbox']
    Sleep    1
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'AVENIDA ANTONIO DE GOES, 194, PINA - RECIFE - PE - BRASIL')]    15
    Click Element    //li[@tabindex='-1'][contains(.,'AVENIDA ANTONIO DE GOES, 194, PINA - RECIFE - PE - BRASIL')]
    Sleep    1
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[@onclick='SalvarRequisicao(false);']    15
    Click Element    //a[@onclick='SalvarRequisicao(false);']
    Sleep    4

    # Esperar até que o campo de input tenha um valor preenchido
    Wait Until Keyword Succeeds    10 times    2 seconds    Valor Do Input TRANSF Deve Ser Preenchido

    # Capturar o valor do campo depois que ele for preenchido
    ${NUM_TRANSF}    Get Element Attribute    ${INPUT_TRANSF}    value
    Log    O valor do input é: ${NUM_TRANSF} 


Valor Do Input TRANSF Deve Ser Preenchido
    ${NUM_TRANSF}    Get Element Attribute    ${INPUT_TRANSF}     value
    Should Not Be Empty    ${NUM_TRANSF}
    Log    O valor do input é: ${NUM_TRANSF}

    # Salvar o valor em um arquivo de texto
    Create File    ${EXECDIR}/test/processos/num_transferencia.txt    ${NUM_TRANSF}


Então incluo uma nova riquisição
    Select Frame    //iframe[@name='frmConteudo']
    Wait Until Element Is Visible    //a[contains(.,'Incluir')]    30
    Click Element    //a[contains(.,'Incluir')]
    Sleep    2

    Switch Window    
    Select Frame    //frame[contains(@name,'main')]
    Capture Page Screenshot

    # Tipo de movimentação
    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlTipoMovimentacao_listbox']    20
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlTipoMovimentacao_listbox']
    Sleep    2
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Requisição de material de consumo')]    10
    Sleep    1
    Click Element    //li[@tabindex='-1'][contains(.,'Requisição de material de consumo')]
    Sleep    1


    # Almoxarifado
    Wait Until Element Is Visible    //a[contains(@onclick,'AbrirJanelaPesquisarAlmoxarifado();')]    20
    Sleep    1
    Click Element    //a[contains(@onclick,'AbrirJanelaPesquisarAlmoxarifado();')]
    Sleep    2

    Wait Until Element Is Visible    //input[@name='ctl00$ContentPrincipal$tbxDsAlmoxarifado']    20
    Input Text    //input[@name='ctl00$ContentPrincipal$tbxDsAlmoxarifado']    ${NOME_ALMOX}
    Click Element    //a[contains(.,'Pesquisar')]
    Sleep    2

    Wait Until Element Is Visible    (//input[contains(@id,'rbList')])[last()]    20
    Click Element    (//input[contains(@id,'rbList')])[last()] 
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    20
    Click Element    //a[contains(.,'Confirmar')]

    Wait Until Element Is Visible    //input[contains(@name,'autUnidadeAdministrativa')]    20
    Input Text    //input[contains(@name,'autUnidadeAdministrativa')]    SECRETARIA DE ADMINISTRAÇÃO
    Sleep    3
    Wait Until Element Is Visible    //li[contains(.,'[P]-SECRETARIA DE ADMINISTRAÇÃO')]    20
    Sleep    1
    Click Element    //li[contains(.,'[P]-SECRETARIA DE ADMINISTRAÇÃO')]
    Sleep    1

    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlEnderecoEntrega_listbox']    20
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlEnderecoEntrega_listbox']
    Sleep    2
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'AVENIDA ANTONIO DE GOES, 194, PINA - RECIFE - PE - BRASIL')]    10
    Click Element    //li[@tabindex='-1'][contains(.,'AVENIDA ANTONIO DE GOES, 194, PINA - RECIFE - PE - BRASIL')]
    Sleep    1
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[@id='ctl00_ContentButtom_btnSalvar']    10
    Click Element    //a[@id='ctl00_ContentButtom_btnSalvar']
    Sleep    3

  
  # Esperar até que o campo de input tenha um valor preenchido
    Wait Until Keyword Succeeds    10 times    2 seconds    Valor Do Input REQ Deve Ser Preenchido

    # Capturar o valor do campo depois que ele for preenchido
    ${NUM_REQ}    Get Element Attribute    ${INPUT_REQ}    value
    Log    O valor do input é: ${NUM_REQ} 


Valor Do Input REQ Deve Ser Preenchido
    ${NUM_REQ}    Get Element Attribute    ${INPUT_REQ}     value
    Should Not Be Empty    ${NUM_REQ}
    Log    O valor do input é: ${NUM_REQ}

    # Salvar o valor em um arquivo de texto
    Create File    ${EXECDIR}/test/processos/num_requisicao.txt    ${NUM_REQ}



E pesquiso pela Requisição
    Select Frame    //iframe[@name='frmConteudo']

    ${NUM_REQ}    Get File    ${EXECDIR}/test/numero_requisicao.txt
    Log    O valor lido é: ${NUM_REQ}

    Wait Until Element Is Visible    //input[@name='ctl00$oPesquisaAvancada$dtgPesquisaAvancadaControle$ctl01$edtCampo_2']    30
    Input Text        //input[@name='ctl00$oPesquisaAvancada$dtgPesquisaAvancadaControle$ctl01$edtCampo_2']    ${NUM_REQ}
    Sleep    2
    Wait Until Element Is Visible    //a[contains(.,'Pesquisar')]    15
    Click Element    //a[contains(.,'Pesquisar')]
    Sleep    2
    Capture Page Screenshot


E clico na requisição da lista
    ${NUM_REQ}    Get File    ${EXECDIR}/test/numero_requisicao.txt
    Wait Until Element Is Visible    //a[@class='link-action'][contains(.,'${NUM_REQ}')]    15
    Sleep    1
    Click Element    //a[@class='link-action'][contains(.,'${NUM_REQ}')]
    Sleep    2

Então incluo os itens para Requisição
    Switch Window    
    Select Frame    //frame[contains(@name,'main')]

    # Clique em Itens
    Wait Until Element Is Visible    //span[contains(.,'Itens')]    15
    Click Element    //span[contains(.,'Itens')]
    Sleep    1
    
    # Clique em Incluir dentro da aba 'Itens'
    Wait Until Element Is Visible    //a[contains(.,'Incluir')]    10
    Click Element    //a[contains(.,'Incluir')]
    Sleep    1

    Switch Window    
    Select Frame    //frame[contains(@name,'main')]

   # Clique para marcar todos
   Wait Until Element Is Visible    //input[contains(@name,'ckbTodosPesquisa')]    10
   Click Element    //input[contains(@name,'ckbTodosPesquisa')]
   Capture Page Screenshot

    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    10
    Click Element    //a[contains(.,'Confirmar')]
    sleep    10

    Switch Window
    Select Frame    //frame[contains(@name,'main')]

    Sleep    2
    ${elementos1}    Get WebElements    //span[contains(@class,'k-icon k-i-arrow-n')]
    ${elemento1}    Set Variable    ${elementos1}[0]
    Double Click Element    ${elemento1}
    Double Click Element    ${elemento1}
    Click Element    //span[contains(.,'Itens')]
    Sleep    4

    ${elementos2}    Get WebElements    //span[contains(@class,'k-icon k-i-arrow-n')]
    ${elemento1}    Set Variable    ${elementos2}[1]
    Double Click Element    ${elemento1}
    Double Click Element    ${elemento1}
    Double Click Element    ${elemento1}
    Click Element    //span[contains(.,'Itens')]
    Sleep    4
    Capture Page Screenshot
    Close Browser


Então Encaminho a Requisição
    Switch Window    
    Select Frame    //frame[contains(@name,'main')]

    Capture Page Screenshot
    Wait Until Element Is Visible    //a[contains(.,'Encaminhar')]    10
    Click Element    //a[contains(.,'Encaminhar')]
    Sleep    3
    Close Browser


Então encaminho para preparação
    Switch Window    
    Select Frame    //frame[contains(@name,'main')]
    Select Frame    //iframe[contains(@name,'frmConteudo')]

    # Marcar todos os itens
    Wait Until Element Is Visible    //input[@title='Selecionar todos']    10
    Click Element    //input[@title='Selecionar todos']

    Capture Page Screenshot
    Wait Until Element Is Visible    //a[@onclick='Encaminhar()']    10
    Click Element    //a[@onclick='Encaminhar()']
    Sleep    6
    Capture Page Screenshot

    # Clique para não acessar a tela de preparação
    Wait Until Element Is Visible    //a[contains(.,'Não')]    15
    Click Element    //a[contains(.,'Não')]


E acesso a tela de Guias de Remessa
    Select Frame    xpath=//frame[contains(@name,'main')]

    # Clique em Almoxarifado
    Wait Until Element Is Visible    xpath=//div[@unselectable='on'][contains(.,'Almoxarifado')]    timeout=30s
    Click Element    xpath=//div[@unselectable='on'][contains(.,'Almoxarifado')]


    # Clique de Preparação
    Wait Until Element Is Visible    //td[@class='label'][contains(.,'Guias de remessa')]    20
    Sleep    1

    #Mouse over em Guia de remessa
    Mouse Over    //td[@class='label'][contains(.,'Guias de remessa')]
    Sleep    1

    # Clique de Guias de remessa do meu almoxarifadp
    Wait Until Element Is Visible    //td[@class='label'][contains(.,'Guias de remessa do meu almoxarifado')]    15
    Click Element    //td[@class='label'][contains(.,'Guias de remessa do meu almoxarifado')]
    Sleep    3
    Capture Page Screenshot


E acesso a tela de preparação
    Select Frame    xpath=//frame[contains(@name,'main')]

    # Clique em Almoxarifado
    Wait Until Element Is Visible    xpath=//div[@unselectable='on'][contains(.,'Almoxarifado')]    timeout=30s
    Click Element    xpath=//div[@unselectable='on'][contains(.,'Almoxarifado')]


    # Clique de Preparação
    Wait Until Element Is Visible    //td[@class='label'][contains(.,'Preparação')]    20
    Sleep    1
    Click Element    //td[@class='label'][contains(.,'Preparação')]
    Sleep    3
    Capture Page Screenshot


E pesquiso pela Requisição dos Itens
   Select Frame    //iframe[@name='frmConteudo']

    ${NUM_REQ}    Get File    ${EXECDIR}/test/numero_requisicao.txt
    Log    O valor lido é: ${NUM_REQ}

    Wait Until Element Is Visible    //input[@name='ctl00$oPesquisaAvancada$dtgPesquisaAvancadaControle$ctl02$edtCampo_3']    30
    Input Text        //input[@name='ctl00$oPesquisaAvancada$dtgPesquisaAvancadaControle$ctl02$edtCampo_3']     ${NUM_REQ}
    Sleep    2
    Wait Until Element Is Visible    //a[contains(.,'Pesquisar')]    15
    Click Element    //a[contains(.,'Pesquisar')]
    Sleep    2
    Capture Page Screenshot

Então encaminho para Expedição
    Switch Window    
    Select Frame    //frame[contains(@name,'main')]
    Select Frame    //iframe[contains(@name,'frmConteudo')]

    # Clique de selecionar todos
    Wait Until Element Is Visible    //input[@title='Selecionar todos']    20
    Click Element    //input[@title='Selecionar todos']
    Capture Page Screenshot

    # Clique de encaminhar para expedição
    Wait Until Element Is Visible    //a[contains(.,'Encaminhar itens para a expedição')]    20
    Click Element    //a[contains(.,'Encaminhar itens para a expedição')]

    # Clique sim no popup

    Wait Until Element Is Visible    //a[contains(.,'Sim')]    10
    Capture Page Screenshot
    Click Element    //a[contains(.,'Sim')]
    Sleep    3

    # Clique não no popup
    Wait Until Element Is Visible    //a[contains(.,'Não')]    10
    Capture Page Screenshot
    Click Element    //a[contains(.,'Não')]

Então aprovo a Guia de Remessa
    Switch Window    
    Select Frame    //frame[contains(@name,'main')]
    Select Frame    //iframe[contains(@name,'frmConteudo')]

    Wait Until Element Is Visible    xpath=(//input[contains(@id,'ckbList_nCdGuia')])[last()]
    Click Element    xpath=(//input[contains(@id,'ckbList_nCdGuia')])[last()]
    Sleep    1

    Wait Until Element Is Visible    //a[contains(.,'Aprovar')]    10
    Click Element    //a[contains(.,'Aprovar')]
    Sleep    1
    Capture Page Screenshot
    Wait Until Element Is Visible    //a[contains(.,'Sim')]    10
    Click Element    //a[contains(.,'Sim')]
    Sleep    3
    Close Browser

E pesquiso pela BX
    Select Frame    //iframe[@name='frmConteudo']

    ${NUM_BAIXA}    Get File    ${EXECDIR}/test/numero_baixa.txt

    Wait Until Element Is Visible    //input[@name='ctl00$oPesquisaAvancada$dtgPesquisaAvancadaControle$ctl02$edtCampo_3']    30
    Input Text        //input[@name='ctl00$oPesquisaAvancada$dtgPesquisaAvancadaControle$ctl02$edtCampo_3']    ${NUM_BAIXA}
    Sleep    2
    Wait Until Element Is Visible    //a[contains(.,'Pesquisar')]    15
    Click Element    //a[contains(.,'Pesquisar')]
    Sleep    2
    Capture Page Screenshot



E Pesquiso pela TRN
    Select Frame    //iframe[@name='frmConteudo']

    ${NUM_TRANSF}    Get File    ${EXECDIR}/test/numero_transferencia.txt
    Log    O valor lido é: ${NUM_TRANSF}

    Wait Until Element Is Visible    //input[@name='ctl00$oPesquisaAvancada$dtgPesquisaAvancadaControle$ctl02$edtCampo_3']    30
    Input Text        //input[@name='ctl00$oPesquisaAvancada$dtgPesquisaAvancadaControle$ctl02$edtCampo_3']    ${NUM_TRANSF}
    Sleep    2
    Wait Until Element Is Visible    //a[contains(.,'Pesquisar')]    15
    Click Element    //a[contains(.,'Pesquisar')]
    Sleep    2
    Capture Page Screenshot


E pesquiso pela baixa
    Select Frame    //iframe[@name='frmConteudo']

    ${NUM_BAIXA}    Get File    ${EXECDIR}/test/processos/num_baixa.txt
  
    Wait Until Element Is Visible    //input[@name='ctl00$oPesquisaAvancada$dtgPesquisaAvancadaControle$ctl01$edtCampo_2']    30
    Input Text        //input[@name='ctl00$oPesquisaAvancada$dtgPesquisaAvancadaControle$ctl01$edtCampo_2']    ${NUM_BAIXA}
    Sleep    2
    Wait Until Element Is Visible    //a[contains(.,'Pesquisar')]    15
    Click Element    //a[contains(.,'Pesquisar')]
    Sleep    2
    Capture Page Screenshot


E pesquiso pelo Inventário
    Select Frame    //iframe[@name='frmConteudo']

    ${NUM_INVENT}    Get File    ${EXECDIR}/test/processos/num_inventario.txt

    Wait Until Element Is Visible    ctl00$oPesquisaAvancada$dtgPesquisaAvancadaControle$ctl00$edtCampo_1    30
    Input Text        ctl00$oPesquisaAvancada$dtgPesquisaAvancadaControle$ctl00$edtCampo_1    ${NUM_INVENT}
    Sleep    2
    Wait Until Element Is Visible    //a[contains(.,'Pesquisar')]    15
    Click Element    //a[contains(.,'Pesquisar')]
    Sleep    2
    Capture Page Screenshot


E pesquiso pela Transferência
    Select Frame    //iframe[@name='frmConteudo']

    ${NUM_TRANSF}    Get File    ${EXECDIR}/test/processos/num_transferencia.txt
    Log    O valor lido é: ${NUM_TRANSF}

    Wait Until Element Is Visible    //input[@name='ctl00$oPesquisaAvancada$dtgPesquisaAvancadaControle$ctl01$edtCampo_2']    30
    Input Text        //input[@name='ctl00$oPesquisaAvancada$dtgPesquisaAvancadaControle$ctl01$edtCampo_2']    ${NUM_TRANSF}
    Sleep    2
    Wait Until Element Is Visible    //a[contains(.,'Pesquisar')]    15
    Click Element    //a[contains(.,'Pesquisar')]
    Sleep    2
    Capture Page Screenshot


E seleciono a Baixa da lista
    ${NUM_BAIXA}    Get File    ${EXECDIR}/test/processos/num_baixa.txt
    Wait Until Element Is Visible    //table[@id='ctl00_ContentPrincipal_dtgPesquisa']//tr[td/a[text()='${NUM_BAIXA}']]//td[9]//input    15
    Sleep    1
    Click Element    //table[@id='ctl00_ContentPrincipal_dtgPesquisa']//tr[td/a[text()='${NUM_BAIXA}']]//td[9]//input
    Sleep    2
    Capture Page Screenshot


E seleciono o inventário da lista

    ${NUM_INVENT}    Get File    ${EXECDIR}/test/processos/num_inventario.txt
    Wait Until Element Is Visible    //table[@id='ctl00_ContentPrincipal_dtgPesquisa']//tr[td/a[text()='${NUM_INVENT}']]//td[11]//input[last()]     15
    Sleep    1
    Click Element    //table[@id='ctl00_ContentPrincipal_dtgPesquisa']//tr[td/a[text()='${NUM_INVENT}']]//td[11]//input[last()]
    Sleep    2
    Capture Page Screenshot


E seleciono a transferência da lista
    ${NUM_TRANSF}    Get File    ${EXECDIR}/test/processos/num_transferencia.txt
    Wait Until Element Is Visible    //table[@id='ctl00_ContentPrincipal_dtgPesquisa']//tr[td/a[text()='${NUM_TRANSF}']]//td[9]//input    15
    Sleep    1
    Click Element    //table[@id='ctl00_ContentPrincipal_dtgPesquisa']//tr[td/a[text()='${NUM_TRANSF}']]//td[9]//input
    Sleep    2
    Capture Page Screenshot


E clico na Baixa da lista
    ${NUM_BAIXA}    Get File    ${EXECDIR}/test/processos/num_baixa.txt
    Wait Until Element Is Visible    //a[@class='link-action'][contains(.,'${NUM_BAIXA}')]    15
    Sleep    1
    Click Element    //a[@class='link-action'][contains(.,'${NUM_BAIXA}')]
    Sleep    2


E clico na Transferência da lista
    ${NUM_TRANSF}    Get File    ${EXECDIR}/test/processos/num_transferencia.txt
    Wait Until Element Is Visible    //a[@class='link-action'][contains(.,'${NUM_TRANSF}')]    15
    Sleep    1
    Click Element    //a[@class='link-action'][contains(.,'${NUM_TRANSF}')]
    Sleep    2


Então seleciono os itens para transaferência

    Switch Window    
    Select Frame    //frame[contains(@name,'main')]

    # Clique na aba 'Itens'
    Wait Until Element Is Visible    //span[contains(.,'Itens')]    20
    Click Element    //span[contains(.,'Itens')]
    
    # Clique de Incluir 
    Wait Until Element Is Visible    //a[contains(.,'Incluir')]    30
    Click Element    //a[contains(.,'Incluir')]
    Sleep    2

    Wait Until Element Is Visible    //input[contains(@description,'1000241')]    15
    Click Element    //input[contains(@description,'1000241')]
    Sleep    1
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    10
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    3

    Wait Until Element Is Visible    //span[contains(@class,'k-icon k-i-arrow-n')]    20
    ${elementos}    Get WebElements    //span[contains(@class,'k-icon k-i-arrow-n')]
    ${elemento}    Set Variable    ${elementos}[0]
    Double Click Element    ${elemento}
    Double Click Element    ${elemento}
    Click Element    //span[contains(.,'Itens')]
    Sleep    4
    Capture Page Screenshot


Então aprovo a solicitação de Transferência
    Wait Until Element Is Visible    //a[contains(.,'Aprovar')]    10
    Click Element    //a[contains(.,'Aprovar')]
    Sleep    1
    Capture Page Screenshot

    # Clique sim do popup
    Sleep    1
    Wait Until Element Is Visible    //a[contains(.,'Sim')]    10
    Click Element    //a[contains(.,'Sim')]
    Sleep    3


Então encaminho a solicitação de Transferencia
    Wait Until Element Is Visible    //a[contains(.,'Encaminhar')]    10
    Click Element    //a[contains(.,'Encaminhar')]
    Sleep    1
    Capture Page Screenshot

    # Clique sim do popup
    Sleep    1
    Wait Until Element Is Visible    //a[contains(.,'Sim')]    10
    Click Element    //a[contains(.,'Sim')]
    Sleep    3

Então encaminho a RMT para Expedição

    Wait Until Element Is Visible    //a[contains(.,'Encaminhar')]    10
    Click Element    //a[contains(.,'Encaminhar')]
    Sleep    1
    Capture Page Screenshot

    Switch Window    
    Select Frame    //frame[contains(@name,'main')]

    Wait Until Element Is Visible    //span[@unselectable='on'][contains(.,'Selecione')]    20
    Click Element    //span[@unselectable='on'][contains(.,'Selecione')]

    Wait Until Element Is Visible    //ul[@id = 'ctl00_ContentPrincipal_ddlRmt_listbox']//li[last()]    15
    Capture Page Screenshot

    Click Element    //ul[@id = 'ctl00_ContentPrincipal_ddlRmt_listbox']//li[last()]
    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    15
    Sleep    1
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    1

    # Clique sim do popup
    Sleep    1
    Switch Window    
    Select Frame    //frame[contains(@name,'main')]
    Select Frame    //iframe[@name='frmConteudo']

    Wait Until Element Is Visible    //a[contains(.,'Sim')]    15
    Capture Page Screenshot
    Sleep    2
    Click Element    //a[contains(.,'Sim')]
    Sleep    3
    
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[contains(.,'Não')]    15
    Capture Page Screenshot
    Sleep    2
    Click Element    //a[contains(.,'Não')]
    Sleep    3
    Close Browser

Então incluo uma nova Baixa de Material por Ajuste
    Select Frame    //iframe[@name='frmConteudo']
    Wait Until Element Is Visible    //a[contains(.,'Incluir')]    30
    Click Element    //a[contains(.,'Incluir')]
    Sleep    2

    Switch Window    
    Select Frame    //frame[contains(@name,'main')]
    Capture Page Screenshot

    # Tipo de movimentação - Requisição de Baixa por ajuste
    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlTipoMovimentacao_listbox']    20
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlTipoMovimentacao_listbox']
    Sleep    2
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Requisição de baixa por ajuste')]    10
    Sleep    1
    Click Element    //li[@tabindex='-1'][contains(.,'Requisição de baixa por ajuste')]
    Sleep    1


   # Almoxarifado
    Wait Until Element Is Visible    //a[contains(@onclick,'AbrirJanelaPesquisarAlmoxarifado();')]   20
    Sleep    1
    Click Element    //a[contains(@onclick,'AbrirJanelaPesquisarAlmoxarifado();')]
    Sleep    2

    Wait Until Element Is Visible    //input[@name='ctl00$ContentPrincipal$tbxDsAlmoxarifado']    20
    Input Text    //input[@name='ctl00$ContentPrincipal$tbxDsAlmoxarifado']    ${NOME_ALMOX}
    Click Element    //a[contains(.,'Pesquisar')]
    Sleep    2

    Wait Until Element Is Visible    (//input[contains(@id,'rbList')])[last()]    20
    Click Element    (//input[contains(@id,'rbList')])[last()] 
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    20
    Click Element    //a[contains(.,'Confirmar')]

    Sleep    2
    # Input de Destino
    Wait Until Element Is Visible    //input[@name='ctl00$ContentPrincipal$tbxDestino']    15
    Input Text    //input[@name='ctl00$ContentPrincipal$tbxDestino']    Baixa por ajuste
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[@onclick='SalvarRequisicao(false);']    20
    Click Element    //a[@onclick='SalvarRequisicao(false);']
    Sleep    4

    
    # Esperar até que o campo de input tenha um valor preenchido
    Wait Until Keyword Succeeds    10 times    2 seconds    Valor Do Input BAIXA Deve Ser Preenchido

    # Capturar o valor do campo depois que ele for preenchido
    ${NUM_BAIXA}    Get Element Attribute    ${INPUT_TRANSF}    value
    Log    O valor do input é: ${NUM_BAIXA}


Valor Do Input BAIXA Deve Ser Preenchido
    ${NUM_BAIXA}    Get Element Attribute    ${INPUT_TRANSF}     value
    Should Not Be Empty    ${NUM_BAIXA}
    Log    O valor do input é: ${NUM_BAIXA}

    # Salvar o valor em um arquivo de texto
    Create File    ${EXECDIR}/test/processos/num_baixa.txt    ${NUM_BAIXA}


Então agendo o Inventário
    Wait Until Element Is Visible    //a[contains(.,'Agendar')]    10
    Click Element    //a[contains(.,'Agendar')]
    Sleep    1

    Switch Window    
    Select Frame    //frame[contains(@name,'main')]

    # Data inicio
    #${hora_atual+1min}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(minutes=1)).strftime('%d-%m-%Y %H:%M:%S')    datetime
    ${hora_atual}=    Evaluate    datetime.datetime.now().strftime('%d-%m-%Y %H:%M:%S')    datetime

    # Data final
    ${hora_atual+120min}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(minutes=120)).strftime('%d-%m-%Y %H:%M:%S')    datetime

    Wait Until Element Is Visible    id=ctl00_ContentPrincipal_tbxDtInicio
    Click Element    id=ctl00_ContentPrincipal_tbxDtInicio
    Sleep    2
    Set Focus To Element    id=ctl00_ContentPrincipal_tbxDtInicio
    Execute JavaScript    document.getElementById("ctl00_ContentPrincipal_tbxDtInicio").value="${hora_atual}";


    Sleep    2
    Wait Until Element Is Visible    id=ctl00_ContentPrincipal_tbxDtTerminoPrevisto
    Click Element    id=ctl00_ContentPrincipal_tbxDtTerminoPrevisto
    Sleep    2
    Set Focus To Element    id=ctl00_ContentPrincipal_tbxDtTerminoPrevisto
    Execute JavaScript    document.getElementById("ctl00_ContentPrincipal_tbxDtTerminoPrevisto").value="${hora_atual+120min}";
    Capture Page Screenshot
    Sleep    2

    # Clique de confirmar agendamento
    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    20
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    3


E clico no inventário Agurdando Aprovação

    ${NUM_INVENT}    Get File    ${EXECDIR}/test/processos/num_inventario.txt

    ${timeout}=        Set Variable    300    
    ${interval}=       Set Variable    5   
    ${start_time}    Get Time    epoch 

    FOR    ${i}    IN RANGE    ${timeout}
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //table[@id="ctl00_ContentPrincipal_dtgPesquisa"]//tr[td/a[contains(text(), '${NUM_INVENT}')]]//td[9]//img[contains(@title,'Aguardando aprovação')]
        Run Keyword If    ${element_found}    Click Element    //table[@id="ctl00_ContentPrincipal_dtgPesquisa"]//tr[td/a[contains(text(), '${NUM_INVENT}')]]//a
        Run Keyword If    ${element_found}    Exit For Loop
        
        Execute JavaScript    window.location.reload()
        Sleep    ${interval} sec

        ${current_time}=    Get Time    epoch
        ${elapsed_time}=    Evaluate    ${current_time} - ${start_time}
        Run Keyword If    ${elapsed_time} > ${timeout}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    END
    Run Keyword If    not ${element_found}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    Capture Page Screenshot


E clico no Inventário Aberto

    ${NUM_INVENT}    Get File    ${EXECDIR}/test/processos/num_inventario.txt

    ${timeout}=        Set Variable    300    
    ${interval}=       Set Variable    5   

    ${start_time}    Get Time    epoch 

    FOR    ${i}    IN RANGE    ${timeout}
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //table[@id="ctl00_ContentPrincipal_dtgPesquisa"]//tr[td/a[contains(text(), '${NUM_INVENT}')]]//td[9]//img[contains(@title,'Aberto')]
        Run Keyword If    ${element_found}    Click Element    //table[@id="ctl00_ContentPrincipal_dtgPesquisa"]//tr[td/a[contains(text(), '${NUM_INVENT}')]]//a
        Run Keyword If    ${element_found}    Exit For Loop
        
        Execute JavaScript    window.location.reload()
        Sleep    ${interval} sec

        ${current_time}=    Get Time    epoch
        ${elapsed_time}=    Evaluate    ${current_time} - ${start_time}
        Run Keyword If    ${elapsed_time} > ${timeout}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    END
    Run Keyword If    not ${element_found}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    Capture Page Screenshot


E clico no inventário da Lista

    ${NUM_INVENT}    Get File    ${EXECDIR}/test/processos/num_inventario.txt
    Wait Until Element Is Visible    //table[@id="ctl00_ContentPrincipal_dtgPesquisa"]//tr[td/a[contains(text(), '${NUM_INVENT}')]]//a    20
    Sleep    60
    Click Element    //table[@id="ctl00_ContentPrincipal_dtgPesquisa"]//tr[td/a[contains(text(), '${NUM_INVENT}')]]//a

Então abro o inventário
    Switch Window    
    Select Frame    //frame[contains(@name,'main')]
    Select Frame    //iframe[@name='frmConteudo']

    Wait Until Element Is Visible    //a[@onclick='abrirInventarioSimNao();'][contains(@id,'btnAbrirInventario')][contains(.,'Abrir inventário')]    20
    Click Element    //a[@onclick='abrirInventarioSimNao();'][contains(@id,'btnAbrirInventario')][contains(.,'Abrir inventário')]
    Sleep    1
    Capture Page Screenshot

    # Clique de SIM no popup
    Wait Until Element Is Visible    //a[contains(.,'Sim')]    15
    Click Element    //a[contains(.,'Sim')]
    Sleep    3
    Capture Page Screenshot
    Close Browser

Então Encerro o Inventário
   Switch Window    
    Select Frame    //frame[contains(@name,'main')]
    Select Frame    //iframe[@name='frmConteudo']

    Wait Until Element Is Visible    //a[@onclick='abrirEncerrarInventario();'][contains(@id,'btnEncerrarInventario')][contains(.,'Encerrar inventário')]    20
    Sleep    1
    Click Element    //a[@onclick='abrirEncerrarInventario();'][contains(@id,'btnEncerrarInventario')][contains(.,'Encerrar inventário')]
    Sleep    1
    Capture Page Screenshot

    # Clique SIM no popup
    Wait Until Element Is Visible    //a[contains(.,'Sim')]    20
    Sleep    1
    Click Element    //a[contains(.,'Sim')]
    Sleep    4
    Capture Page Screenshot
    Sleep    1
    Close Browser


Então encerro a Contagem do Inventário
    Switch Window    
    Select Frame    //frame[contains(@name,'main')]
    Select Frame    //iframe[@name='frmConteudo']

    Wait Until Element Is Visible    //input[contains(@class,'k-formatted-value k-input')]    20
    Sleep    1
    Input Text    //input[contains(@class,'k-formatted-value k-input')]   800
    Sleep    1
    Capture Page Screenshot

    # Clique em 'Pesquisar' somente para atualizar os valores
    Wait Until Element Is Visible    //a[contains(.,'Pesquisar')]    20
    Sleep    1
    Click Element    //a[contains(.,'Pesquisar')]
    Sleep    3
    Capture Page Screenshot

    #Clique de Encerrar contagem
    Wait Until Element Is Visible    //a[@onclick='abrirEncerrarContagemSimNao();'][contains(@id,'btnEncerrarContagem')][contains(.,'Encerrar contagem')]    20
    Sleep    1
    Click Element    //a[@onclick='abrirEncerrarContagemSimNao();'][contains(@id,'btnEncerrarContagem')][contains(.,'Encerrar contagem')]

    # Clique SIM no popup
    Wait Until Element Is Visible    //a[contains(.,'Sim')]    20
    Sleep    1
    Click Element    //a[contains(.,'Sim')]
    Sleep    3
    Capture Page Screenshot

    # Clique em OK no popup
    Wait Until Element Is Visible    //a[contains(.,'OK')]    20
    Click Element    //a[contains(.,'OK')]
    Sleep    1
    Capture Page Screenshot

Então aprovo o inventário
    Switch Window    
    Select Frame    //frame[contains(@name,'main')]
    Select Frame    //iframe[@name='frmConteudo']

    Wait Until Element Is Visible    //span[contains(.,'Relatório de encerramento')]    20
    Click Element    //span[contains(.,'Relatório de encerramento')]
    Sleep    4
    Capture Page Screenshot

    Switch Window    NEW
    Wait Until Element Is Visible    //a[contains(.,'Aprovar')]    20
    Click Element    //a[contains(.,'Aprovar')]
    Sleep    6
    Capture Page Screenshot
    Sleep    1
    Close Browser
