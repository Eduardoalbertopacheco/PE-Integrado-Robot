*** Settings ***
Documentation    Ações e Elementos do Módulo de Contrato
Library          SeleniumLibrary
Library          DateTime
Library          OperatingSystem
Library          Collections
Resource         ../Resources/Variaveis.robot
  
*** Variables ***

${USUARIO}    Eduardo Alberto
@{PERFIS}    Gestor    Fiscal

@{CODIGOS_PRODUTOS}    1000390    1000268

@{QUANTIDADES}    500    680    
@{UNIDADES_MEDIDA}    TBO 6 M    CX 50 UNIDADES    
@{VALORES_UNITARIOS}    9    12    
${INPUT_NUM_GC}          //span[@id='lbl_ctl00_ContentPrincipal_tbxNrSolicitacaoContrato']
${INPTU_NUM_CONTRATO}          //span[@id='lbl_ctl00_ContentPrincipal_tbxNumero']
${OBJETO_CONTRATO_NOVO}    Contrato Novo Teste Auto

*** Keywords ***
E acesso a GC da lista

    ${NUM_GC}    Get File    ${EXECDIR}/test/processos/num_gc.txt
    Select Frame    //iframe[@name='frmConteudo']
    # Wait Until Element Is Visible    //table[@id='ctl00_ContentPrincipal_dtgPesquisa']//tr[td[contains(text(), 'Nao_ARP_Nao_PE_Teste_Auto')]]/td[1]//a    15
    Wait Until Element Is Visible    //a[contains(.,'${NUM_GC}')]    15
    Click Element    //a[contains(.,'${NUM_GC}')]
    Sleep    2
    Capture Page Screenshot


E acesso a GC ARP da lista

    ${NUM_GC_ARP}    Get File    ${EXECDIR}/test/processos/Num_GC_ARP.txt
    Select Frame    //iframe[@name='frmConteudo']
    # Wait Until Element Is Visible    //table[@id='ctl00_ContentPrincipal_dtgPesquisa']//tr[td[contains(text(), 'Nao_ARP_Nao_PE_Teste_Auto')]]/td[1]//a    15
    Wait Until Element Is Visible    //a[contains(.,'${NUM_GC_ARP}')]    15
    Click Element    //a[contains(.,'${NUM_GC_ARP}')]
    Sleep    2
    Capture Page Screenshot


Então Encaminho a GC
    Switch Window
    Select Frame    //frame[contains(@name,'main')]
    Wait Until Element Is Visible    //a[contains(.,'Encaminhar')]    15
    Click Element    //a[contains(.,'Encaminhar')]
    Sleep    2
    Capture Page Screenshot

    # clique de 'SIM' no Popup
    Wait Until Element Is Visible    //a[@href='javascript:void(0);'][contains(@id,'mbxDadosGerais')][contains(.,'Sim')]    10
    Click Element    //a[@href='javascript:void(0);'][contains(@id,'mbxDadosGerais')][contains(.,'Sim')]
    Sleep    3


Então Delibero a GC
    Switch Window
    Select Frame    //frame[contains(@name,'main')]
    Wait Until Element Is Visible    //a[contains(.,'Deliberar')]    15
    Click Element    //a[contains(.,'Deliberar')]
    Sleep    2

    # Popup de aprovação
    Wait Until Element Is Visible    //input[@id='rbtResultadoAnalise_0']    10
    Click Element    //input[@id='rbtResultadoAnalise_0']
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    10
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    3



E Acesso a lista de Geração de Contratos
    Select Frame    xpath=//frame[contains(@name,'main')]

    # Clique de Contrato
    Wait Until Element Is Visible    xpath=//div[@unselectable='on'][contains(.,'Contrato')]    timeout=30s
    Click Element    xpath=//div[@unselectable='on'][contains(.,'Contrato')]

    # Clique em Lista de Geração de Contratos
    Wait Until Element Is Visible    
    ...    xpath=//td[@class='label'][contains(.,'Lista de solicitação de geração de contrato')]    timeout=30s
    Click Element    
    ...    xpath=//td[@class='label'][contains(.,'Lista de solicitação de geração de contrato')]
    Sleep    3
    Capture Page Screenshot
    
E acesso a Lista de 'Meus Contratos'
    Select Frame    xpath=//frame[contains(@name,'main')]

    # Clique de Contrato
    Wait Until Element Is Visible    xpath=//div[@unselectable='on'][contains(.,'Contrato')]    timeout=30s
    Click Element    xpath=//div[@unselectable='on'][contains(.,'Contrato')]
    Sleep    1

    # Clique em Lista de Contratos
    Wait Until Element Is Visible    
    ...    xpath=//td[@class='label'][contains(.,'Meus Contratos')]    timeout=30s
    Click Element    
    ...    xpath=//td[@class='label'][contains(.,'Meus Contratos')]
    Sleep    5
    Capture Page Screenshot


E Acesso a lista de contratos
    Select Frame    xpath=//frame[contains(@name,'main')]

    # Clique de Contrato
    Wait Until Element Is Visible    xpath=//div[@unselectable='on'][contains(.,'Contrato')]    timeout=30s
    Click Element    xpath=//div[@unselectable='on'][contains(.,'Contrato')]

    # mouse over em Contratos
    ${elemento}    Get WebElement    
    ...    xpath=//td[@class='label'][contains(.,'Contratos')]
    Mouse Over    ${elemento}
    
    # Clique em Lista de Contratos
    Wait Until Element Is Visible    
    ...    xpath=//td[@class='label'][contains(.,'Lista de Contratos')]    timeout=30s
    Click Element    
    ...    xpath=//td[@class='label'][contains(.,'Lista de Contratos')]
    Sleep    5
    Capture Page Screenshot


E acesso a tela de 'Incluir Novo GC'
    Select Frame    //iframe[@name='frmConteudo']
    Wait Until Element Is Visible    //a[contains(.,'Incluir')]    30
    Click Element    //a[contains(.,'Incluir')]
    Switch Window    
    Select Frame    //frame[contains(@name,'main')]
    Sleep    3
    Capture Page Screenshot


Então incluo um Novo GC Não ARP e SIM PE

    # Genero - termo de adesão
    Wait Until Element Is Visible    //span[contains(@aria-owns,'ctl00_ContentPrincipal_ddlGenero_listbox')]    15
    Click Element    //span[contains(@aria-owns,'ctl00_ContentPrincipal_ddlGenero_listbox')]
    Sleep    1
    ${all}    Get WebElements    //li[@tabindex='-1'][contains(.,'Padrão')]
    ${gen_padrao}    Set Variable    ${all}[0]
    Wait Until Element Is Visible    ${gen_padrao}
    Click Element    ${gen_padrao}

    # Oriundo de ARP - NÂO
    Wait Until Element Is Visible    //input[@id='ctl00_ContentPrincipal_rbtOriundoARP_0']    15
    Click Element    //input[@id='ctl00_ContentPrincipal_rbtOriundoARP_1']
    Sleep    1

    # Processo no PE - Sim
    Wait Until Element Is Visible    //input[@id='ctl00_ContentPrincipal_rbtProcessoPE_0']    15
    Click Element    //input[@id='ctl00_ContentPrincipal_rbtProcessoPE_0']
    Sleep    1

    # Modalidade
    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlModalidade_listbox']    15
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlModalidade_listbox']
    Sleep    2
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Pregão eletrônico')]    10
    Click Element    //li[@tabindex='-1'][contains(.,'Pregão eletrônico')]
    Sleep    1

    # Grupo de Compras
    Wait Until Element Is Visible    //input[@name='ctl00$ContentPrincipal$autGrupoCompras']    15
    Input Text    //input[@name='ctl00$ContentPrincipal$autGrupoCompras']    Grupo de Compras Padrão - SECRETARIA DE ADMINISTRAÇÃO
    Sleep    2
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Grupo de Compras Padrão - SECRETARIA DE ADMINISTRAÇÃO')]
    ${elementos}    Get WebElements    //li[@tabindex='-1'][contains(.,'Grupo de Compras Padrão - SECRETARIA DE ADMINISTRAÇÃO')]
    ${sad}    Set Variable    ${elementos}[0]
    Sleep    1
    Click Element    ${sad}
    Sleep    2
    Capture Page Screenshot

    # Lupa de Número Processo
    Wait Until Element Is Visible    //a[contains(@onclick,'abrirJanelaNumeroProcesso();')]    10
    Click Element    //a[contains(@onclick,'abrirJanelaNumeroProcesso();')]

    
    Switch Window
    Select Frame    //frame[@name='main']
    Execute Javascript    document.body.style.zoom='80%'

    ${NUM_PREGAO}    Get File    ${EXECDIR}/test/processos/num_proc_pregao.txt
    Wait Until Element Is Visible    //input[@name='ctl00$ContentPrincipal$numeroProcesso']    10
    Input Text    //input[@name='ctl00$ContentPrincipal$numeroProcesso']    ${NUM_PREGAO}

    # Clique para pesquisar o processo
    Wait Until Element Is Visible    //a[contains(.,'Pesquisar')]    15
    Click Element    //a[contains(.,'Pesquisar')]
    Sleep    1

    # clique para selecionar o processo
    Wait Until Element Is Visible    //input[@name='radioProcesso']    15
    Click Element    //input[@name='radioProcesso']
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    15
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    2

    # Contratada Principal
    Wait Until Element Is Visible    //input[contains(@name,'autContratadaPrincipal')]    15
    Input Text    //input[contains(@name,'autContratadaPrincipal')]    C. MARTINS COMERCIAL LTDA - ME
    Sleep    2
    Wait Until Element Is Visible    //li[contains(.,'C. MARTINS COMERCIAL LTDA - ME')]    15
    Click Element    //li[contains(.,'C. MARTINS COMERCIAL LTDA - ME')]
    Sleep    1



Então incluo um Novo GC Não ARP e Não PE

    # Genero - termo de adesão
    Wait Until Element Is Visible    //span[contains(@aria-owns,'ctl00_ContentPrincipal_ddlGenero_listbox')]    15
    Click Element    //span[contains(@aria-owns,'ctl00_ContentPrincipal_ddlGenero_listbox')]
    Sleep    1
    ${all}    Get WebElements    //li[@tabindex='-1'][contains(.,'Padrão')]
    ${gen_padrao}    Set Variable    ${all}[0]
    Wait Until Element Is Visible    ${gen_padrao}
    Click Element    ${gen_padrao}

    # Oriundo de ARP - NÂO
    Wait Until Element Is Visible    //input[@id='ctl00_ContentPrincipal_rbtOriundoARP_0']    15
    Click Element    //input[@id='ctl00_ContentPrincipal_rbtOriundoARP_1']
    Sleep    1

    # Processo no PE - Não
    Wait Until Element Is Visible    //input[@id='ctl00_ContentPrincipal_rbtProcessoPE_1']    15
    Click Element    //input[@id='ctl00_ContentPrincipal_rbtProcessoPE_1']
    Sleep    1

    # Modalidade
    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlModalidade_listbox']    15
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlModalidade_listbox']
    Sleep    2
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Pregão eletrônico')]    10
    Click Element    //li[@tabindex='-1'][contains(.,'Pregão eletrônico')]
    Sleep    1

    # Número Processo
    Wait Until Element Is Visible    //input[contains(@name,'tbxNrProcesso')]    10
    Input Text    //input[contains(@name,'tbxNrProcesso')]    123.456.789.000
    Sleep    1

    # Tipo de Objeto
    Wait Until Element Is Visible    //span[contains(@aria-owns,'ctl00_ContentPrincipal_ddlTipoObjeto_listbox')]    15
    Click Element    //span[contains(@aria-owns,'ctl00_ContentPrincipal_ddlTipoObjeto_listbox')]
    Sleep    2
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'AQUISIÇÃO DE ARTIGOS DE MATERIAIS EDUCACIONAIS')]    15
    Click Element    //li[@tabindex='-1'][contains(.,'AQUISIÇÃO DE ARTIGOS DE MATERIAIS EDUCACIONAIS')]
    Sleep    1

    # Objeto
    Wait Until Element Is Visible    //textarea[contains(@name,'txtObjeto')]    15
    Input Text    //textarea[contains(@name,'txtObjeto')]    ${OBJETO_GC}
    Sleep    1

    # Contratada Principal
    Wait Until Element Is Visible    //input[contains(@name,'autContratadaPrincipal')]    15
    Input Text    //input[contains(@name,'autContratadaPrincipal')]    C. MARTINS COMERCIAL LTDA - ME
    Sleep    2
    Wait Until Element Is Visible    //li[contains(.,'C. MARTINS COMERCIAL LTDA - ME')]    15
    Click Element    //li[contains(.,'C. MARTINS COMERCIAL LTDA - ME')]
    Sleep    1

    # Grupo de Compras
    Wait Until Element Is Visible    //input[@name='ctl00$ContentPrincipal$autGrupoCompras']    15
    Input Text    //input[@name='ctl00$ContentPrincipal$autGrupoCompras']    Grupo de Compras Padrão - SECRETARIA DE ADMINISTRAÇÃO
    Sleep    2
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Grupo de Compras Padrão - SECRETARIA DE ADMINISTRAÇÃO')]
    ${elementos}    Get WebElements    //li[@tabindex='-1'][contains(.,'Grupo de Compras Padrão - SECRETARIA DE ADMINISTRAÇÃO')]
    ${sad}    Set Variable    ${elementos}[0]
    Sleep    1
    Click Element    ${sad}
    Sleep    2
    Capture Page Screenshot

    # Salvar
    Wait Until Element Is Visible    //a[contains(@onclick,'salvar(false);')]    15
    Click Element    //a[contains(@onclick,'salvar(false);')]
    Sleep    3

    Scroll Element Into View    //span[@id='lbl_ctl00_ContentPrincipal_tbxNrSolicitacaoContrato']
    Sleep    1

    # Capturar o valor do campo depois que ele for preenchido
    ${NUM_GC}    SeleniumLibrary.Get Text    ${INPUT_NUM_GC}

    # Salvar o valor em um arquivo de texto
    Create File    ${EXECDIR}/test/processos/num_GC.txt    ${NUM_GC}
    Capture Page Screenshot
    Close Browser

Então incluo uma nova Solicitação de GC SIM ARP

    # Genero - termo de adesão
    Wait Until Element Is Visible    //span[contains(@aria-owns,'ctl00_ContentPrincipal_ddlGenero_listbox')]    15
    Click Element    //span[contains(@aria-owns,'ctl00_ContentPrincipal_ddlGenero_listbox')]
    Sleep    1
    ${all}    Get WebElements    //li[@tabindex='-1'][contains(.,'Padrão')]
    ${gen_padrao}    Set Variable    ${all}[0]
    Wait Until Element Is Visible    ${gen_padrao}
    Click Element    ${gen_padrao}

    # Oriundo de ARP - SIM
    Wait Until Element Is Visible    //input[@id='ctl00_ContentPrincipal_rbtOriundoARP_0']    15
    Click Element    //input[@id='ctl00_ContentPrincipal_rbtOriundoARP_0']

    # Modalidade
    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlModalidade_listbox']    15
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlModalidade_listbox']
    Sleep    2
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Pregão eletrônico')]    10
    Click Element    //li[@tabindex='-1'][contains(.,'Pregão eletrônico')]
    Sleep    1


    # Lupa de Ata Registro Preço
    Wait Until Element Is Visible    //a[contains(@onclick,'abrirJanelaAtaRegistroPrecos();')]    10
    Click Element    //a[contains(@onclick,'abrirJanelaAtaRegistroPrecos();')]

    Switch Window
    Select Frame    //frame[@name='main']
    Execute Javascript    document.body.style.zoom='80%'

    ${NUM_ARP}    Get File    ${EXECDIR}/test/processos/num_ARP.txt
    Wait Until Element Is Visible    //input[@name='ctl00$ContentPrincipal$tbxNumeroAta']    10
    Input Text    //input[@name='ctl00$ContentPrincipal$tbxNumeroAta']    ${NUM_ARP}

    # Clique para pesquisar o processo
    Wait Until Element Is Visible    //a[contains(.,'Pesquisar')]    15
    Click Element    //a[contains(.,'Pesquisar')]
    Sleep    1

    # clique para selecionar o processo
    Wait Until Element Is Visible    //input[contains(@id,'radARP')]    15
    Click Element    //input[contains(@id,'radARP')]
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[@onclick='confirmarARP(this)'][contains(@id,'btnConfirmar')][contains(.,'Confirmar')]    15
    Click Element    //a[@onclick='confirmarARP(this)'][contains(@id,'btnConfirmar')][contains(.,'Confirmar')]
    Sleep    2


    # Contratada Principal
    Execute Javascript    document.body.style.zoom='100%'
    Sleep    2
    Wait Until Element Is Visible    //input[contains(@name,'autContratadaPrincipal')]    10
    Input Text    //input[contains(@name,'autContratadaPrincipal')]    A B S TRANSPORTES E TURISMO LTDA EPP
    Sleep    2
    Click Element    //li[contains(.,'A B S TRANSPORTES E TURISMO LTDA EPP')]

    # Grupo de compras
    Wait Until Element Is Visible    //input[contains(@name,'autGrupoCompras')]    10
    Input Text    //input[contains(@name,'autGrupoCompras')]    SECRETARIA DE ADMINISTRAÇÃO
    Sleep    2
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Grupo de Compras Padrão - SECRETARIA DE ADMINISTRAÇÃO')]    10
    Click Element    //li[@tabindex='-1'][contains(.,'Grupo de Compras Padrão - SECRETARIA DE ADMINISTRAÇÃO')]

    # Salvar
    Wait Until Element Is Visible    //a[contains(@onclick,'salvar(false);')]    15
    Click Element    //a[contains(@onclick,'salvar(false);')]
    Sleep    3
    
    Scroll Element Into View    //span[@id='lbl_ctl00_ContentPrincipal_tbxNrSolicitacaoContrato']
    Sleep    1

    # Capturar o valor do campo depois que ele for preenchido
    ${NUM_GC_ARP}    SeleniumLibrary.Get Text    ${INPUT_NUM_GC}

    # Salvar o valor em um arquivo de texto
    Create File    ${EXECDIR}/test/processos/Num_GC_ARP.txt    ${NUM_GC_ARP}
    Capture Page Screenshot
    Close Browser


Então crio um Contrato Novo

    ${Dt_inicio_cont}=    Get Current Date    result_format=%d-%m-%Y    # increment=-1d
    ${Dt_enc_cont}=    Get Current Date    result_format=%d-%m-%Y    increment=+180d
    Log    Data futura: ${Dt_enc_cont}

    # Tipo de contrato - Novo
    Wait Until Element Is Visible    //input[@id='ctl00_ContentPrincipal_rbtContrato_0']    20
    Click Element    //input[@id='ctl00_ContentPrincipal_rbtContrato_0']


    # Lupa de Número da GC
    Wait Until Element Is Visible    //a[@onclick='abrirJanelaNrSolicitacaoContrato();']    10
    Click Element    //a[@onclick='abrirJanelaNrSolicitacaoContrato();']

    Switch Window
    Select Frame    //frame[@name='main']

    ${NUM_GC}    Get File    ${EXECDIR}/test/processos/num_gc.txt

    Execute Javascript    document.body.style.zoom='80%'
    Sleep    2
    Wait Until Element Is Visible    //input[@name='ctl00$ContentPrincipal$numeroSolicitacao']    10
    Input Text    //input[@name='ctl00$ContentPrincipal$numeroSolicitacao']    ${NUM_GC}

    # Clique para pesquisar o processo
    Wait Until Element Is Visible    //a[contains(.,'Pesquisar')]    15
    Click Element    //a[contains(.,'Pesquisar')]
    Sleep    1

    # clique para selecionar o processo
    Wait Until Element Is Visible    //input[@name='checkSolicitacao']    15
    Click Element    //input[@name='checkSolicitacao']
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    15
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    2


    # Tipo de contrato
    Execute Javascript    document.body.style.zoom='100%'
    Sleep    2
    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlTipoContrato_listbox']    10
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlTipoContrato_listbox']
    Sleep    1
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Fornecimento')]    10
    Click Element    //li[@tabindex='-1'][contains(.,'Fornecimento')]
    Capture Page Screenshot

    # Objeto
    Wait Until Element Is Visible    //textarea[contains(@name,'txtObjeto')]    10
    Sleep    1
    Clear Element Text    //textarea[contains(@name,'txtObjeto')]
    Sleep    1
    Input Text    //textarea[contains(@name,'txtObjeto')]    ${OBJETO_CONTRATO_NOVO}

    # Data Inico contrato
    Wait Until Element Is Visible    id=ctl00_ContentPrincipal_tDtInicio
    Click Element    id=ctl00_ContentPrincipal_tDtInicio
    Sleep    2
    Set Focus To Element    id=ctl00_ContentPrincipal_tDtInicio
    Execute JavaScript    document.getElementById("ctl00_ContentPrincipal_tDtInicio").value="${Dt_inicio_cont}";
    Sleep    2
    
    # Data Encerramento
    Wait Until Element Is Visible    id=ctl00_ContentPrincipal_tDtEncerramento
    Click Element    id=ctl00_ContentPrincipal_tDtEncerramento
    Sleep    2
    Set Focus To Element    id=ctl00_ContentPrincipal_tDtEncerramento
    Execute JavaScript    document.getElementById("ctl00_ContentPrincipal_tDtEncerramento").value="${Dt_enc_cont}";
    Sleep    2

    # Tipo Garantia
    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlTipoGarantia_listbox']    10
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlTipoGarantia_listbox']
    Sleep    1
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Nenhum')]    10
    Click Element    //li[@tabindex='-1'][contains(.,'Nenhum')]
    Capture Page Screenshot

    # Salvar
    Wait Until Element Is Visible    //a[@onclick='Salvar(false);']    15
    Click Element    //a[@onclick='Salvar(false);']
    Sleep    3

    # Capturar o valor do campo depois que ele for preenchido
    Scroll Element Into View    ${INPTU_NUM_CONTRATO}
    Sleep    1
    ${NUM_CONTRATO}    SeleniumLibrary.Get Text    ${INPTU_NUM_CONTRATO}

    # Salvar o valor em um arquivo de texto
    Create File    ${EXECDIR}/test/processos/Num_Contrato.txt    ${NUM_CONTRATO}
    Capture Page Screenshot

    Close Browser





Então crio um novo contrato PE ARP

    ${Dt_inicio_cont}=    Get Current Date    result_format=%d-%m-%Y    increment=-1d
    ${Dt_enc_cont}=    Get Current Date    result_format=%d-%m-%Y    increment=+180d
    Log    Data futura: ${Dt_enc_cont}

    # Tipo de contrato - Legado
    Wait Until Element Is Visible    //input[@id='ctl00_ContentPrincipal_rbtContrato_1']    20
    Click Element    //input[@id='ctl00_ContentPrincipal_rbtContrato_1']

    # Processo realizado no PE-Integrado? - SIM
    Wait Until Element Is Visible    //input[@id='ctl00_ContentPrincipal_rbtProcessoPE_0']    20
    Click Element    //input[@id='ctl00_ContentPrincipal_rbtProcessoPE_0']

    # Genero
    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlGenero_listbox']    15
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlGenero_listbox']
    Sleep    1
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Padrão')]    10
    Click Element    //li[@tabindex='-1'][contains(.,'Padrão')]

    # Processo oriundo de ARP - SIM
    Wait Until Element Is Visible    //input[@id='ctl00_ContentPrincipal_rbtOriundoARP_0']    15
    Click Element    //input[@id='ctl00_ContentPrincipal_rbtOriundoARP_0']

    # # Modalidade - Pregão Eletronico
    # Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlModalidade_listbox']    10
    # Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlModalidade_listbox']
    # Sleep    2
    # Wait Until Element Is Visible    //li[contains(.,'Pregão eletrônico')]    10
    # Click Element    //li[contains(.,'Pregão eletrônico')]


    # Lupa de Ata Registro Preço
    Wait Until Element Is Visible    //a[contains(@onclick,'abrirJanelaAtaRegistroPrecos();')]    10
    Click Element    //a[contains(@onclick,'abrirJanelaAtaRegistroPrecos();')]

    Switch Window
    Select Frame    //frame[@name='main']

    ${NUM_ARP}    Get File    ${EXECDIR}/test/processos/num_ARP.txt

    Wait Until Element Is Visible    //input[@name='ctl00$ContentPrincipal$tbxNumeroAta']    10
    Input Text    //input[@name='ctl00$ContentPrincipal$tbxNumeroAta']    ${NUM_ARP}

    # Clique para pesquisar o processo
    Wait Until Element Is Visible    //a[contains(.,'Pesquisar')]    15
    Click Element    //a[contains(.,'Pesquisar')]
    Sleep    1

    # clique para selecionar o processo
    Wait Until Element Is Visible    //input[contains(@name,'radioProcesso')]    15
    Click Element    //input[contains(@name,'radioProcesso')]
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    15
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    2

    # Contratante principal
    Wait Until Element Is Visible    //input[contains(@name,'autContratantePrincipal')]    10
    Input Text    //input[contains(@name,'autContratantePrincipal')]    SECRETARIA DE ADMINISTRAÇÃO
    Sleep    2
    Wait Until Element Is Visible    //li[contains(.,'SECRETARIA DE ADMINISTRAÇÃO')]    10
    Click Element    //li[contains(.,'SECRETARIA DE ADMINISTRAÇÃO')]


    # Contratada Principal
    Wait Until Element Is Visible    //input[contains(@name,'autContratadaPrincipal')]    10
    Input Text    //input[contains(@name,'autContratadaPrincipal')]    A B S TRANSPORTES E TURISMO LTDA EPP
    Sleep    2
    Click Element    //li[contains(.,'A B S TRANSPORTES E TURISMO LTDA EPP')]

    # Grupo de compras
    Wait Until Element Is Visible    //input[contains(@name,'autGrupoCompras')]    10
    Input Text    //input[contains(@name,'autGrupoCompras')]    SECRETARIA DE ADMINISTRAÇÃO
    Sleep    2
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Grupo de Compras Padrão - SECRETARIA DE ADMINISTRAÇÃO')]    10
    Click Element    //li[@tabindex='-1'][contains(.,'Grupo de Compras Padrão - SECRETARIA DE ADMINISTRAÇÃO')]

    # Tipo de contrato
    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlTipoContrato_listbox']    10
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlTipoContrato_listbox']
    Sleep    1
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Fornecimento')]    10
    Click Element    //li[@tabindex='-1'][contains(.,'Fornecimento')]
    Capture Page Screenshot

    # Objeto
    Wait Until Element Is Visible    //textarea[contains(@name,'txtObjeto')]    10
    Input Text    //textarea[contains(@name,'txtObjeto')]    ${OBJETO_CONTRATO}

    # Tipo de objeto
    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlTipoObjeto_listbox']    10
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlTipoObjeto_listbox']
    Sleep    2
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'AERONAVE E ACESSÓRIOS')]    10
    Click Element    //li[@tabindex='-1'][contains(.,'AERONAVE E ACESSÓRIOS')]

    # Data Inico contrato
    Wait Until Element Is Visible    id=ctl00_ContentPrincipal_tDtInicio
    Click Element    id=ctl00_ContentPrincipal_tDtInicio
    Sleep    2
    Set Focus To Element    id=ctl00_ContentPrincipal_tDtInicio
    Execute JavaScript    document.getElementById("ctl00_ContentPrincipal_tDtInicio").value="${Dt_inicio_cont}";
    Sleep    2
   
   # Data assinatura
    Wait Until Element Is Visible    id=ctl00_ContentPrincipal_tDtAssinaturaContratoLegado
    Click Element    id=ctl00_ContentPrincipal_tDtAssinaturaContratoLegado
    Sleep    2
    Set Focus To Element    id=ctl00_ContentPrincipal_tDtAssinaturaContratoLegado
    Execute JavaScript    document.getElementById("ctl00_ContentPrincipal_tDtAssinaturaContratoLegado").value="${Dt_inicio_cont}";
    Sleep    2
    
    # Data Encerramento
    Wait Until Element Is Visible    id=ctl00_ContentPrincipal_tDtEncerramento
    Click Element    id=ctl00_ContentPrincipal_tDtEncerramento
    Sleep    2
    Set Focus To Element    id=ctl00_ContentPrincipal_tDtEncerramento
    Execute JavaScript    document.getElementById("ctl00_ContentPrincipal_tDtEncerramento").value="${Dt_enc_cont}";
    Sleep    2

    # Tipo Garantia
    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlTipoGarantia_listbox']    10
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlTipoGarantia_listbox']
    Sleep    1
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Nenhum')]    10
    Click Element    //li[@tabindex='-1'][contains(.,'Nenhum')]
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[@onclick='Salvar(false);']    15
    Click Element    //a[@onclick='Salvar(false);']
    Sleep    3
    Close Browser


Então crio um novo contrato PE não ARP

    ${Dt_inicio_cont}=    Get Current Date    result_format=%d-%m-%Y    increment=-1d
    ${Dt_enc_cont}=    Get Current Date    result_format=%d-%m-%Y    increment=+180d
    Log    Data futura: ${Dt_enc_cont}

    # Select Frame    //iframe[@name='frmConteudo']
    # Wait Until Element Is Visible    //a[contains(.,'Incluir')]    30
    # Click Element    //a[contains(.,'Incluir')]

    # Switch Window    
    # Select Frame    //frame[contains(@name,'main')]

    # Tipo de contrato - Legado
    Wait Until Element Is Visible    //input[@id='ctl00_ContentPrincipal_rbtContrato_1']    20
    Click Element    //input[@id='ctl00_ContentPrincipal_rbtContrato_1']

    # Processo realizado no PE-Integrado? - SIM
    Wait Until Element Is Visible    //input[@id='ctl00_ContentPrincipal_rbtProcessoPE_0']    20
    Click Element    //input[@id='ctl00_ContentPrincipal_rbtProcessoPE_0']


    # Genero
    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlGenero_listbox']    15
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlGenero_listbox']
    Sleep    1
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Padrão')]    10
    Click Element    //li[@tabindex='-1'][contains(.,'Padrão')]


    # Processo oriundo de ARP - Não
    Wait Until Element Is Visible    //input[@id='ctl00_ContentPrincipal_rbtOriundoARP_1']    15
    Click Element    //input[@id='ctl00_ContentPrincipal_rbtOriundoARP_1']


    # Lupa Numero do processo
    Wait Until Element Is Visible    //a[contains(@onclick,'abrirJanelaNumeroProcesso();')]    10
    Click Element    //a[contains(@onclick,'abrirJanelaNumeroProcesso();')]

    Switch Window
    Select Frame    //frame[@name='main']
    ${NUM_PROC_PREGAO}    Get File    ${EXECDIR}/test/processos/num_proc_pregao.txt
    Wait Until Element Is Visible    //input[@name='ctl00$ContentPrincipal$numeroProcesso']    10
    Input Text    //input[@name='ctl00$ContentPrincipal$numeroProcesso']    ${NUM_PROC_PREGAO}

    # Clique para pesquisar o processo
    Wait Until Element Is Visible    //a[contains(.,'Pesquisar')]    15
    Click Element    //a[contains(.,'Pesquisar')]
    Sleep    1

    # clique para selecionar o processo
    Wait Until Element Is Visible    //input[contains(@name,'radioProcesso')]    15
    Click Element    //input[contains(@name,'radioProcesso')]
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    15
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    2

    # Contratante principal
    Wait Until Element Is Visible    //input[contains(@name,'autContratantePrincipal')]    10
    Input Text    //input[contains(@name,'autContratantePrincipal')]    SECRETARIA DE ADMINISTRAÇÃO
    Sleep    2
    Wait Until Element Is Visible    //li[contains(.,'SECRETARIA DE ADMINISTRAÇÃO')]    10
    Click Element    //li[contains(.,'SECRETARIA DE ADMINISTRAÇÃO')]


    # Contratada Principal
    Wait Until Element Is Visible    //input[contains(@name,'autContratadaPrincipal')]    10
    Input Text    //input[contains(@name,'autContratadaPrincipal')]    A B S TRANSPORTES E TURISMO LTDA EPP
    Sleep    2
    Click Element    //li[contains(.,'A B S TRANSPORTES E TURISMO LTDA EPP')]

    # Grupo de compras
    Wait Until Element Is Visible    //input[contains(@name,'autGrupoCompras')]    10
    Input Text    //input[contains(@name,'autGrupoCompras')]    SECRETARIA DE ADMINISTRAÇÃO
    Sleep    2
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Grupo de Compras Padrão - SECRETARIA DE ADMINISTRAÇÃO')]    10
    Click Element    //li[@tabindex='-1'][contains(.,'Grupo de Compras Padrão - SECRETARIA DE ADMINISTRAÇÃO')]

    # Tipo de contrato
    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlTipoContrato_listbox']    10
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlTipoContrato_listbox']
    Sleep    1
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Fornecimento')]    10
    Click Element    //li[@tabindex='-1'][contains(.,'Fornecimento')]
    Capture Page Screenshot

    # Objeto
    Wait Until Element Is Visible    //textarea[contains(@name,'txtObjeto')]    10
    Input Text    //textarea[contains(@name,'txtObjeto')]    ${OBJETO_CONTRATO}

    # Tipo de objeto
    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlTipoObjeto_listbox']    10
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlTipoObjeto_listbox']
    Sleep    2
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'AERONAVE E ACESSÓRIOS')]    10
    Click Element    //li[@tabindex='-1'][contains(.,'AERONAVE E ACESSÓRIOS')]

    # Data Inico contrato
    Wait Until Element Is Visible    id=ctl00_ContentPrincipal_tDtInicio
    Click Element    id=ctl00_ContentPrincipal_tDtInicio
    Sleep    2
    Set Focus To Element    id=ctl00_ContentPrincipal_tDtInicio
    Execute JavaScript    document.getElementById("ctl00_ContentPrincipal_tDtInicio").value="${Dt_inicio_cont}";
    Sleep    2
   
   # Data assinatura
    Wait Until Element Is Visible    id=ctl00_ContentPrincipal_tDtAssinaturaContratoLegado
    Click Element    id=ctl00_ContentPrincipal_tDtAssinaturaContratoLegado
    Sleep    2
    Set Focus To Element    id=ctl00_ContentPrincipal_tDtAssinaturaContratoLegado
    Execute JavaScript    document.getElementById("ctl00_ContentPrincipal_tDtAssinaturaContratoLegado").value="${Dt_inicio_cont}";
    Sleep    2
    
    # Data Encerramento
    Wait Until Element Is Visible    id=ctl00_ContentPrincipal_tDtEncerramento
    Click Element    id=ctl00_ContentPrincipal_tDtEncerramento
    Sleep    2
    Set Focus To Element    id=ctl00_ContentPrincipal_tDtEncerramento
    Execute JavaScript    document.getElementById("ctl00_ContentPrincipal_tDtEncerramento").value="${Dt_enc_cont}";
    Sleep    2

    # Tipo Garantia
    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlTipoGarantia_listbox']    10
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlTipoGarantia_listbox']
    Sleep    1
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Nenhum')]    10
    Click Element    //li[@tabindex='-1'][contains(.,'Nenhum')]
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[@onclick='Salvar(false);']    15
    Click Element    //a[@onclick='Salvar(false);']
    Sleep    3
    Close Browser


E acesso a tela de criar contrato
    Select Frame    //iframe[@name='frmConteudo']
    Wait Until Element Is Visible    //a[contains(.,'Incluir')]    30
    Click Element    //a[contains(.,'Incluir')]

    Switch Window    
    Select Frame    //frame[contains(@name,'main')]
    Sleep    2
    Capture Page Screenshot


Então crio um novo contrato não PE

    ${Dt_inicio_cont}=    Get Current Date    result_format=%d-%m-%Y    increment=-1d
    ${Dt_enc_cont}=    Get Current Date    result_format=%d-%m-%Y    increment=+180d
    Log    Data futura: ${Dt_enc_cont}

    # Tipo de contrato - Legado
    Wait Until Element Is Visible    //input[@id='ctl00_ContentPrincipal_rbtContrato_1']    20
    Click Element    //input[@id='ctl00_ContentPrincipal_rbtContrato_1']

    # Processo realizado no PE-Integrado? - Não
    Wait Until Element Is Visible    //input[@id='ctl00_ContentPrincipal_rbtProcessoPE_1']    20
    Click Element    //input[@id='ctl00_ContentPrincipal_rbtProcessoPE_1']

    # Genero
    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlGenero_listbox']    15
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlGenero_listbox']
    Sleep    1
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Padrão')]    10
    Click Element    //li[@tabindex='-1'][contains(.,'Padrão')]

    # Modalidade
    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlModalidade_listbox']    15
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlModalidade_listbox']
    Sleep    1
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Pregão eletrônico')]    15
    Click Element    //li[@tabindex='-1'][contains(.,'Pregão eletrônico')]

    # Numero do processo
    Wait Until Element Is Visible    //input[contains(@name,'tbxNrProcesso')]    10
    Input Text    //input[contains(@name,'tbxNrProcesso')]    123456

    # Contratante principal
    Wait Until Element Is Visible    //input[contains(@name,'autContratantePrincipal')]    10
    Input Text    //input[contains(@name,'autContratantePrincipal')]    SECRETARIA DE ADMINISTRAÇÃO
    Sleep    2
    Wait Until Element Is Visible    //li[contains(.,'SECRETARIA DE ADMINISTRAÇÃO')]    10
    Click Element    //li[contains(.,'SECRETARIA DE ADMINISTRAÇÃO')]

    # Critério
    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlCriterioModalidade_listbox']    10
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlCriterioModalidade_listbox']
    Sleep    1
    Wait Until Element Is Visible    //li[contains(.,'PREGÃO ELETRÔNICO - LEI FEDERAL 14.133/21')]    10
    Click Element    //li[contains(.,'PREGÃO ELETRÔNICO - LEI FEDERAL 14.133/21')]

    # Contratada Principal
    Wait Until Element Is Visible    //input[contains(@name,'autContratadaPrincipal')]    10
    Input Text    //input[contains(@name,'autContratadaPrincipal')]    C. MARTINS COMERCIAL LTDA - ME
    Sleep    2
    Click Element    //li[contains(.,'C. MARTINS COMERCIAL LTDA - ME')]

    # Grupo de compras
    Wait Until Element Is Visible    //input[contains(@name,'autGrupoCompras')]    10
    Input Text    //input[contains(@name,'autGrupoCompras')]    SECRETARIA DE ADMINISTRAÇÃO
    Sleep    2
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Grupo de Compras Padrão - SECRETARIA DE ADMINISTRAÇÃO')]    10
    Click Element    //li[@tabindex='-1'][contains(.,'Grupo de Compras Padrão - SECRETARIA DE ADMINISTRAÇÃO')]

    # Tipo de contrato
    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlTipoContrato_listbox']    10
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlTipoContrato_listbox']
    Sleep    1
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Fornecimento')]    10
    Click Element    //li[@tabindex='-1'][contains(.,'Fornecimento')]

    # Departamento
    Wait Until Element Is Visible    //input[contains(@name,'autDepartamento')]    10
    Input Text    //input[contains(@name,'autDepartamento')]    SECRETARIA DE ADMINISTRAÇÃO
    Sleep    1
    Wait Until Element Is Visible    //li[contains(.,'[P]-SECRETARIA DE ADMINISTRAÇÃO')]    10
    Click Element    //li[contains(.,'[P]-SECRETARIA DE ADMINISTRAÇÃO')]
    Capture Page Screenshot

    # Objeto
    Wait Until Element Is Visible    //textarea[contains(@name,'txtObjeto')]    10
    Input Text    //textarea[contains(@name,'txtObjeto')]    ${OBJETO_CONTRATO}

    # Tipo de objeto
    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlTipoObjeto_listbox']    10
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlTipoObjeto_listbox']
    Sleep    2
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'AERONAVE E ACESSÓRIOS')]    10
    Click Element    //li[@tabindex='-1'][contains(.,'AERONAVE E ACESSÓRIOS')]

    # Data Inico contrato
    Wait Until Element Is Visible    id=ctl00_ContentPrincipal_tDtInicio
    Click Element    id=ctl00_ContentPrincipal_tDtInicio
    Sleep    2
    Set Focus To Element    id=ctl00_ContentPrincipal_tDtInicio
    Execute JavaScript    document.getElementById("ctl00_ContentPrincipal_tDtInicio").value="${Dt_inicio_cont}";
    Sleep    2
   
   # Data assinatura
    Wait Until Element Is Visible    id=ctl00_ContentPrincipal_tDtAssinaturaContratoLegado
    Click Element    id=ctl00_ContentPrincipal_tDtAssinaturaContratoLegado
    Sleep    2
    Set Focus To Element    id=ctl00_ContentPrincipal_tDtAssinaturaContratoLegado
    Execute JavaScript    document.getElementById("ctl00_ContentPrincipal_tDtAssinaturaContratoLegado").value="${Dt_inicio_cont}";
    Sleep    2
    
    # Data Encerramento
    Wait Until Element Is Visible    id=ctl00_ContentPrincipal_tDtEncerramento
    Click Element    id=ctl00_ContentPrincipal_tDtEncerramento
    Sleep    2
    Set Focus To Element    id=ctl00_ContentPrincipal_tDtEncerramento
    Execute JavaScript    document.getElementById("ctl00_ContentPrincipal_tDtEncerramento").value="${Dt_enc_cont}";
    Sleep    2

    # Tipo Garantia
    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlTipoGarantia_listbox']    10
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlTipoGarantia_listbox']
    Sleep    1
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Nenhum')]    10
    Click Element    //li[@tabindex='-1'][contains(.,'Nenhum')]
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[@onclick='Salvar(false);']    15
    Click Element    //a[@onclick='Salvar(false);']
    Sleep    3
    Close Browser
   

E acesso o contrato novo da Lista

    ${NUM_CONTRATO}    Get File    ${EXECDIR}/test/processos/Num_Contrato.txt
    Select Frame    //iframe[@name='frmConteudo']
    Wait Until Element Is Visible    //table[@id='ctl00_ContentPrincipal_dtgPesquisa']//tr[td//a[contains(text(), '${NUM_CONTRATO}')]]//td[2]//a    15
    Click Element        //table[@id='ctl00_ContentPrincipal_dtgPesquisa']//tr[td//a[contains(text(), '${NUM_CONTRATO}')]]//td[2]//a
    Sleep    2

E acesso a aba 'Docs. assinatura'
    Switch Window
    Select Frame    //frame[@name='main']
    Wait Until Element Is Visible    //span[contains(.,'Docs. assinatura')]    10
    Click Element    //span[contains(.,'Docs. assinatura')]
    Sleep    2
    Capture Page Screenshot


E acesso o Contrato da Lista

    ${NUM_ARP}    Get File    ${EXECDIR}/test/processos/num_ARP.txt
    Select Frame    //iframe[@name='frmConteudo']
    Wait Until Element Is Visible    //table[@id='ctl00_ContentPrincipal_dtgPesquisa']//tr[td[contains(text(), '${OBJETO_CONTRATO}')]]//td[2]//a    15
    Click Element        //table[@id='ctl00_ContentPrincipal_dtgPesquisa']//tr[td[contains(text(), '${OBJETO_CONTRATO}')]]//td[2]//a
    Sleep    2

Então configuro a aba Partes do contrato PE não ARP

    # Representante da Contratante
    Sleep    2
    ${ELEMENTOS}    Get WebElements    //span[@unselectable='on'][contains(.,'Selecione')]
    ${DROP_LIST}    Set Variable    ${ELEMENTOS}[6]
    Sleep    3
    Click Element    ${DROP_LIST}
    Sleep    2

    ${ELEMENTOS}    Get WebElements    //li[@tabindex='-1'][contains(.,'Competente - Representante da SAD')]
    ${DROP_LIST2}    Set Variable    ${ELEMENTOS}[1]
    Sleep    1
    Click Element    ${DROP_LIST2}
    Sleep    2


    # Representante da Contratada
    ${ELEMENTOS1}    Get WebElements    //span[@unselectable='on'][contains(.,'Selecione')]
    ${DROP_LIST3}    Set Variable    ${ELEMENTOS1}[8]
    Sleep    1
    Click Element    ${DROP_LIST3}
    Sleep    2

    ${ELEMENTOS2}    Get WebElements    //li[@tabindex='-1'][contains(.,'A B S Transporte')]
    ${DROP_LIST4}    Set Variable    ${ELEMENTOS2}[1]
    Sleep    1
    Click Element    ${DROP_LIST4}
    Sleep    1
    Capture Page Screenshot

    Scroll Element Into View    //a[@onclick='salvar(false);'][contains(@id,'btnSalvarPartes')][contains(.,'Salvar')]

    Sleep    2
    Wait Until Element Is Visible    //a[@onclick='salvar(false);'][contains(@id,'btnSalvarPartes')][contains(.,'Salvar')]    10
    Click Element    //a[@onclick='salvar(false);'][contains(@id,'btnSalvarPartes')][contains(.,'Salvar')]
    Sleep    3
    Close Browser


E acesso a aba 'Partes'
    Switch Window
    Select Frame    //frame[@name='main']
    Wait Until Element Is Visible    //span[contains(.,'Partes')]    10
    Click Element    //span[contains(.,'Partes')]
    Sleep    2
    Capture Page Screenshot


Então configuro a aba Partes do contrato

    # Representante da Contratante
    Sleep    2
    ${ELEMENTOS}    Get WebElements    //span[@class='k-widget k-dropdown k-header'][contains(.,'Selecione')]
    ${DROP_LIST}    Set Variable    ${ELEMENTOS}[2]
    Sleep    2
    Click Element    ${DROP_LIST}
    Sleep    2

    ${ELEMENTOS}    Get WebElements    //li[@tabindex='-1'][contains(.,'Usuário Autoridade')]
    ${DROP_LIST2}    Set Variable    ${ELEMENTOS}[1]
    Sleep    1
    Click Element    ${DROP_LIST2}
    Sleep    1

    # Representante da Contratada
    ${ELEMENTOS}    Get WebElements    //span[@class='k-widget k-dropdown k-header'][contains(.,'Selecione')]
    Sleep    1
    ${DROP_LIST3}    Set Variable    ${ELEMENTOS}[2]
    Sleep    1
    Click Element    ${DROP_LIST3}
    Sleep    2

    ${ELEMENTOS}    Get WebElements    //li[@tabindex='-1'][contains(.,'C.MARTINS')]
    ${DROP_LIST4}    Set Variable    ${ELEMENTOS}[1]
    Sleep    1
    Click Element    ${DROP_LIST4}
    Sleep    1
    Capture Page Screenshot

    Scroll Element Into View    //a[@onclick='salvar(false);'][contains(@id,'btnSalvarPartes')][contains(.,'Salvar')]

    Sleep    2
    Wait Until Element Is Visible    //a[@onclick='salvar(false);'][contains(@id,'btnSalvarPartes')][contains(.,'Salvar')]    10
    Click Element    //a[@onclick='salvar(false);'][contains(@id,'btnSalvarPartes')][contains(.,'Salvar')]
    Sleep    3
    Close Browser


E acesso a tela de 'Definir Índice' 

    Wait Until Element Is Visible    //a[contains(.,'Definir Índice')]    10
    Click Element    //a[contains(.,'Definir Índice')]

    Switch Window
    Select Frame    //frame[@name='main']
    Sleep    2
    Capture Page Screenshot


Então defino os índices dos itens

    Wait Until Element Is Visible    //select[contains(@name,'dropIndice')]    10
    Click Element    //select[contains(@name,'dropIndice')]
    Sleep    1
    Wait Until Element Is Visible    //option[@value='IGP-M'][contains(.,'IGP-M')]    10
    Click Element    //option[@value='IGP-M'][contains(.,'IGP-M')]

    Wait Until Element Is Visible    //button[contains(.,'Incluir')]    10
    Click Element    //button[contains(.,'Incluir')]

    Wait Until Element Is Visible    //input[contains(@name,'btnTodos')]    10
    Click Element    //input[contains(@name,'btnTodos')]
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[@onclick='salvarItemIndice2();'][contains(@id,'salvarItens')][contains(.,'Salvar')]    10
    Click Element    //a[@onclick='salvarItemIndice2();'][contains(@id,'salvarItens')][contains(.,'Salvar')]
    Sleep    3
    Close Browser


E acesso a tela de 'Selecionar Itens'
    Switch Window
    Select Frame    //frame[@name='main']
    Wait Until Element Is Visible    //a[@onclick='incluirItens()'][contains(@id,'btnIncluir')][contains(.,'Incluir')]    20
    Click Element    //a[@onclick='incluirItens()'][contains(@id,'btnIncluir')][contains(.,'Incluir')]
    Sleep    2
    Capture Page Screenshot


Então incluo os itens ao contrato
    Switch Window
    Select Frame    //frame[@name='main']
    Wait Until Element Is Visible        //input[contains(@name,'chbItemProcesso')]    10
    Click Element    //input[contains(@name,'chbItemProcesso')]

    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    10
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    03


E acesso a aba 'Itens'

    Switch Window
    Select Frame    //frame[@name='main']
    Wait Until Element Is Visible    //span[contains(.,'Itens')]    10
    Click Element    //span[contains(.,'Itens')]
    Sleep    2
    Capture Page Screenshot
    Execute Javascript    document.body.style.zoom='80%'


E acesso a tela de Incluir Itens no Contrato

    # Clique em 'Incluir' na aba 'Itens'
    Wait Until Element Is Visible    //a[contains(.,'Incluir')]    15
    Click Element    //a[contains(.,'Incluir')]
    Sleep    3
    Capture Page Screenshot

E acesso a tela de selecionar Itens GC ARP

    Wait Until Element Is Visible    //a[contains(.,'Incluir')]    20
    Click Element    //a[contains(.,'Incluir')]
    Sleep    2
    Capture Page Screenshot
    
    Switch Window
    Select Frame    //frame[contains(@name,'main')]
    Execute Javascript    document.body.style.zoom='90%'
    Sleep    2


Então incluo os itens na GC ARP

    Wait Until Element Is Visible    //input[@name='chbItemProcesso']    10
    Click Element    //input[@name='chbItemProcesso']
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    10
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    3


Então incluo os itens no Contrato Não ARP e Não PE

    FOR    ${i}    IN RANGE    2
        ${codigo_produto}=    Set Variable    ${CODIGOS_PRODUTOS}[${i}]
        Sleep    2
        Set Focus To Element    //a[contains(.,'Incluir')]
        Wait Until Element Is Visible    //a[contains(.,'Incluir')]    20
        Click Element    //a[contains(.,'Incluir')]
        Sleep    2
        Capture Page Screenshot
    
        Switch Window
        Select Frame    //frame[contains(@name,'main')]

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
        Sleep    4
        Capture Page Screenshot
    END

    # Quantidade - Unidade - Valor unitário
    # Item 01
    Wait Until Element Is Visible    //tbody[1]/tr[1]/td[2]/span[1]/span[1]/input[1]    10
    Input Text    //tbody[1]/tr[1]/td[2]/span[1]/span[1]/input[1]    500

    Sleep    1
    Wait Until Element Is Visible    //span[@class='k-widget k-dropdown k-header'][contains(.,'Selecione SelecioneTBO 6 MTBO 60 GRUN')]
    Click Element    //span[@class='k-widget k-dropdown k-header'][contains(.,'Selecione SelecioneTBO 6 MTBO 60 GRUN')]
    Sleep    2
   
    # Unidade de Medida
    ${ELEMENTOS}    Get WebElements    //li[@tabindex='-1'][contains(.,'TBO 6 M')]
    ${List}    Set Variable    ${ELEMENTOS}[1]
    Sleep    2
    Wait Until Element Is Visible    ${List}
    Click Element    ${List}

    # Valor Unitário
    Sleep    1
    ${ELEMENTOS2}    Get WebElements    //input[contains(@class,'k-formatted-value numeric k-input')]
    ${List2}    Set Variable    ${ELEMENTOS2}[1]
    Wait Until Element Is Visible    ${List2}
    Input Text    ${List2}    9


    # Item 02
    Sleep    2
    Wait Until Element Is Visible    //tbody[1]/tr[2]/td[2]/span[1]/span[1]/input[1]    10
    Input Text    //tbody[1]/tr[2]/td[2]/span[1]/span[1]/input[1]    680

    Sleep    1
    Wait Until Element Is Visible    //span[@class='k-widget k-dropdown k-header'][contains(.,'Selecione SelecioneCX 50 UNIDADESUN')]    10
    Click Element    //span[@class='k-widget k-dropdown k-header'][contains(.,'Selecione SelecioneCX 50 UNIDADESUN')]
    Sleep    2

    # Unidade de Medida
    ${ELEMENTO3}    Get WebElements    //li[@tabindex='-1'][contains(.,'CX 50 UNIDADES')]
    ${List3}    Set Variable    ${ELEMENTO3}[0]
    Sleep    2
    Wait Until Element Is Visible    ${List3}
    Click Element    ${List3}

    # Valor Unitário
    Sleep    1
    ${ELEMENTOS4}    Get WebElements    //input[contains(@class,'k-formatted-value numeric k-input')]
    ${List4}    Set Variable    ${ELEMENTOS4}[4]
    Wait Until Element Is Visible    ${List4}
    Input Text    ${List4}    12
    Sleep    2
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[@onclick='salvarItens();']    10
    Click Element    //a[@onclick='salvarItens();']
    Sleep    3
    Close Browser
    

Então incluo os itens no Contrato

    FOR    ${i}    IN RANGE    2
        ${codigo_produto}=    Set Variable    ${CODIGOS_PRODUTOS}[${i}]
        Sleep    2
        Set Focus To Element    //a[contains(.,'Incluir')]
        Wait Until Element Is Visible    //a[contains(.,'Incluir')]    20
        Click Element    //a[contains(.,'Incluir')]
        Sleep    2
        Capture Page Screenshot
    
        Switch Window
        Select Frame    //frame[contains(@name,'main')]

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
        Sleep    4
        Capture Page Screenshot
    END

    # Quantidade - Unidade - Valor unitário
    # Item 01
    Wait Until Element Is Visible    //tbody[1]/tr[1]/td[2]/span[1]/span[1]/input[1]    10
    Input Text    //tbody[1]/tr[1]/td[2]/span[1]/span[1]/input[1]    500

    Sleep    1
    Wait Until Element Is Visible    //span[@class='k-widget k-dropdown k-header'][contains(.,'Selecione SelecioneTBO 6 MTBO 60 GRUN')]
    Click Element    //span[@class='k-widget k-dropdown k-header'][contains(.,'Selecione SelecioneTBO 6 MTBO 60 GRUN')]
    Sleep    2
   
    # Unidade de Medida
    ${ELEMENTOS}    Get WebElements    //li[@tabindex='-1'][contains(.,'TBO 6 M')]
    ${List}    Set Variable    ${ELEMENTOS}[1]
    Sleep    2
    Wait Until Element Is Visible    ${List}
    Click Element    ${List}

    # Valor Unitário
    Sleep    1
    ${ELEMENTOS2}    Get WebElements    //input[contains(@class,'k-formatted-value numeric k-input')]
    ${List2}    Set Variable    ${ELEMENTOS2}[1]
    Wait Until Element Is Visible    ${List2}
    Input Text    ${List2}    9


    # Item 02
    Sleep    2
    Wait Until Element Is Visible    //tbody[1]/tr[2]/td[2]/span[1]/span[1]/input[1]    10
    Input Text    //tbody[1]/tr[2]/td[2]/span[1]/span[1]/input[1]    680

    Sleep    1
    Wait Until Element Is Visible    //span[@class='k-widget k-dropdown k-header'][contains(.,'Selecione SelecioneCX 50 UNIDADESUN')]    10
    Click Element    //span[@class='k-widget k-dropdown k-header'][contains(.,'Selecione SelecioneCX 50 UNIDADESUN')]
    Sleep    2

    # Unidade de Medida
    ${ELEMENTO3}    Get WebElements    //li[@tabindex='-1'][contains(.,'CX 50 UNIDADES')]
    ${List3}    Set Variable    ${ELEMENTO3}[0]
    Sleep    2
    Wait Until Element Is Visible    ${List3}
    Click Element    ${List3}

    # Valor Unitário
    Sleep    1
    ${ELEMENTOS4}    Get WebElements    //input[contains(@class,'k-formatted-value numeric k-input')]
    ${List4}    Set Variable    ${ELEMENTOS4}[4]
    Wait Until Element Is Visible    ${List4}
    Input Text    ${List4}    12
    Sleep    2
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[@onclick='salvarItens();'][contains(@id,'salvarItens')][contains(.,'Salvar')]    10
    Click Element    //a[@onclick='salvarItens();'][contains(@id,'salvarItens')][contains(.,'Salvar')]
    Sleep    3
    
    # Definir Indice
    Wait Until Element Is Visible    //a[contains(.,'Definir Índice')]    10
    Click Element    //a[contains(.,'Definir Índice')]
    Sleep    2
    Capture Page Screenshot

    Switch Window
    Select Frame    //frame[@name='main']
    Wait Until Element Is Visible    //select[contains(@name,'dropIndice')]    10
    Click Element    //select[contains(@name,'dropIndice')]
    Sleep    1
    Wait Until Element Is Visible    //option[@value='IGP-M'][contains(.,'IGP-M')]    10
    Click Element    //option[@value='IGP-M'][contains(.,'IGP-M')]

    Wait Until Element Is Visible    //button[contains(.,'Incluir')]    10
    Click Element    //button[contains(.,'Incluir')]

    Wait Until Element Is Visible    //input[contains(@name,'btnTodos')]    10
    Click Element    //input[contains(@name,'btnTodos')]
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[@onclick='salvarItemIndice2();'][contains(@id,'salvarItens')][contains(.,'Salvar')]    10
    Click Element    //a[@onclick='salvarItemIndice2();'][contains(@id,'salvarItens')][contains(.,'Salvar')]
    Sleep    3
    Close Browser

E volta para aba 'Contrato/Termos'
    Wait Until Element Is Visible    //span[contains(.,'Contrato/Termos')]    10
   Click Element    //span[contains(.,'Contrato/Termos')]
   Sleep    2

E volta para aba 'Gestores/Fiscais'
    Wait Until Element Is Visible    //span[contains(.,'Gestores/Fiscais')]    10
   Click Element    //span[contains(.,'Gestores/Fiscais')]
   Sleep    2


Então concluo a Análise Jurídica

    Wait Until Element Is Visible    //input[contains(@name,'ckb_nCdTermo')]    10
    Click Element    //input[contains(@name,'ckb_nCdTermo')]
    Sleep    1

    Wait Until Element Is Visible    //a[contains(.,'Concluir análise jurídica')]    10
    Click Element    //a[contains(.,'Concluir análise jurídica')]
    Sleep    2

    # Incluir anexo
    Wait Until Element Is Visible    //img[contains(@src,'anexo.gif')]    10
    Click Element    //img[contains(@src,'anexo.gif')]
    Sleep    1
    Wait Until Element Is Visible    //input[contains(@type,'file')]    10
    Choose File    css=input[type="file"]    ${EXECDIR}\\test\\Fixtures\\Mod03-Locators.pdf
    Sleep    1
    Wait Until Element Is Visible    //input[@value='Anexar']    10
    Click Element    //input[@value='Anexar']
    Sleep    2

    # Ok no Popup
    Wait Until Element Is Visible    //a[@href='javascript:void(0);'][contains(@id,'mbxAnexo')][contains(.,'OK')]    10
    Capture Page Screenshot
    Click Element    //a[@href='javascript:void(0);'][contains(@id,'mbxAnexo')][contains(.,'OK')]

    Sleep    2
    ${elementos}    Get WebElements    //a[@onclick='FecharJanelaAtual(this);'][contains(@id,'btnFechar')][contains(.,'Fechar')]
    ${elemento}    Set Variable    ${elementos}[2]
    Sleep    1
    Click Element    ${elemento}
    Sleep        2

    # Justificativa
    Wait Until Element Is Visible    //textarea[contains(@name,'txtJustificativa')]    10
    Input Text    //textarea[contains(@name,'txtJustificativa')]    Justificativa
    Capture Page Screenshot
    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    10
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    3






Então Solicito a Análise Jurídica

    Wait Until Element Is Visible    //input[contains(@name,'ckb_nCdTermo')]    10
    Click Element    //input[contains(@name,'ckb_nCdTermo')]
    Sleep    1
    Wait Until Element Is Visible    //a[contains(.,'Solicitar análise jurídica')]    10
    Click Element    //a[contains(.,'Solicitar análise jurídica')]
    Sleep    2

    # Justificativa
    Wait Until Element Is Visible    //textarea[@name='txtJustificativaSolicitarAnalise']    10
    Input Text    //textarea[@name='txtJustificativaSolicitarAnalise']    Justificativa
    Capture Page Screenshot
    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    10
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    3


E acesso a aba 'Contratos/Termos'
    
   Switch Window
   Select Frame    //frame[@name='main']
   Wait Until Element Is Visible    //span[contains(.,'Contrato/Termos')]    10
   Click Element    //span[contains(.,'Contrato/Termos')]
   Sleep    2
   Capture Page Screenshot


E acesso a aba 'Gestores/Fiscais'
    
   Switch Window
   Select Frame    //frame[@name='main']
   Wait Until Element Is Visible    //span[contains(.,'Gestores/Fiscais')]    10
   Click Element    //span[contains(.,'Gestores/Fiscais')]
   Sleep    2
   Capture Page Screenshot

Então faço os aceites

    # Aceite do Gestor
    Wait Until Element Is Visible    //a[@onclick='justificativaAceite(1191, 1)']    10
    Click Element    //a[@onclick='justificativaAceite(1191, 1)']
    Wait Until Element Is Visible    //textarea[@name='txtJustificativaAceite']    10
    Input Text    //textarea[@name='txtJustificativaAceite']    Juatificativa de Aceite
    Capture Page Screenshot
    Wait Until Element Is Visible    //a[contains(.,'Sim')]    10
    Click Element    //a[contains(.,'Sim')]
    Sleep    3

    E volta para aba 'Gestores/Fiscais'

    # Aceite do Gestor
    Wait Until Element Is Visible    //a[contains(@onclick,'justificativaAceite(1192, 1)')]    10
    Click Element    //a[contains(@onclick,'justificativaAceite(1192, 1)')]
    Wait Until Element Is Visible    //textarea[@name='txtJustificativaAceite']    10
    Input Text    //textarea[@name='txtJustificativaAceite']    Juatificativa de Aceite
    Capture Page Screenshot
    Wait Until Element Is Visible    //a[contains(.,'Sim')]    10
    Click Element    //a[contains(.,'Sim')]
    Sleep    3
    Close Browser
    


Então Incluo os Gestortes de Fiscais ao Contrato

   # Datas
   ${Dt_inicio}=    Get Current Date    result_format=%d-%m-%Y
   ${Dt_termino}=    Get Current Date    result_format=%d-%m-%Y    increment=+180d

    FOR    ${i}    IN RANGE    0    2
      ${perfil}    Set Variable    ${PERFIS}[${i}]

      # Clique de Incluir
      Sleep    1
      Wait Until Element Is Visible    //a[@onclick='incluir(configGestorFiscal.Enum.Perfil.${perfil}DeContrato,configGestorFiscal.Enum.${perfil});']    10
      Click Element    //a[@onclick='incluir(configGestorFiscal.Enum.Perfil.${perfil}DeContrato,configGestorFiscal.Enum.${perfil});']

      Switch Window
      Select Frame    //frame[@name='main']
      Wait Until Element Is Visible    //input[contains(@name,'txtUsuario')]    10
      Input Text    //input[contains(@name,'txtUsuario')]    ${USUARIO}

      Wait Until Element Is Visible    //a[@onclick='AtualizarPesquisaUsuario()']    10
      Click Element    //a[@onclick='AtualizarPesquisaUsuario()']

      Wait Until Element Is Visible    //input[@title=' Selecione']    10
      Click Element    //input[@title=' Selecione']

      # Data Inicio
      Wait Until Element Is Visible    id=ctl00_ContentPrincipal_tbxDataInicio
        
      Click Element    id=ctl00_ContentPrincipal_tbxDataInicio
      Sleep    2
      Set Focus To Element    id=ctl00_ContentPrincipal_tbxDataInicio
      Execute JavaScript    document.getElementById("ctl00_ContentPrincipal_tbxDataInicio").value="${Dt_inicio}";
      Sleep    2

      # Data Termino
      Wait Until Element Is Visible    id=ctl00_ContentPrincipal_tbxDataTermino
      Click Element    id=ctl00_ContentPrincipal_tbxDataTermino
      Sleep    2
      Set Focus To Element    id=ctl00_ContentPrincipal_tbxDataTermino
      Execute JavaScript    document.getElementById("ctl00_ContentPrincipal_tbxDataTermino").value="${Dt_termino}";
      Capture Page Screenshot

      Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    10
      Click Element    //a[contains(.,'Confirmar')]
      Sleep    3
    END
    Close Browser


Então incluos os docs obrigatórios
#    Switch Window
#    Select Frame    //frame[@name='main']

#    # Clique na aba documentos
#    Wait Until Element Is Visible    //span[@class='k-link'][contains(.,'Documentos do processo')]    15
#    Click Element    //span[@class='k-link'][contains(.,'Documentos do processo')]

    # Clique do botão 'Escolher Arquivo'
    Wait Until Element Is Visible    //input[contains(@type,'file')]    timeout=30s
    Choose File    css=input[type="file"]    ${EXECDIR}\\test\\Fixtures\\Mod03-Locators.pdf

    Sleep    1

    # Clique e escrevo no campo 'Tipo do documento'
    Wait Until Element Is Visible    
    ...    css=input[id="ctl00_ContentPrincipal_objListagemDeDocumentos_autoTipoDeDocumento"]    15

    ${tipo_doc} =    Set Variable    Nota Técnica Jurídica
    ${li_doc}    Set Variable    //li[@tabindex='-1'][contains(.,'Nota Técnica Jurídica')]

    Input Text    
    ...    css=input[id="ctl00_ContentPrincipal_objListagemDeDocumentos_autoTipoDeDocumento"]
    ...    ${tipo_doc}    15
    Sleep    2
    Wait Until Element Is Visible    ${li_doc}    timeout=30s
    Click Element    ${li_doc}

    # Clique no botão 'Anexar' o arquivo
    Capture Page Screenshot
    Click Element    //input[@value='Anexar']
    Handle Alert    ACCEPT
    Sleep    1

E incluo o Documento do Tipo 'Empenho'

    Wait Until Element Is Visible    css=input[type="file"]    10
    Choose File    css=input[type="file"]    ${EXECDIR}\\test\\Fixtures\\Mod03-Locators.pdf


    # Clique e escrevo no campo 'Tipo do documento'
    Wait Until Element Is Visible    
    ...    css=input[id="ctl00_ContentPrincipal_objListagemDeDocumentos_autoTipoDeDocumento"]    30
    Input Text    
    ...    css=input[id="ctl00_ContentPrincipal_objListagemDeDocumentos_autoTipoDeDocumento"]
    ...    Empenho
    Sleep    2
    Wait Until Element Is Visible    //li[text()="Empenho"]    30
    Click Element    //li[text()="Empenho"]


    # Clique no botão 'Anexar' o arquivo
    Capture Page Screenshot
    Click Element    //input[@value='Anexar']
    Sleep    3
    Handle Alert    ACCEPT



E acesso a aba 'Documentos do Processo'
   Switch Window
   Select Frame    //frame[@name='main']
   # Clique na aba documentos
   Wait Until Element Is Visible    //span[@class='k-link'][contains(.,'Documentos do processo')]    15
   Click Element    //span[@class='k-link'][contains(.,'Documentos do processo')]
   Sleep    2
   Capture Page Screenshot


Então assino o contrato
    Wait Until Element Is Visible    //table[@id="ctl00_ContentPrincipal_gridDocAssinatura"]//tr[td[contains(text(), 'Contrato')]]//td[6]//input    10
    Click Element    //table[@id="ctl00_ContentPrincipal_gridDocAssinatura"]//tr[td[contains(text(), 'Contrato')]]//td[6]//input

    # Clicar no botão 'Assinar Documento'
    Wait Until Element Is Visible    xpath=//a[contains(.,'Assinar documento')]    30
    Click Element    xpath=//a[contains(.,'Assinar documento')]

    # E Preencho os campos de assinatura
    Sleep    2
    Wait Until Element Is Visible    //span[text()="Assinatura Eletrônica"]    30

    Wait Until Element Is Visible    css=input[id="ctl00_ContentPrincipal_tbxCargo"]    30
    Input Text    css=input[id="ctl00_ContentPrincipal_tbxCargo"]    Teste

    Wait Until Element Is Visible    css=input[id="tbxSenhaAcesso"]    30
    Input Text    css=input[id="tbxSenhaAcesso"]    PE@123456

    # E clico no botão assinar
    Capture Page Screenshot
    Click Element    xpath=//a[text()= 'Assinar']
    Sleep    3
    SeleniumLibrary.Close Browser



E anexo o documento para assinatura

    Wait Until Element Is Visible    //table[@id="ctl00_ContentPrincipal_objListagemDeDocumentos_dtgPesquisaNovo"]//tr[td/a[text()='Contrato']]//td[10]//input    10
    Click Element    //table[@id="ctl00_ContentPrincipal_objListagemDeDocumentos_dtgPesquisaNovo"]//tr[td/a[text()='Contrato']]//td[10]//input

    Wait Until Element Is Visible    //a[contains(.,'Anexar para assinatura')]    10
    Click Element    //a[contains(.,'Anexar para assinatura')]
    Sleep    2

    # Clique Sim no popup
    Wait Until Element Is Visible    //a[contains(.,'Sim')]    10
    Click Element    //a[contains(.,'Sim')]
    Sleep    3


E acesso a aba 'Dados Gerais'
    Wait Until Element Is Visible    //span[contains(.,'Dados gerais')]    10
    Click Element    //span[contains(.,'Dados gerais')]
    Sleep    2

Então solicito assinatura
    Wait Until Element Is Visible    //a[contains(.,'Solicitar assinatura')]    10
    Click Element    //a[contains(.,'Solicitar assinatura')]
    Sleep    2

    Wait Until Element Is Visible     //a[@href='javascript:void(0);'][contains(@id,'mbxContrato')][contains(.,'Sim')]    10
    Click Element     //a[@href='javascript:void(0);'][contains(@id,'mbxContrato')][contains(.,'Sim')]
    Sleep    3


Então incluo os documentos obrigatórios

    FOR    ${index}    IN RANGE    3
      # Clique do botão 'Escolher Arquivo'
      Wait Until Element Is Visible    //input[contains(@type,'file')]    timeout=30s
      Choose File    css=input[type="file"]    ${EXECDIR}\\test\\Fixtures\\Mod03-Locators.pdf
      Sleep    1

      # Clique e escrevo no campo 'Tipo do documento'
      Wait Until Element Is Visible    
      ...    css=input[id="ctl00_ContentPrincipal_objListagemDeDocumentos_autoTipoDeDocumento"]    15

      ${tipo_doc} =    Set Variable    Contrato
      ${li_doc}    Set Variable    //li[@tabindex='-1'][contains(.,'Contrato')]

      # Ajustar os localizadores e o tipo de documento para a segunda e terceira execuções
      IF    ${index} == 1

        ${tipo_doc} =    Set Variable    DDO
        ${li_doc} =    Set Variable    //li[contains(.,'DDO (Declaração de Disponibilidade Orçamentária)')]

      ELSE IF    ${index} == 2

        ${tipo_doc} =    Set Variable    Nota Técnica Jurídica
        ${li_doc} =    Set Variable    //li[contains(.,'Nota Técnica Jurídica')]    
      END

      Input Text    
      ...    css=input[id="ctl00_ContentPrincipal_objListagemDeDocumentos_autoTipoDeDocumento"]
      ...    ${tipo_doc}    15
      Sleep    2
      Wait Until Element Is Visible    ${li_doc}    timeout=30s
      Click Element    ${li_doc}

      # Clique no botão 'Anexar' o arquivo
      Capture Page Screenshot
      Click Element    //input[@value='Anexar']
      Handle Alert    ACCEPT
      Sleep    1
    END

Então Encaminho o Contrato

   Switch Window
   Select Frame    //frame[@name='main']

   Wait Until Element Is Visible    //a[@onclick='encaminharContrato();'][contains(@id,'btnEncaminharContrato')][contains(.,'Encaminhar')]    15
   Click Element    //a[@onclick='encaminharContrato();'][contains(@id,'btnEncaminharContrato')][contains(.,'Encaminhar')]
   Sleep    3
   Capture Page Screenshot

   # Sim no popup
   Wait Until Element Is Visible    //a[contains(.,'Sim')]    15
   Click Element    //a[contains(.,'Sim')]
   Sleep    6
