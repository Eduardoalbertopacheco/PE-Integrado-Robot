*** Settings ***
Documentation    Cenário: Criar um contrato Legado não relaizado no PE-Itegrado
Library          SeleniumLibrary
Library          DateTime
Library          OperatingSystem
Resource        ../Resources/Resource_login.robot

*** Variables ***

${OBJETO_CONTRATO}    Contrato_Legado_Nao_PE_Teste_Auto
@{CODIGOS_PRODUTOS}    1000241    1000268

*** Keywords ***
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
    
    Capture Page Screenshot
    Sleep    2

Então crio um novo contrato

    ${Dt_inicio_cont}=    Get Current Date    result_format=%d-%m-%Y    increment=-1d

    ${Dt_enc_cont}=    Get Current Date    result_format=%d-%m-%Y    increment=+180d
    Log    Data futura: ${Dt_enc_cont}

    Select Frame    //iframe[@name='frmConteudo']
    Wait Until Element Is Visible    //a[contains(.,'Incluir')]    30
    Click Element    //a[contains(.,'Incluir')]

    Switch Window    
    Select Frame    //frame[contains(@name,'main')]

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
   
E acesso o Contrato da Lista
    Select Frame    //iframe[@name='frmConteudo']
    Wait Until Element Is Visible    //table[@id='ctl00_ContentPrincipal_dtgPesquisa']//tr[td[contains(text(), '${OBJETO_CONTRATO}')]]//td[2]//a    15
    Click Element        //table[@id='ctl00_ContentPrincipal_dtgPesquisa']//tr[td[contains(text(), '${OBJETO_CONTRATO}')]]//td[2]//a


Então configuro a aba Partes do contrato
    Switch Window
    Select Frame    //frame[@name='main']
    Wait Until Element Is Visible    //span[contains(.,'Partes')]    10
    Click Element    //span[contains(.,'Partes')]
    Sleep    2

    # Representante da Contratante
    ${ELEMENTOS}    Get WebElements    //span[@unselectable='on'][contains(.,'Selecione')]
    ${DROP_LIST}    Set Variable    ${ELEMENTOS}[1]
    Sleep    1
    Click Element    ${DROP_LIST}

    Sleep    2

    ${ELEMENTOS}    Get WebElements    //li[@tabindex='-1'][contains(.,'Usuário Autoridade')]
    ${DROP_LIST2}    Set Variable    ${ELEMENTOS}[1]
    Sleep    1
    Click Element    ${DROP_LIST2}

    Sleep    2

    # Representante da Contratada
    ${ELEMENTOS}    Get WebElements    //span[@unselectable='on'][contains(.,'Selecione')]
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

Então incluo os itens no Contrato

    Switch Window
    Select Frame    //frame[@name='main']
    Wait Until Element Is Visible    //span[contains(.,'Itens')]    10
    Click Element    //span[contains(.,'Itens')]
    Sleep    2

    FOR    ${i}    IN RANGE    2
        ${codigo_produto}=    Set Variable    ${CODIGOS_PRODUTOS}[${i}]
        Sleep    2
        Set Focus To Element    //a[contains(.,'Incluir')]
        Wait Until Element Is Visible    //a[contains(.,'Incluir')]    20
        Click Element    //a[contains(.,'Incluir')]
        Sleep    2
    
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
    Wait Until Element Is Visible    //span[@class='k-widget k-dropdown k-header'][contains(.,'Selecione SelecioneBD 1 KGBNG 0,4 ML')]    10
    Click Element    //span[@class='k-widget k-dropdown k-header'][contains(.,'Selecione SelecioneBD 1 KGBNG 0,4 ML')]
    Sleep    2
   
    # Unidade de Medida
    ${ELEMENTOS}    Get WebElements    //li[@tabindex='-1'][contains(.,'BD 1 KG')]
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
    Close Browser



     
*** Test Cases ***

CT01 - Criar um novo contrato
   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   Então crio um novo contrato


CT02 - Configurar Partes do contrato
   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato da Lista
   Então configuro a aba Partes do contrato

CT03 - Incluir Itens no contrato
   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato da Lista
   Então incluo os itens no Contrato