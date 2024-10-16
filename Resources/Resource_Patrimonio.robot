*** Settings ***
Documentation    Recursos, Ações e Elementos do Módulo de Almoxarifado
Library          SeleniumLibrary
Library          DateTime
Library          OperatingSystem

*** Variables ***
${DESCRICAO}    NOVO BEM - TESTE AUTO - 15/10
${timeout}       300    
${interval}      5    
${start_time}    Get Time    epoch
${INPUT_NUM_BAIXA_BEM}    //span[@id= 'lbl_ctl00_ContentPrincipal_tbxNumero']


*** Keywords ***

E Acesso a Lista de Baixas da Minha Unidade
    Select Frame    //frame[contains(@name,'main')]

    # Clique em Patrimônio
    Wait Until Element Is Visible    xpath=//div[@unselectable='on'][contains(.,'Patrimônio')]    timeout=30s
    Click Element    xpath=//div[@unselectable='on'][contains(.,'Patrimônio')]

    # mouse over em Bem Móvel
    ${elemento}    Get WebElement    
    ...    xpath=//td[@class='label'][contains(.,'Bem móvel')]
    Mouse Over    ${elemento}
    
    # Clique em Baixas da minha unidade
    Wait Until Element Is Visible    
    ...    xpath=//td[@class='label'][contains(.,'Baixas da minha unidade')]    timeout=30s
    Click Element    
    ...    xpath=//td[@class='label'][contains(.,'Baixas da minha unidade')]
    
    Capture Page Screenshot
    Sleep    3

E acesso a Baixa da Lista
    Select Frame    //iframe[@name='frmConteudo']
    ${NUM_BAIXA_BEM}    Get File    ${EXECDIR}/test/num_baixa_bem.txt
    Wait Until Element Is Visible    //a[contains(.,'${NUM_BAIXA_BEM}')]    15
    Sleep    1
    Click Element    //a[contains(.,'${NUM_BAIXA_BEM}')]
    Sleep    2

    
Então incluo um Bem para Baixa
    Switch Window
    Select Frame    //frame[contains(@name,'main')]
    Wait Until Element Is Visible    //span[contains(.,'Bens')]    10
    Click Element    //span[contains(.,'Bens')]

    # Cluque em Incluir na Aba 'Bens'
    Wait Until Element Is Visible    //a[contains(.,'Incluir')]    10
    Click Element    //a[contains(.,'Incluir')]

    # Descrição do Bem
    Switch Window
    Select Frame    //frame[contains(@name,'main')]
    Wait Until Element Is Visible    //input[contains(@name,'tbxDsBem')]    10
    Input Text    //input[contains(@name,'tbxDsBem')]    ${DESCRICAO}

    # Clique de Pesquisar
    Wait Until Element Is Visible    //a[@id='ctl00_ContentPrincipal_btnPesquisar']    10
    Click Element    //a[@id='ctl00_ContentPrincipal_btnPesquisar']
    Sleep    2

    # Clique para Marcar o Bem
    Wait Until Element Is Visible    //input[@name='ckbBemCompor']    10
    Click Element    //input[@name='ckbBemCompor']
    Capture Page Screenshot

    # Clique para confirmar
    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    10
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    3


E acesso a lista de Bens Móvies
    Select Frame    //frame[contains(@name,'main')]

    # Clique em Patrimônio
    Wait Until Element Is Visible    xpath=//div[@unselectable='on'][contains(.,'Patrimônio')]    timeout=30s
    Click Element    xpath=//div[@unselectable='on'][contains(.,'Patrimônio')]

    # mouse over em Bem Móvel
    ${elemento}    Get WebElement    
    ...    xpath=//td[@class='label'][contains(.,'Bem móvel')]
    Mouse Over    ${elemento}
    
    # Clique em Bens móvies da minha unidade
    Wait Until Element Is Visible    
    ...    xpath=//td[@class='label'][contains(.,'Bens móveis da minha unidade')]    timeout=30s
    Click Element    
    ...    xpath=//td[@class='label'][contains(.,'Bens móveis da minha unidade')]
    
    Capture Page Screenshot
    Sleep    3


E acesso minhas tarefas
    Select Frame    //frame[contains(@name,'main')]

    # Clique em Arquivos
    Wait Until Element Is Visible    xpath=//div[@unselectable='on'][contains(.,'Arquivo')]    timeout=30s
    Click Element    xpath=//div[@unselectable='on'][contains(.,'Arquivo')]

    # mouse over em Tarefas
    ${elemento}    Get WebElement    
    ...    xpath=//td[@class='label'][contains(.,'Tarefas')]
    Mouse Over    ${elemento}
    
    # Clique em Minhas Tarefas
    Wait Until Element Is Visible    
    ...    xpath=//td[@class='label'][contains(.,'Minhas tarefas')]    timeout=30s
    Click Element    
    ...    xpath=//td[@class='label'][contains(.,'Minhas tarefas')]
    
    Capture Page Screenshot
    Sleep    3

Então aprovo o Termo de Resposabilidade

    Select Frame    //iframe[contains(@name,'frmConteudo')]

    ${start_time}    Get Time    epoch
    
    FOR    ${i}    IN RANGE    ${timeout}
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //a[contains(.,'Atividade para aprovar o termo - SGA')]
        Run Keyword If    ${element_found}    Click Element    //a[contains(.,'Atividade para aprovar o termo - SGA')]
        Run Keyword If    ${element_found}    Exit For Loop
        
        Execute JavaScript    window.location.reload()
        Sleep    ${interval} sec

        ${current_time}=    Get Time    epoch
        ${elapsed_time}=    Evaluate    ${current_time} - ${start_time}
        Run Keyword If    ${elapsed_time} > ${timeout}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    END
    Run Keyword If    not ${element_found}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.



    # Wait Until Element Is Visible    //a[contains(.,'Atividade para aprovar o termo - SGA')]    15
    # Click Element    //a[contains(.,'Atividade para aprovar o termo - SGA')]
    # Sleep    2

    Sleep    2
    Switch Window    NEW
    Select Frame    //iframe[contains(@name,'frmDetalheWorkflow')]
    Wait Until Element Is Visible    //a[contains(.,'Aprovar')]    timeout=30s
    Capture Page Screenshot
    Click Element    //a[contains(.,'Aprovar')]
    
    
    # Escrevendo a justificativa
    Switch Window    NEW
    Wait Until Element Is Visible    //textarea[@field='normal'][contains(@id,'tbxDsJustificativa')]    timeout=30s
    Input Text    //textarea[@field='normal'][contains(@id,'tbxDsJustificativa')]    Justificativa
    Capture Page Screenshot


    # clique no botão salvar
    Click Element    //input[contains(@value,'Salvar')]
    Sleep    3
    SeleniumLibrary.Close Browser


Então encaminho o termo de resposabilidade
    Select Frame    //iframe[@name='frmConteudo']
    Wait Until Element Is Visible    //table[@id='ctl00_ContentPrincipal_dtgPesquisa']//tr[td/a[text()='${DESCRICAO}']]//img[@title='Termo de responsabilidade']    15
    Click Element        //table[@id='ctl00_ContentPrincipal_dtgPesquisa']//tr[td/a[text()='${DESCRICAO}']]//img[@title='Termo de responsabilidade']
    Switch Window
    
    Select Frame    //frame[contains(@name,'main')]
    Wait Until Element Is Visible    //a[contains(.,'Encaminhar')]
    Capture Page Screenshot
    Click Element    //a[contains(.,'Encaminhar')]
    Sleep    5
    Capture Page Screenshot



E seleciono o Bem Móvel da lista   
    Select Frame    //iframe[@name='frmConteudo']
    Wait Until Element Is Visible    //table[@id='ctl00_ContentPrincipal_dtgPesquisa']//tr[td/a[text()='${DESCRICAO}']]//input    15
    Click Element        //table[@id='ctl00_ContentPrincipal_dtgPesquisa']//tr[td/a[text()='${DESCRICAO}']]//input
    Capture Page Screenshot


E acesso o bem móvel da lista

    Select Frame    //iframe[@name='frmConteudo']
    Wait Until Element Is Visible    //table[@id='ctl00_ContentPrincipal_dtgPesquisa']//tr[td/a[text()='${DESCRICAO}']]//a    15
    Click Element        //table[@id='ctl00_ContentPrincipal_dtgPesquisa']//tr[td/a[text()='${DESCRICAO}']]//a


Então incluo uma Nova baixa
    Select Frame    //iframe[@name='frmConteudo']
    Wait Until Element Is Visible    //a[contains(.,'Incluir')]
    Click Element    //a[contains(.,'Incluir')]
    Sleep    3

    # Motivo
    Switch Window
    Select Frame    xpath=//frame[contains(@name,'main')]
    Wait Until Element Is Visible    //span[contains(@aria-owns,'listbox')]    15
    Click Element    //span[contains(@aria-owns,'listbox')]
    Sleep    1

    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Descarte')]    10
    Click Element    //li[@tabindex='-1'][contains(.,'Descarte')]

    # Justificativa
    Wait Until Element Is Visible    //textarea[contains(@name,'tbxJustificativa')]    20
    Input Text    //textarea[contains(@name,'tbxJustificativa')]    Justificativa

    # Contábil
    Wait Until Element Is Visible    //input[contains(@maxlength,'40')]    20
    Input Text    //input[contains(@maxlength,'40')]    123456
    Capture Page Screenshot

    # Salvar
    Wait Until Element Is Visible    //a[@onclick='SalvarDadosGerais(false);']    10
    Click Element    //a[@onclick='SalvarDadosGerais(false);']
    Sleep    4

    
    # Capturar o valor do campo depois que ele for preenchido
    ${NUM_BAIXA_BEM}    SeleniumLibrary.Get Text    ${INPUT_NUM_BAIXA_BEM}

    # Salvar o valor em um arquivo de texto
    Create File    ${EXECDIR}/test/num_baixa_bem.txt    ${NUM_BAIXA_BEM}
    Sleep    2
    SeleniumLibrary.Close Browser



Então incluo um novo bém móvel
    Select Frame    //iframe[@name='frmConteudo']
    Wait Until Element Is Visible    //a[contains(.,'Incluir')]
    Click Element    //a[contains(.,'Incluir')]
    Sleep    3

    # Descrição do produto
    # Clique na Lupa
    Switch Window
    Select Frame    xpath=//frame[contains(@name,'main')]
    Wait Until Element Is Visible    //a[@onclick='AbrirJanelaProduto();']    15
    Click Element    //a[@onclick='AbrirJanelaProduto();']
    Sleep    3

    # Selecionar produto
    # Campo Código do produto
    Wait Until Element Is Visible    //input[@name='ctl00$ContentPrincipal$txtCodigo']    20
    Input Text    //input[@name='ctl00$ContentPrincipal$txtCodigo']    4080211

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

    Sleep    3
    Capture Page Screenshot

    # Descição
    Wait Until Element Is Visible    //input[contains(@name,'tbxsDsMovel')]    15
    Input Text    //input[contains(@name,'tbxsDsMovel')]    ${DESCRICAO}

    # Forma de Controle
    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlTipoTombamento_listbox']    15
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlTipoTombamento_listbox']
    Sleep    1
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Individual')]    10
    Click Element    //li[@tabindex='-1'][contains(.,'Individual')]
    Sleep    1

    # Tipo de bem
    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlTipoBem_listbox']    10
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlTipoBem_listbox']
    Sleep    1
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Móvel')]    10
    Click Element    //li[@tabindex='-1'][contains(.,'Móvel')]
    Sleep    1
    Capture Page Screenshot

    # Forma de Ingresso
    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlFormaIngresso_listbox']    15
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlFormaIngresso_listbox']
    Sleep    1
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Compra')]    10
    Click Element    //li[@tabindex='-1'][contains(.,'Compra')]

    #Tipo de documento
    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlTipoDocumento_listbox']    15
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlTipoDocumento_listbox']
    Sleep    1
    Wait Until Element Is Visible    //li[contains(.,'Nota Fiscal')]    10
    Click Element    //li[contains(.,'Nota Fiscal')]

    #Número do processo
    Wait Until Element Is Visible    //input[contains(@name,'tbxNumeroDocumento')]    20
    Input Text    //input[contains(@name,'tbxNumeroDocumento')]    123456

    #Data de aquisição
    ${DATA_AQUIS}=    Get Current Date    result_format=%d-%m-%Y
    Wait Until Element Is Visible    id=ctl00_ContentPrincipal_tdtAquisicao
    Click Element    id=ctl00_ContentPrincipal_tdtAquisicao
    Sleep    2
    Set Focus To Element    id=ctl00_ContentPrincipal_tdtAquisicao
    Execute JavaScript    document.getElementById("ctl00_ContentPrincipal_tdtAquisicao").value="${DATA_AQUIS}";

    #Fornecedor
    Wait Until Element Is Visible    //a[@onclick='AbrirJanelaFornecedor();']    10
    Click Element    //a[@onclick='AbrirJanelaFornecedor();']
    Sleep    2

    Wait Until Element Is Visible    //input[@data-scdestado='RR']    10
    Click Element    //input[@data-scdestado='RR']
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    15
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    2

    # Numero da AF
    Wait Until Element Is Visible    //input[contains(@name,'tbxNumeroAF')]    20
    Input Text    //input[contains(@name,'tbxNumeroAF')]    12345

    # Número empenho
    Wait Until Element Is Visible    //input[contains(@name,'tbxNumeroEmpenho')]    15
    Input Text    //input[contains(@name,'tbxNumeroEmpenho')]    10

    # Data entrega
    Wait Until Element Is Visible    id=ctl00_ContentPrincipal_tdtEntrega
    Click Element    id=ctl00_ContentPrincipal_tdtEntrega
    Sleep    2
    Set Focus To Element    id=ctl00_ContentPrincipal_tdtEntrega
    Execute JavaScript    document.getElementById("ctl00_ContentPrincipal_tdtEntrega").value="${DATA_AQUIS}";

    # Natureza despesa
    Wait Until Element Is Visible    //a[@onclick='AbrirJanelaNaturezaDespesa();']    20
    Click Element    //a[@onclick='AbrirJanelaNaturezaDespesa();']
    Sleep    2


    Wait Until Element Is Visible    //input[@value='1079|44905256 - EQUIPAMENTOS, PEÇAS E ACESSÓRIOS DE PROTEÇÃO AO VÔO']    15
    Click Element    //input[@value='1079|44905256 - EQUIPAMENTOS, PEÇAS E ACESSÓRIOS DE PROTEÇÃO AO VÔO']
    Capture Page Screenshot
    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    15
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    2

    # Valor Unitário
    Wait Until Element Is Visible    //table[1]/tbody[1]/tr[21]/td[4]/span[1]/span[1]/input[1]    15
    Input Text    //table[1]/tbody[1]/tr[21]/td[4]/span[1]/span[1]/input[1]    5,500

    # Quantidade
    Wait Until Element Is Visible    //table[1]/tbody[1]/tr[22]/td[4]/span[1]/span[1]/input[1]    15
    Input Text    //table[1]/tbody[1]/tr[22]/td[4]/span[1]/span[1]/input[1]    2
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[@onclick='Salvar(false);']    15
    Click Element    //a[@onclick='Salvar(false);']
    Sleep    3


Então salvo os dadoas da aba Dados Contábeis
    Switch Window
    Select Frame    //frame[@name='main']
    Wait Until Element Is Visible    //span[contains(.,'Dados contábeis')]    10
    Click Element    //span[contains(.,'Dados contábeis')]
    Capture Page Screenshot
    Sleep    1

    Wait Until Element Is Visible    //a[@onclick='SalvarDadosContabeis(true);']    10
    Click Element    //a[@onclick='SalvarDadosContabeis(true);']
    Sleep    3
    Close Browser


Então gero o termo de responsabilidade
    Wait Until Element Is Visible    //a[contains(.,'Gerar termo de responsabilidade')]
    Click Element    //a[contains(.,'Gerar termo de responsabilidade')]
    Sleep    2

    # Resposável
    Switch Window
    Select Frame    //frame[@name='main']
    Wait Until Element Is Visible    //a[@onclick='AbrirJanelaResponsavel();']   15
    Click Element    //a[@onclick='AbrirJanelaResponsavel();']
    
    Sleep    1
    
    Switch Window
    Select Frame    //frame[@name='main']
    Wait Until Element Is Visible    //input[@name='ctl00$ContentPrincipal$txtUsuario']    15
    Input Text    //input[@name='ctl00$ContentPrincipal$txtUsuario']    Gestor de patrimônio móvel da UG 120101
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[contains(.,'Pesquisar')]    15
    Click Element    //a[contains(.,'Pesquisar')]


    Wait Until Element Is Visible    //input[@name='radList']    15
    Click Element    //input[@name='radList']
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    15
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    1

    # Localização/Depto
    Wait Until Element Is Visible    //a[@onclick='AbrirJanelaDepartamento();']   15
    Click Element    //a[@onclick='AbrirJanelaDepartamento();']

    Switch Window
    Select Frame    //frame[@name='main']

    Wait Until Element Is Visible    //input[contains(@name,'tbxDepartamento')]    15
    Input Text    //input[contains(@name,'tbxDepartamento')]    SECRETARIA DE ADMINISTRAÇÃO
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[contains(.,'Pesquisar')]    15
    Click Element    //a[contains(.,'Pesquisar')]


    Wait Until Element Is Visible    //input[@name='radOrCheckList']   15
    Click Element    //input[@name='radOrCheckList']
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    15
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    1

    Wait Until Element Is Visible    //a[contains(.,'Salvar e fechar')]    15
    Click Element    //a[contains(.,'Salvar e fechar')]
    Sleep    4


Então faço o tombamento do Bem Móvel
    Wait Until Element Is Visible    //a[contains(.,'Tombar')]
    Click Element    //a[contains(.,'Tombar')]
    Sleep    2


    # Resposável
    Switch Window
    Select Frame    //frame[@name='main']
    Wait Until Element Is Visible    //a[@onclick='AbrirJanelaResponsavelMT();']    15
    Click Element    //a[@onclick='AbrirJanelaResponsavelMT();']
    Sleep    1
    
    Switch Window
    Select Frame    //frame[@name='main']
    Wait Until Element Is Visible    //input[@name='ctl00$ContentPrincipal$txtUsuario']    15
    Input Text    //input[@name='ctl00$ContentPrincipal$txtUsuario']    gestor patrimonio movel
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[contains(.,'Pesquisar')]    15
    Click Element    //a[contains(.,'Pesquisar')]


    Wait Until Element Is Visible    //input[@type='radio']    15
    Click Element    //input[@type='radio']
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    15
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    1

    # Localização/Depto
    Wait Until Element Is Visible    //a[@onclick='AbrirJanelaDepartamentoMT();']   15
    Click Element    //a[@onclick='AbrirJanelaDepartamentoMT();']

    Switch Window
    Select Frame    //frame[@name='main']

    Wait Until Element Is Visible    //input[contains(@name,'tbxDepartamento')]    15
    Input Text    //input[contains(@name,'tbxDepartamento')]    SECRETARIA DE ADMINISTRAÇÃO
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[contains(.,'Pesquisar')]    15
    Click Element    //a[contains(.,'Pesquisar')]


    Wait Until Element Is Visible    //input[@type='radio']    15
    Click Element    //input[@type='radio']
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    15
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    1

    Wait Until Element Is Visible    //a[contains(.,'Registrar tombamento')]    15
    Click Element    //a[contains(.,'Registrar tombamento')]
    
    # Clique em OK no Popoup
    Wait Until Element Is Visible    //a[contains(.,'Sim')]    10
    Sleep    2
    Click Element    //a[contains(.,'Sim')]
    Sleep    3