*** Settings ***
Documentation    Ações e Elementos do Módulo de Cadastro de Solicitação de Compras
Library          SeleniumLibrary
Library          Browser
Library          OperatingSystem
Library          DateTime
Resource         ./Variaveis.robot


*** Variables ***

${URL_CRIAR_SC}    https://www.homologpeintegrado.pe.gov.br/ordemcompra/OrdemCompraManutencao.aspx
${APLICACAO}    //*[@id="td_cORDEM_COMPRA_x_nCdAplicacao"]
${GESTAO}    //*[@id="td_cORDEM_COMPRA_x_nCdGestao"]
${EMPRESA}    //*[@id="td_cORDEM_COMPRA_x_nCdEmpresa"]
${TIPO}    //*[@id="td_cORDEM_COMPRA_x_nIdTipoOrdemCompra"]
${TIPO_AMS}    //*[@id="td_cORDEM_COMPRA_x_nIdTipoOrdemCompra"]//*[@value='14']
${PRIORIDADE}    //*[@id="td_cORDEM_COMPRA_x_nCdPrioridade"]
${PRIORIDADE_MEDIA}    //*[@id="td_cORDEM_COMPRA_x_nCdPrioridade"]//*[@value='2']
${EMPRESA_SEDC}    //*[@id="td_cORDEM_COMPRA_x_nCdEmpresa"]//*[@value='20']
${EMPRESA_SAD}     //*[@id="td_cORDEM_COMPRA_x_nCdEmpresa"]//*[@value='3']
${EMPRESA_TJ}    //*[@id="td_cORDEM_COMPRA_x_nCdEmpresa"]//*[@value='12']
${EMPRESA_SEDUC}    //*[@id="td_cORDEM_COMPRA_x_nCdEmpresa"]//*[@value='42']
${GESTAO_AD}    //*[@id="td_cORDEM_COMPRA_x_nCdGestao"]//*[@value='1']
${APLICACAO_EI}    //*[@id="td_cORDEM_COMPRA_x_nCdAplicacao"]//*[@value='1']
${CAMPO_RESUMO}             css=textarea[id="_cORDEM_COMPRA_x_sDsOrdemCompra"]
${LUPA_TIPO_OBJETO}        (//*[@id="img"])[1]
${URL_SELCT_TIPO}     https://www.homologpeintegrado.pe.gov.br/Core/Pesquisa/ProcurarTipoObjetoCompra.aspx
${TITULO_TIPO_OBEJTO}    //*[.='Selecionar tipo de objeto']
${INPUT_TIPO}            //input[@field="normal"]
${LUPA_GRUPO_COMPRA}     (//img[@id='img'])[3]
${INPUT_NUM_SC}          //div[@id='_cORDEM_COMPRA_x_sCdOrdemCompraEmpresa']

${timeout}       300    
${interval}      5    
${start_time}    Get Time    epoch 

*** Keywords ***

E faço login com usuário Vencedor "${usuario}"
    Input Text        css=input[placeholder='Login']    ${usuario}
    Input Text        css=input[placeholder='Senha']    PE@123456
    Capture Page Screenshot
    Click Element     css=input[type='submit']
    Sleep    3
    Capture Page Screenshot

E acesso a Tela de Lista de Solicitação de Compras
    Select Frame    xpath=//frame[contains(@name,'main')]

    # Clique em negociação
    Wait Until Element Is Visible    xpath=//div[@unselectable='on'][contains(.,'Negociação')]    timeout=30s
    Click Element    xpath=//div[@unselectable='on'][contains(.,'Negociação')]

    # mouse over em Solicitação de Compras
    ${elemento}    Get WebElement    
    ...    xpath=//td[@class='label'][contains(.,'Solicitação de compra')]
    Mouse Over    ${elemento}
    
    # Clique em Lista de Solicitaão de Compras
    Wait Until Element Is Visible    
    ...    xpath=//td[@class='label'][contains(.,'Lista de solicitações de compra')]    timeout=30s
    Click Element    
    ...    xpath=//td[@class='label'][contains(.,'Lista de solicitações de compra')]
    Sleep    4
    Capture Page Screenshot



Então preencho os campos da Aba Dados gerais - TJ

    Wait Until Element Is Visible    ${PRIORIDADE}    timeout=30s
    Click Element    ${PRIORIDADE}
    Sleep    2
    Click Element    ${PRIORIDADE_MEDIA}
    
    Wait Until Element Is Visible    ${TIPO}    timeout=30s
    Click Element    ${TIPO}
    Sleep    2
    Click Element    ${TIPO_AMS}
    
    Input Text    ${CAMPO_RESUMO}    ${RESUMO_SC}

    Click Element  ${LUPA_TIPO_OBJETO}
        
    ${Janelas}    Get Window Handles
    ${Janela01}=    Set Variable    ${Janelas}[1]

    Switch Window    NEW

    Wait Until Element Is Visible    ${TITULO_TIPO_OBEJTO}    timeout=30s
    Wait Until Element Is Visible    ${INPUT_TIPO}    timeout=30s
    Input Text    ${INPUT_TIPO}    ANIMAIS VIVOS	
    Click Element    //*[@id="tdPesquisar"]
    Click Element    //input[@value="ANIMAIS VIVOS◘50"]
    Click Element    //*[@name="ctl00$conteudoBotoes$btnConfirmar"]
    Switch Window    ${Janela01}
    
    Wait Until Element Is Visible    ${EMPRESA}    timeout=30s
    Click Element    ${EMPRESA}
    Wait Until Element Is Visible    ${EMPRESA_TJ}    timeout=30s
    Click Element    ${EMPRESA_TJ}
    
    Wait Until Element Is Visible    ${GESTAO}     timeout=30s
    Click Element    ${GESTAO} 
    Click Element    ${GESTAO_AD}
    
    Wait Until Element Is Visible    ${APLICACAO}     timeout=30s
    Click Element    ${APLICACAO} 
    Click Element    ${APLICACAO_EI}
    Capture Page Screenshot
    
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

    Wait Until Element Is Visible    ${LUPA_GRUPO_COMPRA}    timeout=30s
    Click Element    ${LUPA_GRUPO_COMPRA}

    ${Janelas}    Get Window Handles
    ${Janela01}=    Set Variable    ${Janelas}[1]

    Switch Window    NEW

    Wait Until Element Is Visible    //*[.='Selecionar grupo de compra']    timeout=30s
    Input Text    ${INPUT_TIPO}    TRIBUNAL DE JUSTIÇA	
    Wait Until Element Is Visible    //*[@id="tdPesquisar"]    timeout=30s
    Click Element    //*[@id="ctl00_btnPesquisar"]  

    Wait Until Element Is Visible    
    ...    //input[@value="Grupo de Compras Padrão - TRIBUNAL DE JUSTIÇA◘2"]    timeout=30s
    Click Element    
    ...    //input[@value="Grupo de Compras Padrão - TRIBUNAL DE JUSTIÇA◘2"]
    Click Element    
    ...    //*[@name="ctl00$conteudoBotoes$btnConfirmar"]

    Switch Window    ${Janela01}

    Capture Page Screenshot
    
    Click Element    //*[@id="btnSalvar"]
    Sleep    1
    Handle Alert    ACCEPT
    SeleniumLibrary.Close Browser


    
Então preencho os campos da Aba Dados gerais da SC


    Wait Until Element Is Visible    ${PRIORIDADE}    timeout=30s
    Click Element    ${PRIORIDADE}
    Sleep    1
    Click Element    ${PRIORIDADE_MEDIA}
    
    Wait Until Element Is Visible    ${TIPO}    timeout=30s
    Click Element    ${TIPO}
    Sleep    1
    Click Element    ${TIPO_AMS}
    
    Input Text    ${CAMPO_RESUMO}    ${RESUMO_SC}

    Click Element  ${LUPA_TIPO_OBJETO}
    
    ${Janelas}    Get Window Handles
    ${Janela01}=    Set Variable    ${Janelas}[1]

    Switch Window    NEW

    Wait Until Element Is Visible    ${TITULO_TIPO_OBEJTO}    timeout=30s
    Wait Until Element Is Visible    ${INPUT_TIPO}    timeout=30s
    Input Text    ${INPUT_TIPO}    ANIMAIS VIVOS	
    Click Element    //*[@id="tdPesquisar"]
    Click Element    //input[@value="ANIMAIS VIVOS◘50"]
    Click Element    //*[@name="ctl00$conteudoBotoes$btnConfirmar"]
    Switch Window    ${Janela01}
    
    Wait Until Element Is Visible    ${EMPRESA}    timeout=30s
    Click Element    ${EMPRESA}
    Wait Until Element Is Visible    ${EMPRESA_SEDC}    timeout=30s
    Click Element    ${EMPRESA_SEDC}
    
    Wait Until Element Is Visible    ${GESTAO}     timeout=30s
    Click Element    ${GESTAO} 
    Click Element    ${GESTAO_AD}
    
    Wait Until Element Is Visible    ${APLICACAO}     timeout=30s
    Click Element    ${APLICACAO}
    Sleep    1
    Click Element    ${APLICACAO_EI}
    Capture Page Screenshot
    
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

    Wait Until Element Is Visible    ${LUPA_GRUPO_COMPRA}    timeout=30s
    Sleep    1
    Click Element    ${LUPA_GRUPO_COMPRA}

    ${Janelas}    Get Window Handles
    ${Janela01}=    Set Variable    ${Janelas}[1]

    Switch Window    NEW

    Wait Until Element Is Visible    //*[.='Selecionar grupo de compra']    timeout=30s
    Input Text    ${INPUT_TIPO}    SECRETARIA EXECUTIVA DE DEFESA CIVIL	
    Wait Until Element Is Visible    //*[@id="tdPesquisar"]    timeout=30s
    Click Element    //*[@id="ctl00_btnPesquisar"]  

    Wait Until Element Is Visible    
    ...    //input[@value="Grupo de Compras Padrão - SECRETARIA EXECUTIVA DE DEFESA CIVIL◘46"]    timeout=30s
    Click Element    
    ...    //input[@value="Grupo de Compras Padrão - SECRETARIA EXECUTIVA DE DEFESA CIVIL◘46"]
    Click Element    
    ...    //*[@name="ctl00$conteudoBotoes$btnConfirmar"]

    Switch Window    ${Janela01}

    Capture Page Screenshot
    
    Click Element    //*[@id="btnSalvar"]
    Sleep    2
    Handle Alert    ACCEPT


    # Capturar o valor do campo depois que ele for preenchido
    Wait Until Element Is Visible    ${INPUT_NUM_SC}    20
    Sleep    1
    ${NUM_SC_COTACAO}    SeleniumLibrary.Get Text    ${INPUT_NUM_SC}

    # Salvar o valor em um arquivo de texto
    Create File    ${EXECDIR}/test/processos/num_sc_cotacao.txt    ${NUM_SC_COTACAO}
    Sleep    2
    SeleniumLibrary.Close Browser


Então preencho os campos da Aba Dados gerais - SEDUC

    Wait Until Element Is Visible    ${PRIORIDADE}    timeout=30s
    Click Element    ${PRIORIDADE}
    Sleep    1
    Click Element    ${PRIORIDADE_MEDIA}
    
    Wait Until Element Is Visible    ${TIPO}    timeout=30s
    Click Element    ${TIPO}
    Sleep    1
    Click Element    ${TIPO_AMS}
    
    Input Text    ${CAMPO_RESUMO}    ${RESUMO_SC}

    Click Element  ${LUPA_TIPO_OBJETO}
    
    ${Janelas}    Get Window Handles
    ${Janela01}=    Set Variable    ${Janelas}[1]

    Switch Window    NEW

    Wait Until Element Is Visible    ${TITULO_TIPO_OBEJTO}    timeout=30s
    Wait Until Element Is Visible    ${INPUT_TIPO}    timeout=30s
    Input Text    ${INPUT_TIPO}    ANIMAIS VIVOS	
    Click Element    //*[@id="tdPesquisar"]
    Click Element    //input[@value="ANIMAIS VIVOS◘50"]
    Click Element    //*[@name="ctl00$conteudoBotoes$btnConfirmar"]
    Switch Window    ${Janela01}
    
    Wait Until Element Is Visible    ${EMPRESA}    timeout=30s
    Click Element    ${EMPRESA}
    Wait Until Element Is Visible    ${EMPRESA_SEDUC}    timeout=30s
    Click Element    ${EMPRESA_SEDUC}
    
    Wait Until Element Is Visible    ${GESTAO}     timeout=30s
    Click Element    ${GESTAO} 
    Click Element    ${GESTAO_AD}
    
    Wait Until Element Is Visible    ${APLICACAO}     timeout=30s
    Click Element    ${APLICACAO}
    Sleep    1
    Click Element    ${APLICACAO_EI}
    Capture Page Screenshot
    
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

    Wait Until Element Is Visible    ${LUPA_GRUPO_COMPRA}    timeout=30s
    Sleep    1
    Click Element    ${LUPA_GRUPO_COMPRA}

    ${Janelas}    Get Window Handles
    ${Janela01}=    Set Variable    ${Janelas}[1]

    Switch Window    NEW

    Wait Until Element Is Visible    //*[.='Selecionar grupo de compra']    timeout=30s
    Input Text    ${INPUT_TIPO}    SECRETARIA DE EDUCAÇÃO	
    Wait Until Element Is Visible    //*[@id="tdPesquisar"]    timeout=30s
    Click Element    //*[@id="ctl00_btnPesquisar"]  

    Wait Until Element Is Visible    
    ...    //input[@value='Grupo de Compras Padrão - SECRETARIA DE EDUCAÇÃO◘98']   timeout=30s
    Click Element    
    ...    //input[@value='Grupo de Compras Padrão - SECRETARIA DE EDUCAÇÃO◘98']
    Click Element    
    ...    //*[@name="ctl00$conteudoBotoes$btnConfirmar"]

    Switch Window    ${Janela01}

    Capture Page Screenshot
    
    Click Element    //*[@id="btnSalvar"]
    Sleep    1
    Handle Alert    ACCEPT
    SeleniumLibrary.Close Browser



Então preencho os campos da Aba Dados gerais - SAD

    Wait Until Element Is Visible    ${PRIORIDADE}    timeout=30s
    Click Element    ${PRIORIDADE}
    Sleep    1
    Click Element    ${PRIORIDADE_MEDIA}
    
    Wait Until Element Is Visible    ${TIPO}    timeout=30s
    Click Element    ${TIPO}
    Sleep    1
    Click Element    ${TIPO_AMS}
    
    Input Text    ${CAMPO_RESUMO}    ${RESUMO_SC}

    Click Element  ${LUPA_TIPO_OBJETO}
    
    ${Janelas}    Get Window Handles
    ${Janela01}=    Set Variable    ${Janelas}[1]

    Switch Window    NEW

    Wait Until Element Is Visible    ${TITULO_TIPO_OBEJTO}    timeout=30s
    Wait Until Element Is Visible    ${INPUT_TIPO}    timeout=30s
    Input Text    ${INPUT_TIPO}    ANIMAIS VIVOS	
    Click Element    //*[@id="tdPesquisar"]
    Click Element    //input[@value="ANIMAIS VIVOS◘50"]
    Click Element    //*[@name="ctl00$conteudoBotoes$btnConfirmar"]
    Switch Window    ${Janela01}
    
    Wait Until Element Is Visible    ${EMPRESA}    timeout=30s
    Click Element    ${EMPRESA}
    Wait Until Element Is Visible    ${EMPRESA_SAD}    timeout=30s
    Click Element    ${EMPRESA_SAD}
    
    Wait Until Element Is Visible    ${GESTAO}     timeout=30s
    Click Element    ${GESTAO} 
    Click Element    ${GESTAO_AD}
    
    Wait Until Element Is Visible    ${APLICACAO}     timeout=30s
    Click Element    ${APLICACAO}
    Sleep    1
    Click Element    ${APLICACAO_EI}
    Capture Page Screenshot
    
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

    Wait Until Element Is Visible    ${LUPA_GRUPO_COMPRA}    timeout=30s
    Sleep    1
    Click Element    ${LUPA_GRUPO_COMPRA}

    ${Janelas}    Get Window Handles
    ${Janela01}=    Set Variable    ${Janelas}[1]

    Switch Window    NEW

    Wait Until Element Is Visible    //*[.='Selecionar grupo de compra']    timeout=30s
    Input Text    ${INPUT_TIPO}    SECRETARIA DE ADMINISTRAÇÃO	
    Wait Until Element Is Visible    //*[@id="tdPesquisar"]    timeout=30s
    Click Element    //*[@id="ctl00_btnPesquisar"]  

    Wait Until Element Is Visible    
    ...    //input[@value='Grupo de Compras Padrão - SECRETARIA DE ADMINISTRAÇÃO◘17']   timeout=30s
    Click Element    
    ...    //input[@value='Grupo de Compras Padrão - SECRETARIA DE ADMINISTRAÇÃO◘17']
    Click Element    
    ...    //*[@name="ctl00$conteudoBotoes$btnConfirmar"]

    Switch Window    ${Janela01}

    Capture Page Screenshot
    
    Click Element    //*[@id="btnSalvar"]
    Sleep    1
    Handle Alert    ACCEPT
    SeleniumLibrary.Close Browser

E clico em 'Incluir'

    Select Frame    //iframe[@name='frmConteudo']
    Wait Until Element Is Visible    //a[contains(.,'Incluir')]    20
    Click Element    //a[contains(.,'Incluir')]
    Switch Window    NEW
    Sleep    2
    Capture Page Screenshot


Então preencho os campos da Aba Dados gerais

    Wait Until Element Is Visible    ${PRIORIDADE}    30
    Click Element    ${PRIORIDADE}
    Sleep    1
    Click Element    ${PRIORIDADE_MEDIA}
    
    Wait Until Element Is Visible    ${TIPO}    30
    Click Element    ${TIPO}
    Sleep    1
    Click Element    ${TIPO_AMS}
    
    Input Text    ${CAMPO_RESUMO}    ${RESUMO_SC}

    Click Element  ${LUPA_TIPO_OBJETO}
    
    ${Janelas}    Get Window Handles
    ${Janela01}=    Set Variable    ${Janelas}[1]

    Switch Window    NEW

    Wait Until Element Is Visible    ${TITULO_TIPO_OBEJTO}    30
    Wait Until Element Is Visible    ${INPUT_TIPO}    30
    Input Text    ${INPUT_TIPO}    ANIMAIS VIVOS	
    Click Element    //*[@id="tdPesquisar"]
    Click Element    //input[@value="ANIMAIS VIVOS◘50"]
    Click Element    //*[@name="ctl00$conteudoBotoes$btnConfirmar"]
    Switch Window    ${Janela01}
    
    Wait Until Element Is Visible    ${EMPRESA}    30
    Click Element    ${EMPRESA}
    Wait Until Element Is Visible    ${EMPRESA_SEDC}    30
    Click Element    ${EMPRESA_SEDC}
    
    Wait Until Element Is Visible    ${GESTAO}     30
    Click Element    ${GESTAO} 
    Click Element    ${GESTAO_AD}
    
    Wait Until Element Is Visible    ${APLICACAO}     30
    Click Element    ${APLICACAO}
    Sleep    1
    Click Element    ${APLICACAO_EI}

    # Origem SC - PE
    Wait Until Element Is Visible    //input[@tb='ORDEM_COMPRA'][contains(@id,'0')]    20
    Click Element    //input[@tb='ORDEM_COMPRA'][contains(@id,'0')]
    Capture Page Screenshot
    
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

    Wait Until Element Is Visible    ${LUPA_GRUPO_COMPRA}    30
    Sleep    1
    Click Element    ${LUPA_GRUPO_COMPRA}

    ${Janelas}    Get Window Handles
    ${Janela01}=    Set Variable    ${Janelas}[1]

    Switch Window    NEW

    Wait Until Element Is Visible    //*[.='Selecionar grupo de compra']    30
    Input Text    ${INPUT_TIPO}    SECRETARIA EXECUTIVA DE DEFESA CIVIL	
    Wait Until Element Is Visible    //*[@id="tdPesquisar"]    30
    Click Element    //*[@id="ctl00_btnPesquisar"]  

    Wait Until Element Is Visible    
    ...    //input[@value="Grupo de Compras Padrão - SECRETARIA EXECUTIVA DE DEFESA CIVIL◘46"]    30
    Click Element    
    ...    //input[@value="Grupo de Compras Padrão - SECRETARIA EXECUTIVA DE DEFESA CIVIL◘46"]
    Click Element    
    ...    //*[@name="ctl00$conteudoBotoes$btnConfirmar"]

    Switch Window    ${Janela01}

    Capture Page Screenshot
    
    Click Element    //*[@id="btnSalvar"]
    Sleep    1
    Handle Alert    ACCEPT
    SeleniumLibrary.Close Browser

E acesso a tela de incluir Itens
    Sleep    2
    Wait Until Element Is Visible     //a[contains(.,'Incluir')]    timeout=30s
    Click Element    //a[contains(.,'Incluir')]
    Sleep    5
    Capture Page Screenshot


Então incluo os itens
  
    # Input Text     //*[@name="ctl00$ContentPrincipal$txtCodigo"]    1000241
    Input Text     //*[@name="ctl00$ContentPrincipal$txtCodigo"]    1000268
    Click Element    //*[@id="ctl00_ContentPrincipal_btnPesquisarProduto"]
    
    Wait Until Element Is Visible    (//input[contains(@id,'ckbListProduto')])[1]    timeout=30s
    Click Element    (//input[contains(@id,'ckbListProduto')])[1]

    # Wait Until Element Is Visible    (//input[contains(@id,'ckbListProduto')])[2]
    # Click Element    (//input[contains(@id,'ckbListProduto')])[2]

    Click Element    //*[@id="ctl00_ContentButtom_btnConfirmar"]
    Sleep    3


    # Implementar aqui a quantidade do item
    Wait Until Element Is Visible    xpath=(//span[contains(@unselectable,'on')])[10]    timeout=30s
    Double Click Element    xpath=(//span[contains(@unselectable,'on')])[10]
    Double Click Element    xpath=(//span[contains(@unselectable,'on')])[10]
    Double Click Element    xpath=(//span[contains(@unselectable,'on')])[10]
    Double Click Element    xpath=(//span[contains(@unselectable,'on')])[10]
    Double Click Element    xpath=(//span[contains(@unselectable,'on')])[10]
    
    #  Click no botão 'Salvar'
    Wait Until Element Is Visible    xpath=//*[@id="ctl00_conteudoBotoes_btSalvar"]    timeout=30s
    Capture Page Screenshot
    Click Element         xpath=//*[@id="ctl00_conteudoBotoes_btSalvar"]
    
    Sleep    4
    SeleniumLibrary.Close Browser

E Clico na Aba 'Documentos do Processo'
    Switch Window    NEW

    Wait Until Element Is Visible    xpath=//a[contains(.,'Documentos do processo')]    timeout=30s
    Click Element        xpath=//a[contains(.,'Documentos do processo')]
    Sleep    2
    Capture Page Screenshot


Então incluo o documento do tipo Termo Referencia

    Wait Until Element Is Visible    css=input[type="file"]    timeout=30s
    Choose File    css=input[type="file"]    ${EXECDIR}\\test\\Fixtures\\Mod03-Locators.pdf


    # Clique e escrevo no campo 'Tipo do documento'
    Wait Until Element Is Visible    
    ...    css=input[id="ctl00_conteudoPagina_objListagemDeDocumentos_autoTipoDeDocumento"]    timeout=30s
    Input Text    
    ...    css=input[id="ctl00_conteudoPagina_objListagemDeDocumentos_autoTipoDeDocumento"]
    ...    Termo de Referência
    Sleep    2
    Wait Until Element Is Visible    //li[text()="Termo de Referência"]    timeout=30s
    Click Element    //li[text()="Termo de Referência"]


    # Clique no botão 'Anexar' o arquivo
    Capture Page Screenshot
    Click Element    //input[@value='Anexar']
    Sleep    3
    Handle Alert    ACCEPT
    SeleniumLibrary.Close Browser


Então assino o documento    

    # Switch Window    NEW

    # Wait Until Element Is Visible    xpath=//a[contains(.,'Documentos do processo')]    timeout=30s
    # Click Element        xpath=//a[contains(.,'Documentos do processo')]
    # Sleep    1
    # Capture Page Screenshot


    Wait Until Element Is Visible    //table[@id="ctl00_conteudoPagina_objListagemDeDocumentos_dtgPesquisaNovo"]//tr[td/a[text()='Termo de Referência']]//td[10]//input    timeout=30s
    Select Checkbox     //table[@id="ctl00_conteudoPagina_objListagemDeDocumentos_dtgPesquisaNovo"]//tr[td/a[text()='Termo de Referência']]//td[10]//input

    # Clicar no botão 'Assinar Documento'
    Wait Until Element Is Visible    xpath=//a[contains(.,'Assinar documento')]    30
    Click Element    xpath=//a[contains(.,'Assinar documento')]


    # E Preencho os campos de assinatura
    Sleep    2
    Wait Until Element Is Visible    //span[text()="Assinatura Eletrônica"]    timeout=30s

    Wait Until Element Is Visible    css=input[id="ctl00_ContentPrincipal_tbxCargo"]    timeout=30s
    Input Text    css=input[id="ctl00_ContentPrincipal_tbxCargo"]    Teste

    Wait Until Element Is Visible    css=input[id="tbxSenhaAcesso"]    timeout=30s
    Input Text    css=input[id="tbxSenhaAcesso"]    PE@123456

    # E clico no botão assinar
    Capture Page Screenshot
    Click Element    xpath=//a[text()= 'Assinar']
    Sleep    2
    SeleniumLibrary.Close Browser


Então encaminho a Solicitação de compra para precificação

    Switch Window    NEW

    Sleep    4
    Wait Until Element Is Visible    xpath=//input[@value = "Encaminhar"]    timeout=30s
    Click Element    xpath=//input[@value = "Encaminhar"]

    Wait Until Element Is Visible    xpath=//a[contains(.,'Sim')]    timeout=30s
    Capture Page Screenshot
    Click Element    xpath=//a[contains(.,'Sim')]
    Sleep    4
    SeleniumLibrary.Close Browser


E acesso a Lista de SC em Precificação
    Capture Page Screenshot
    Select Frame    xpath=//iframe[contains(@name,'frmConteudo')]


   # Clicar no campo Exibir
   Wait Until Element Is Visible    xpath=//select[@id= "ctl00_ddlVisoes"]    timeout=30s
   Click Element    xpath=//select[@id= "ctl00_ddlVisoes"]
   Sleep    1
   Capture Page Screenshot

   # Clicar na seleção 'SC em precificação'
   Click Element    xpath=//select[@id= "ctl00_ddlVisoes"]//*[@value='31069']

   # Clique no botão Pesquisar
   Wait Until Element Is Visible    xpath=//input[@value= "Pesquisar"]    timeout=30s
   Click Element    xpath=//input[@value= "Pesquisar"]
   Capture Page Screenshot


Então faço o planejamento da SC para Cotação

    ${start_time}    Get Time    epoch
    FOR    ${i}    IN RANGE    ${timeout}
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${RESUMO_SC}']]//td[9]//input
        Run Keyword If    ${element_found}    Click Element    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${RESUMO_SC}']]//td[9]//input
        Run Keyword If    ${element_found}    Exit For Loop
        
        Execute JavaScript    window.location.reload()
        Sleep    ${interval} sec

        ${current_time}=    Get Time    epoch
        ${elapsed_time}=    Evaluate    ${current_time} - ${start_time}
        Run Keyword If    ${elapsed_time} > ${timeout}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    END
    Run Keyword If    not ${element_found}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.

   # Clique no botão Encaminhar
   Wait Until Element Is Visible    xpath=//a[contains(.,'Encaminhar')]    timeout=30s
   Click Element    xpath=//a[contains(.,'Encaminhar')]


    ${all_windows}=    Get Window Handles
    ${second_window}=    Set Variable    ${all_windows}[0]
    Switch Window    ${all_windows}[0]
    Select Frame    //frame[contains(@name,'main')]


    # Seleção Modalidade pregão eletronico
    Wait Until Element Is Visible    //form[1]/div[4]/table[1]/tbody[1]/tr[1]/td[2]/span[1]    timeout=30s
    Click Element    //form[1]/div[4]/table[1]/tbody[1]/tr[1]/td[2]/span[1]
    Sleep    1
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Cotação')]
    Click Element    //li[@tabindex='-1'][contains(.,'Cotação')]
    Sleep    2


    # Clique no botão 'Salvar e Fechar'
    Wait Until Element Is Visible    //input[contains(@value,'Salvar e fechar')]
    Click Element    //input[contains(@value,'Salvar e fechar')]
    Sleep    3
    Capture Page Screenshot
    Sleep    2

    
    # Clique no botão de confirmação
    Wait Until Element Is Visible    //a[contains(.,'Sim')]    timeout=30s
    Click Element    //a[contains(.,'Sim')]
    Sleep    2
    Capture Page Screenshot
    Sleep    1

    # Campo justificativa
    # Switch Window
    Wait Until Element Is Visible    //textarea[contains(@name,'txtJustificativa')]    timeout=30s
    Input Text    //textarea[contains(@name,'txtJustificativa')]    Justificativa
    Capture Page Screenshot


    # Clique no botão confirmar justificativa
    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    timeout=30s
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    5
    Capture Page Screenshot
    Sleep    1
    SeleniumLibrary.Close Browser


Então faço planejamento da SC para Pregão Eletronico - Ambiente Treinamento


    ${start_time}    Get Time    epoch
    FOR    ${i}    IN RANGE    ${timeout}
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${RESUMO_SC}']]//td[9]//input
        Run Keyword If    ${element_found}    Click Element    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${RESUMO_SC}']]//td[9]//input
        Run Keyword If    ${element_found}    Exit For Loop
        
        Execute JavaScript    window.location.reload()
        Sleep    ${interval} sec

        ${current_time}=    Get Time    epoch
        ${elapsed_time}=    Evaluate    ${current_time} - ${start_time}
        Run Keyword If    ${elapsed_time} > ${timeout}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    END
    Run Keyword If    not ${element_found}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.

   # Clique no botão Encaminhar
   Wait Until Element Is Visible    xpath=//a[contains(.,'Encaminhar')]    timeout=30s
   Click Element    xpath=//a[contains(.,'Encaminhar')]


    ${all_windows}=    Get Window Handles
    ${second_window}=    Set Variable    ${all_windows}[0]

    Switch Window    ${all_windows}[0]

    Select Frame    //frame[contains(@name,'main')]


    # Seleção Modalidade pregão eletronico
    Wait Until Element Is Visible    //form[1]/div[4]/table[1]/tbody[1]/tr[1]/td[2]/span[1]    timeout=30s
    Click Element    //form[1]/div[4]/table[1]/tbody[1]/tr[1]/td[2]/span[1]
    Sleep    1
    Wait Until Element Is Visible    //li[contains(.,'Pregao Eletronico')]
    Click Element    //li[contains(.,'Pregao Eletronico')]


    # Seleção critério  - Pregão eletronico LEI FEDERAL 14.133/21
    Wait Until Element Is Visible    //form[1]/div[4]/table[1]/tbody[1]/tr[3]/td[2]/span[1]/span[1]/span[1]    timeout=30s
    Click Element    //form[1]/div[4]/table[1]/tbody[1]/tr[3]/td[2]/span[1]/span[1]/span[1]
    Sleep    1
    Wait Until Element Is Visible    //li[contains(.,'LEI FEDERAL Nº 14.133/2021, ART. 28, INCISO I - PREGÃO ELETRÔNICO')]    timeout=30s
    Click Element    //li[contains(.,'LEI FEDERAL Nº 14.133/2021, ART. 28, INCISO I - PREGÃO ELETRÔNICO')]
    Sleep    1
    Capture Page Screenshot

    # Clique no botão 'Salvar e Fechar'
    Wait Until Element Is Visible    //input[contains(@value,'Salvar e fechar')]
    Click Element    //input[contains(@value,'Salvar e fechar')]
    Sleep    2
    Capture Page Screenshot
    Sleep    2

    
    # Clique no botão de confirmação
    Wait Until Element Is Visible    //a[contains(.,'Sim')]    timeout=30s
    Click Element    //a[contains(.,'Sim')]
    Sleep    2
    Capture Page Screenshot
    Sleep    1

    # Campo justificativa
    # Switch Window
    Wait Until Element Is Visible    //textarea[contains(@name,'txtJustificativa')]    timeout=30s
    Input Text    //textarea[contains(@name,'txtJustificativa')]    Justificativa
    Capture Page Screenshot


    # Clique no botão confirmar justificativa
    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    timeout=30s
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    4
    Capture Page Screenshot
    Sleep    1
    SeleniumLibrary.Close Browser



Então faço planejamento da SC para Pregão Eletronico

    ${start_time}    Get Time    epoch
    FOR    ${i}    IN RANGE    ${timeout}
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${RESUMO_SC}']]//td[9]//input
        Run Keyword If    ${element_found}    Click Element    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${RESUMO_SC}']]//td[9]//input
        Run Keyword If    ${element_found}    Exit For Loop
        
        Execute JavaScript    window.location.reload()
        Sleep    ${interval} sec

        ${current_time}=    Get Time    epoch
        ${elapsed_time}=    Evaluate    ${current_time} - ${start_time}
        Run Keyword If    ${elapsed_time} > ${timeout}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    END
    Run Keyword If    not ${element_found}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.

   # Clique no botão Encaminhar
   Wait Until Element Is Visible    xpath=//a[contains(.,'Encaminhar')]    timeout=30s
   Click Element    xpath=//a[contains(.,'Encaminhar')]


    ${all_windows}=    Get Window Handles
    ${second_window}=    Set Variable    ${all_windows}[0]

    Switch Window    ${all_windows}[0]

    Select Frame    //frame[contains(@name,'main')]


    # Seleção Modalidade pregão eletronico
    Wait Until Element Is Visible    //form[1]/div[4]/table[1]/tbody[1]/tr[1]/td[2]/span[1]    timeout=30s
    Click Element    //form[1]/div[4]/table[1]/tbody[1]/tr[1]/td[2]/span[1]
    Sleep    1
    Wait Until Element Is Visible    //li[contains(.,'Pregao Eletronico')]
    Click Element    //li[contains(.,'Pregao Eletronico')]


    # Seleção critério  - Pregão eletronico LEI FEDERAL 14.133/21
    Wait Until Element Is Visible    //form[1]/div[4]/table[1]/tbody[1]/tr[3]/td[2]/span[1]/span[1]/span[1]    timeout=30s
    Click Element    //form[1]/div[4]/table[1]/tbody[1]/tr[3]/td[2]/span[1]/span[1]/span[1]
    Sleep    1
    Wait Until Element Is Visible    //li[contains(.,'LICITAÇÃO NA MODALIDADE PREGÃO ELETRÔNICO - LEI FEDERAL 14.133/21 - DECRETO 54.142/22')]    timeout=30s
    Click Element    //li[contains(.,'LICITAÇÃO NA MODALIDADE PREGÃO ELETRÔNICO - LEI FEDERAL 14.133/21 - DECRETO 54.142/22')]
    Sleep    1
    Capture Page Screenshot

    # Clique no botão 'Salvar e Fechar'
    Wait Until Element Is Visible    //input[contains(@value,'Salvar e fechar')]
    Click Element    //input[contains(@value,'Salvar e fechar')]
    Sleep    2
    Capture Page Screenshot
    Sleep    2

    
    # Clique no botão de confirmação
    Wait Until Element Is Visible    //a[contains(.,'Sim')]    timeout=30s
    Click Element    //a[contains(.,'Sim')]
    Sleep    2
    Capture Page Screenshot
    Sleep    1

    # Campo justificativa
    # Switch Window
    Wait Until Element Is Visible    //textarea[contains(@name,'txtJustificativa')]    timeout=30s
    Input Text    //textarea[contains(@name,'txtJustificativa')]    Justificativa
    Capture Page Screenshot


    # Clique no botão confirmar justificativa
    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    timeout=30s
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    4
    Capture Page Screenshot
    Sleep    1
    SeleniumLibrary.Close Browser


Então faço planejamento da SC para Compra Direta - Dispensa - Solicitante

    ${start_time}    Get Time    epoch
    FOR    ${i}    IN RANGE    ${timeout}
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${RESUMO_SC}']]//td[9]//input
        Run Keyword If    ${element_found}    Click Element    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${RESUMO_SC}']]//td[9]//input
        Run Keyword If    ${element_found}    Exit For Loop
        
        Execute JavaScript    window.location.reload()
        Sleep    ${interval} sec

        ${current_time}=    Get Time    epoch
        ${elapsed_time}=    Evaluate    ${current_time} - ${start_time}
        Run Keyword If    ${elapsed_time} > ${timeout}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    END
    Run Keyword If    not ${element_found}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.


   # Clique no botão Encaminhar
   Wait Until Element Is Visible    xpath=//a[contains(.,'Encaminhar')]    timeout=30s
   Click Element    xpath=//a[contains(.,'Encaminhar')]


    ${all_windows}=    Get Window Handles
    ${second_window}=    Set Variable    ${all_windows}[0]

    Switch Window    ${all_windows}[0]

    Select Frame    //frame[contains(@name,'main')]


    # Seleção Modalidade Dispensa 
    Wait Until Element Is Visible    //form[1]/div[4]/table[1]/tbody[1]/tr[1]/td[2]/span[1]/span[1]/span[1]    timeout=30s
    Click Element    //form[1]/div[4]/table[1]/tbody[1]/tr[1]/td[2]/span[1]/span[1]/span[1]
    Sleep    1
    Wait Until Element Is Visible    //li[text() = "Dispensa"]
    Click Element    //li[text() = "Dispensa"]


    # Seleção critério  - LEI 14.133/2021, ART. 75, VIII
    Wait Until Element Is Visible    //form[1]/div[4]/table[1]/tbody[1]/tr[3]/td[2]/span[1]/span[1]/span[1]    timeout=30s
    Click Element    //form[1]/div[4]/table[1]/tbody[1]/tr[3]/td[2]/span[1]/span[1]/span[1]
    Sleep    1
    Wait Until Element Is Visible    //li[text() = "LEI 14.133/2021, ART. 75, VIII - DISPENSA POR EMERGÊNCIA OU DE CALAMIDADE PÚBLICA"]    timeout=30s
    Click Element    //li[text() = "LEI 14.133/2021, ART. 75, VIII - DISPENSA POR EMERGÊNCIA OU DE CALAMIDADE PÚBLICA"]
    Sleep    1
    Capture Page Screenshot

    # Clique no botão 'Salvar e Fechar'
    Wait Until Element Is Visible    //input[contains(@value,'Salvar e fechar')]
    Click Element    //input[contains(@value,'Salvar e fechar')]
    Sleep    2
    Capture Page Screenshot
    Sleep    2

    
    # Clique no botão de confirmação
    Wait Until Element Is Visible    //a[contains(.,'Sim')]    timeout=30s
    Click Element    //a[contains(.,'Sim')]
    Sleep    2
    Capture Page Screenshot
    Sleep    1

    # Campo justificativa
    # Switch Window
    Wait Until Element Is Visible    //textarea[contains(@name,'txtJustificativa')]    timeout=30s
    Input Text    //textarea[contains(@name,'txtJustificativa')]    Justificativa
    Capture Page Screenshot


    # Clique no botão confirmar justificativa
    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    timeout=30s
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    4
    Capture Page Screenshot
    Sleep    1
    SeleniumLibrary.Close Browser


Então faço planejamento da SC para compra Direta - Inex. - Solicitante

    ${start_time}    Get Time    epoch 
    FOR    ${i}    IN RANGE    ${timeout}
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${RESUMO_SC}']]//td[9]//input
        Run Keyword If    ${element_found}    Click Element    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${RESUMO_SC}']]//td[9]//input
        Run Keyword If    ${element_found}    Exit For Loop
        
        Execute JavaScript    window.location.reload()
        Sleep    ${interval} sec

        ${current_time}=    Get Time    epoch
        ${elapsed_time}=    Evaluate    ${current_time} - ${start_time}
        Run Keyword If    ${elapsed_time} > ${timeout}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    END
    Run Keyword If    not ${element_found}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.

   # Clique no botão Encaminhar
   Wait Until Element Is Visible    xpath=//a[contains(.,'Encaminhar')]    timeout=30s
   Click Element    xpath=//a[contains(.,'Encaminhar')]


    ${all_windows}=    Get Window Handles
    ${second_window}=    Set Variable    ${all_windows}[0]

    Switch Window    ${all_windows}[0]
    Select Frame    //frame[contains(@name,'main')]


    # Seleção Modalidade inexibilidade
    Wait Until Element Is Visible    //form[1]/div[4]/table[1]/tbody[1]/tr[1]/td[2]/span[1]/span[1]/span[1]    timeout=30s
    Click Element    //form[1]/div[4]/table[1]/tbody[1]/tr[1]/td[2]/span[1]/span[1]/span[1]
    Sleep    1
    Wait Until Element Is Visible    //li[contains(.,'Inexigibilidade')]
    Click Element    //li[contains(.,'Inexigibilidade')]


    # Seleção critério  - LEI FEDERAL Nº 14.133/2021, ART. 74 - Inexigibilidade
    Wait Until Element Is Visible    //form[1]/div[4]/table[1]/tbody[1]/tr[3]/td[2]/span[1]/span[1]/span[1]    timeout=30s
    Click Element    //form[1]/div[4]/table[1]/tbody[1]/tr[3]/td[2]/span[1]/span[1]/span[1]
    Sleep    1
    Wait Until Element Is Visible    //li[text() = "LEI FEDERAL Nº 14.133/2021, ART. 74, CAPUT - INEXIGIBILIDADE QUANDO INVIÁVEL A COMPETIÇÃO"]    timeout=30s
    Click Element    //li[text() = "LEI FEDERAL Nº 14.133/2021, ART. 74, CAPUT - INEXIGIBILIDADE QUANDO INVIÁVEL A COMPETIÇÃO"]
    Sleep    1
    Capture Page Screenshot

    
    # Clique do botão salvar e Fechar
    Wait Until Element Is Visible    //input[@value='Salvar e fechar']
    Click Element    //input[@value='Salvar e fechar']


    # Clique no botão de confirmação
    Wait Until Element Is Visible    //a[contains(.,'Sim')]    timeout=30s
    Click Element    //a[contains(.,'Sim')]
    Sleep    3
    Capture Page Screenshot
    Sleep    1


    # Campo ustificativa
    Wait Until Element Is Visible    //textarea[contains(@name,'txtJustificativa')]    timeout=30s
    Input Text    //textarea[contains(@name,'txtJustificativa')]    Justificativa
    Capture Page Screenshot


    # Clique do botão confirmar Justificativa
    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    3
    Capture Page Screenshot
    SeleniumLibrary.Close Browser


Então faço planejamento da SC para compra Direta - Inex. - Ordenador

   # Clique no botão Encaminhar
   Wait Until Element Is Visible    xpath=//a[contains(.,'Encaminhar')]    timeout=30s
   Click Element    xpath=//a[contains(.,'Encaminhar')]


    ${all_windows}=    Get Window Handles
    ${second_window}=    Set Variable    ${all_windows}[0]

    Switch Window    ${all_windows}[0]

    Select Frame    //frame[contains(@name,'main')]


    # Seleção Modalidade inexibilidade
    Wait Until Element Is Visible    //form[1]/div[4]/table[1]/tbody[1]/tr[1]/td[2]/span[1]/span[1]/span[1]    timeout=30s
    Click Element    //form[1]/div[4]/table[1]/tbody[1]/tr[1]/td[2]/span[1]/span[1]/span[1]
    Sleep    1
    Wait Until Element Is Visible    //li[contains(.,'Inexigibilidade')]
    Click Element    //li[contains(.,'Inexigibilidade')]


    # Seleção critério  - LEI FEDERAL Nº 14.133/2021, ART. 74
    Wait Until Element Is Visible    //form[1]/div[4]/table[1]/tbody[1]/tr[3]/td[2]/span[1]/span[1]/span[1]    timeout=30s
    Click Element    //form[1]/div[4]/table[1]/tbody[1]/tr[3]/td[2]/span[1]/span[1]/span[1]
    Sleep    1
    Wait Until Element Is Visible    //li[text() = "LEI FEDERAL Nº 14.133/2021, ART. 74, CAPUT - INEXIGIBILIDADE QUANDO INVIÁVEL A COMPETIÇÃO"]    timeout=30s
    Click Element    //li[text() = "LEI FEDERAL Nº 14.133/2021, ART. 74, CAPUT - INEXIGIBILIDADE QUANDO INVIÁVEL A COMPETIÇÃO"]
    Sleep    1
    

    # clique em NÂO para pedido de descentralização
    Wait Until Element Is Visible    //input[@value='0'][contains(@id,'Nao')]    timeout=30s
    Click Element    //input[@value='0'][contains(@id,'Nao')]
    Capture Page Screenshot


    # Clique do botão salvar e Fechar
    Wait Until Element Is Visible    //input[@value='Salvar e fechar']
    Click Element    //input[@value='Salvar e fechar']


    # Clique no botão de confirmação
    Wait Until Element Is Visible    //a[contains(.,'Sim')]    timeout=30s
    Click Element    //a[contains(.,'Sim')]
    Sleep    3
    Capture Page Screenshot
    Sleep    1
    SeleniumLibrary.Close Browser


Então faço planejamento da SC para Concorrencia - Solicitante

    ${start_time}    Get Time    epoch 
    FOR    ${i}    IN RANGE    ${timeout}
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${RESUMO_SC}']]//td[9]//input
        Run Keyword If    ${element_found}    Click Element    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${RESUMO_SC}']]//td[9]//input
        Run Keyword If    ${element_found}    Exit For Loop
        
        Execute JavaScript    window.location.reload()
        Sleep    ${interval} sec

        ${current_time}=    Get Time    epoch
        ${elapsed_time}=    Evaluate    ${current_time} - ${start_time}
        Run Keyword If    ${elapsed_time} > ${timeout}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    END
    Run Keyword If    not ${element_found}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.

   # Clique no botão Encaminhar
   Wait Until Element Is Visible    xpath=//a[contains(.,'Encaminhar')]    timeout=30s
   Click Element    xpath=//a[contains(.,'Encaminhar')]


    ${all_windows}=    Get Window Handles
    ${second_window}=    Set Variable    ${all_windows}[0]

    Switch Window    ${all_windows}[0]

    Select Frame    //frame[contains(@name,'main')]


    # Seleção Modalidade inexibilidade
    Wait Until Element Is Visible    //form[1]/div[4]/table[1]/tbody[1]/tr[1]/td[2]/span[1]/span[1]/span[1]    timeout=30s
    Click Element    //form[1]/div[4]/table[1]/tbody[1]/tr[1]/td[2]/span[1]/span[1]/span[1]
    Sleep    1
    Wait Until Element Is Visible    //li[text() = "Concorrencia Eletronica"]
    Click Element    //li[text() = "Concorrencia Eletronica"]


    # Seleção critério  - LEI FEDERAL 14.133/21 - DECRETO 54.142/22
    Wait Until Element Is Visible    //form[1]/div[4]/table[1]/tbody[1]/tr[3]/td[2]/span[1]/span[1]/span[1]    timeout=30s
    Click Element    //form[1]/div[4]/table[1]/tbody[1]/tr[3]/td[2]/span[1]/span[1]/span[1]
    Sleep    1
    Wait Until Element Is Visible    //li[text() = "LICITAÇÃO NA MODALIDADE CONCORRÊNCIA ELETRÔNICA - LEI FEDERAL 14.133/21 - DECRETO 54.142/22."]    timeout=30s
    Click Element    //li[text() = "LICITAÇÃO NA MODALIDADE CONCORRÊNCIA ELETRÔNICA - LEI FEDERAL 14.133/21 - DECRETO 54.142/22."]
    Sleep    1
    Capture Page Screenshot


    # Clique do botão salvar e Fechar
    Wait Until Element Is Visible    //input[@value='Salvar e fechar']
    Click Element    //input[@value='Salvar e fechar']


    # Clique no botão de confirmação
    Wait Until Element Is Visible    //a[contains(.,'Sim')]    timeout=30s
    Click Element    //a[contains(.,'Sim')]
    Sleep    3
    Capture Page Screenshot
    Sleep    1


    # Campo ustificativa
    Wait Until Element Is Visible    //textarea[contains(@name,'txtJustificativa')]    timeout=30s
    Input Text    //textarea[contains(@name,'txtJustificativa')]    Justificativa
    Capture Page Screenshot


    # Clique do botão confirmar Justificativa
    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    3
    Capture Page Screenshot
    SeleniumLibrary.Close Browser


Então faço planejamento da SC para Concorrencia - Ordenador

   # Clique no botão Encaminhar
   Wait Until Element Is Visible    xpath=//a[contains(.,'Encaminhar')]    timeout=30s
   Click Element    xpath=//a[contains(.,'Encaminhar')]


    ${all_windows}=    Get Window Handles
    ${second_window}=    Set Variable    ${all_windows}[0]

    Switch Window    ${all_windows}[0]

    Select Frame    //frame[contains(@name,'main')]


    # Seleção Modalidade 
    Wait Until Element Is Visible    //form[1]/div[4]/table[1]/tbody[1]/tr[1]/td[2]/span[1]/span[1]/span[1]    timeout=30s
    Click Element    //form[1]/div[4]/table[1]/tbody[1]/tr[1]/td[2]/span[1]/span[1]/span[1]
    Sleep    1
    Wait Until Element Is Visible    //li[text() = "Concorrencia Eletronica"]
    Click Element    //li[text() = "Concorrencia Eletronica"]


    # Seleção critério  - LEI FEDERAL 14.133/21 - DECRETO 54.142/22
    Wait Until Element Is Visible    //form[1]/div[4]/table[1]/tbody[1]/tr[3]/td[2]/span[1]/span[1]/span[1]    timeout=30s
    Click Element    //form[1]/div[4]/table[1]/tbody[1]/tr[3]/td[2]/span[1]/span[1]/span[1]
    Sleep    1
    Wait Until Element Is Visible    //li[text() = "LICITAÇÃO NA MODALIDADE CONCORRÊNCIA ELETRÔNICA - LEI FEDERAL 14.133/21 - DECRETO 54.142/22."]    timeout=30s
    Click Element    //li[text() = "LICITAÇÃO NA MODALIDADE CONCORRÊNCIA ELETRÔNICA - LEI FEDERAL 14.133/21 - DECRETO 54.142/22."]
    Sleep    1
    

    # clique em NÂO para pedido de descentralização
    Wait Until Element Is Visible    //input[@value='0'][contains(@id,'Nao')]    timeout=30s
    Click Element    //input[@value='0'][contains(@id,'Nao')]
    Capture Page Screenshot


    # Clique no botão 'Salvar e Fechar'
    Wait Until Element Is Visible    //input[contains(@value,'Salvar e fechar')]
    Click Element    //input[contains(@value,'Salvar e fechar')]
    Sleep    2
    Capture Page Screenshot
    Sleep    2

    
    # Clique no botão de confirmação
    Wait Until Element Is Visible    //a[contains(.,'Sim')]    timeout=30s
    Click Element    //a[contains(.,'Sim')]
    Sleep    2
    Capture Page Screenshot
    Sleep    1
    SeleniumLibrary.Close Browser

E clico na solicitação da lista
    Select Frame    //iframe[contains(@name,'frmConteudo')]
    Wait Until Element Is Visible    //a[text()= "${RESUMO_SC}"]    timeout=30s
    Click Element    //a[text()= "${RESUMO_SC}"]
    Sleep    1

E Clico na aba 'Itens'
    Switch Window    NEW
    Wait Until Element Is Visible    //a[contains(.,'Itens')]    timeout=30s
    Click Element    //a[contains(.,'Itens')]
    Sleep    1
    Capture Page Screenshot


Então defino a natureza de despesa

    ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    (//span[contains(.,'Selecione')])[3]
    WHILE    ${element_found} == False
        Execute JavaScript    window.location.reload()
        Sleep    5 sec
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    (//span[contains(.,'Selecione')])[3]
    END
    Click Element    (//span[contains(.,'Selecione')])[3]


    # Clique para selecionar a natureza de despesa da seleção
    # Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'33903036 - MATERIAL HOSPITALAR')]    timeout=30s
    Wait Until Element Is Visible    //li[contains(.,'33909231 - PREMIAÇÕES CULT/ARTIST/CIENT/DESPORTIV/OUTRAS')]    20
    Capture Page Screenshot
    Sleep    1
    # Click Element    //li[@tabindex='-1'][contains(.,'33903036 - MATERIAL HOSPITALAR')]
    Click Element    //li[contains(.,'33909231 - PREMIAÇÕES CULT/ARTIST/CIENT/DESPORTIV/OUTRAS')]
    Capture Page Screenshot

    # Clique no botão 'Salvar e fechar'
    Wait Until Element Is Visible    //a[contains(.,'Salvar e fechar')]    timeout=30s
    Capture Page Screenshot
    Click Element    //a[contains(.,'Salvar e fechar')]
    Sleep    3
    SeleniumLibrary.Close Browser
    

E acesso 'Minhas Tarefas'

    Select Frame    //frame[contains(@name,'main')]

    # Clique no menu 'Arquivo'
    Wait Until Element Is Visible    //div[@unselectable='on'][contains(.,'Arquivo')]    timeout=30s
    Click Element    //div[@unselectable='on'][contains(.,'Arquivo')]

    # mouse over em Tarefas
    ${elemento}    Get WebElement    
    ...    //td[@class='label'][contains(.,'Tarefas')]
    Mouse Over    ${elemento}

    # Clique em 'Minhas tarefas'
    Wait Until Element Is Visible    //td[@class='label'][contains(.,'Minhas tarefas')]    timeout=30s
    Click Element    //td[@class='label'][contains(.,'Minhas tarefas')]
    Sleep    2
    Capture Page Screenshot


E seleciono a SC para aprovação
   
    ${start_time}    Get Time    epoch
    Select Frame    //iframe[contains(@name,'frmConteudo')]
    FOR    ${i}    IN RANGE    ${timeout}
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //*[contains(text(), '${RESUMO_SC}')]
        Run Keyword If    ${element_found}    Click Element    //*[contains(text(), '${RESUMO_SC}')]
        Run Keyword If    ${element_found}    Exit For Loop
        
        Execute JavaScript    window.location.reload()
        Sleep    ${interval} sec

        ${current_time}=    Get Time    epoch
        ${elapsed_time}=    Evaluate    ${current_time} - ${start_time}
        Run Keyword If    ${elapsed_time} > ${timeout}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    END
    Run Keyword If    not ${element_found}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    Capture Page Screenshot



Então Clique no botão Aprovar com orçamento

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


E Clico em Ciente

    ${all_windows}=    Get Window Handles
    ${second_window}=    Set Variable    ${all_windows}[0]

    Switch Window    ${all_windows}[0]

    Select Frame    //frame[contains(@name,'main')]
   
    Wait Until Element Is Visible    //a[contains(.,'Ciente')]    timeout=30s
    Capture Page Screenshot
    Click Element    //a[contains(.,'Ciente')]
    Sleep    3
    Capture Page Screenshot
    Sleep    2


Então Clique no botão Aprovar com ordenador

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


E acesso a lista de SC centralizada
    Select Frame    xpath=//frame[contains(@name,'main')]

    # Clique em negociação
    Wait Until Element Is Visible    xpath=//div[@unselectable='on'][contains(.,'Negociação')]    timeout=30s
    Click Element    xpath=//div[@unselectable='on'][contains(.,'Negociação')]

    # mouse over em Solicitação de Compras
    ${elemento}    Get WebElement 
    ...    xpath=//td[@class='label'][contains(.,'Solicitação de compra')]
    Mouse Over    ${elemento}
    
    # Clique em Lista de Solicitaão de Compras
    Wait Until Element Is Visible    
    ...    xpath=//td[@class='label'][contains(.,'Solicitações de compra centralizadas')]    timeout=30s
    Click Element    
    ...    xpath=//td[@class='label'][contains(.,'Solicitações de compra centralizadas')]
    Sleep    2
    Capture Page Screenshot


E pesquiso por SC 'Aguardando Liberação'

    Select Frame    xpath=//iframe[contains(@name,'frmConteudo')]

   # Clicar no campo Exibir
   Wait Until Element Is Visible    xpath=//select[@id= "ctl00_ddlVisoes"]    timeout=30s
   Click Element    xpath=//select[@id= "ctl00_ddlVisoes"]
   Capture Page Screenshot

   # Clicar na seleção 'SC em precificação'
   Click Element    xpath=//select[@id= "ctl00_ddlVisoes"]//*[@value='1010005']

   # Clique no botão Pesquisar
   Wait Until Element Is Visible    xpath=//input[@value= "Pesquisar"]    timeout=30s
   Click Element    xpath=//input[@value= "Pesquisar"]
   Capture Page Screenshot


Então seleciono a SC e aprovo

    Wait Until Element Is Visible    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${RESUMO_SC}']]//td[9]//input    timeout=30s
    Click Element    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${RESUMO_SC}']]//td[9]//input
    Capture Page Screenshot
    Click Element    //a[contains(.,'Aprovar')]
    Sleep    3
    SeleniumLibrary.Close Browser


E pesquiso por SC 'Aguardando Deliberação'

    Select Frame    xpath=//iframe[contains(@name,'frmConteudo')]

   # Clicar no campo Exibir
   Wait Until Element Is Visible    xpath=//select[@id= "ctl00_ddlVisoes"]    timeout=30s
   Click Element    xpath=//select[@id= "ctl00_ddlVisoes"]
   Capture Page Screenshot

   # Clicar na seleção 'SC em deliberação'
   Click Element    xpath=//select[@id= "ctl00_ddlVisoes"]//*[@value='31084']

   # Clique no botão Pesquisar
   Wait Until Element Is Visible    xpath=//input[@value= "Pesquisar"]    timeout=30s
   Click Element    xpath=//input[@value= "Pesquisar"]
   Capture Page Screenshot


E seleciono a SC e clico

    Wait Until Element Is Visible    //a[text()= "${RESUMO_SC}"]    timeout=30s
    Click Element    //a[text()= "${RESUMO_SC}"]
    Sleep    1

Então faço a deliberação da SC

    Switch Window    NEW
    Capture Page Screenshot

    Wait Until Element Is Visible    //input[contains(@value,'Deliberar')]
    Click Element    //input[contains(@value,'Deliberar')]

    Wait Until Element Is Visible    css=input[id="ctl00_ContentPrincipal_resultadoAnalise_0"]    timeout=30s
    Click Element    css=input[id="ctl00_ContentPrincipal_resultadoAnalise_0"]

    Input Text    //textarea[contains(@name,'txtJustificativa')]    Justificativa
    Capture Page Screenshot

    Click Element    //a[contains(.,'Confirmar')]
    Sleep    3
    SeleniumLibrary.Close Browser

E acesso a lista de Planejamento de Compras - Ambiente Treinamento

    Select Frame    xpath=//frame[contains(@name,'main')]

    # Clique em negociação
    Wait Until Element Is Visible    xpath=//div[@unselectable='on'][contains(.,'Negociação')]    timeout=30s
    Click Element    xpath=//div[@unselectable='on'][contains(.,'Negociação')]

    # mouse over em Solicitação de Compras
    ${elemento}    Get WebElement    
    ...    xpath=//td[@class='label'][contains(.,'Solicitação de compra')]
    Mouse Over    ${elemento}
    
    # Clique em planejamento de Compras
    Wait Until Element Is Visible    
    ...    xpath=//td[@class='label'][contains(.,'Planejamento de compra')]    timeout=30s
    Click Element    
    ...    xpath=//td[@class='label'][contains(.,'Planejamento de compra')]

    # Ocultar Icones de Chat
    # Sleep    2
    # Wait Until Element Is Visible    //img[contains(@class,'open-launcher')]    timeout=10
    # Execute Javascript    document.querySelector("img.open-launcher").style.display = 'none';
    # Sleep    1
    # Wait Until Element Is Visible    //div[@class='tooltip-body'][contains(.,'Olá! Como posso ajudar?')]
    # Execute Javascript    document.querySelector("div.tooltip-body").style.display = 'none';
    # Execute JavaScript    document.querySelector('.launcher').style.display = 'none';
    Sleep    3


E acesso a lista de Planejamento de Compras

    Select Frame    xpath=//frame[contains(@name,'main')]

    # Clique em negociação
    Wait Until Element Is Visible    xpath=//div[@unselectable='on'][contains(.,'Negociação')]    timeout=30s
    Click Element    xpath=//div[@unselectable='on'][contains(.,'Negociação')]

    # mouse over em Solicitação de Compras
    ${elemento}    Get WebElement    
    ...    xpath=//td[@class='label'][contains(.,'Solicitação de compra')]
    Mouse Over    ${elemento}
    
    # Clique em planejamento de Compras
    Wait Until Element Is Visible    
    ...    xpath=//td[@class='label'][contains(.,'Planejamento de compra')]    timeout=30s
    Click Element    
    ...    xpath=//td[@class='label'][contains(.,'Planejamento de compra')]

    # Ocultar Icones de Chat
    Sleep    2
    Wait Until Element Is Visible    //img[contains(@class,'open-launcher')]    timeout=10
    Execute Javascript    document.querySelector("img.open-launcher").style.display = 'none';
    Sleep    1
    Wait Until Element Is Visible    //div[@class='tooltip-body'][contains(.,'Olá! Como posso ajudar?')]
    Execute Javascript    document.querySelector("div.tooltip-body").style.display = 'none';
    Execute JavaScript    document.querySelector('.launcher').style.display = 'none';
    Sleep    3
    
    Capture Page Screenshot


E seleciono o filtro SC em Planejamento - Ordenador

    Capture Page Screenshot
    Select Frame    xpath=//iframe[contains(@name,'frmConteudo')]

   # Clicar no campo Exibir
   Wait Until Element Is Visible    xpath=//select[@id= "ctl00_ddlVisoes"]    timeout=30s
   Click Element    xpath=//select[@id= "ctl00_ddlVisoes"]
   Capture Page Screenshot

   # Clicar na seleção 'SC em precificação'
   Click Element    xpath=//select[@id= "ctl00_ddlVisoes"]//*[@value='31063']

   # Clique no botão Pesquisar
   Wait Until Element Is Visible    xpath=//input[@value= "Pesquisar"]    timeout=30s
   Click Element    xpath=//input[@value= "Pesquisar"]
   Capture Page Screenshot

E navego para a última página

    ${page_numbers} =    Get WebElements    //a[@class='aPagina']
    ${last_page} =       Set Variable    //a[@class='aPagina'][last()]
    Log    Número da última página: ${last_page}
    Click Element    ${last_page}
    sleep    2
    # Wait Until Page Contains Element    xpath=//table[contains(@class, 'listagem')]

E seleciono a SC - Ambiente Treinamento
    ${start_time}    Get Time    epoch
    ${element_found}    Set Variable    False
    
    FOR    ${i}    IN RANGE    ${TIMEOUT}
        Sleep    ${INTERVAL}
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${RESUMO_SC}']]//td[8]//input   
        Run Keyword If    ${element_found}    Click Element    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${RESUMO_SC}']]//td[8]//input
        Run Keyword If    ${element_found}    Set Variable    ${element_found}    True
        Run Keyword If    ${element_found}    Exit For Loop

        # Só recarrega a página se o elemento não foi encontrado
        Execute JavaScript    window.location.reload()
        Sleep    ${INTERVAL}

        ${current_time}    Get Time    epoch
        ${elapsed_time}    Evaluate    ${current_time} - ${start_time}
        Run Keyword If    ${elapsed_time} > ${TIMEOUT}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    END

    # Verificação final para garantir que o elemento foi encontrado
    Run Keyword If    not ${element_found}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    Capture Page Screenshot

E seleciono a SC

    ${start_time}    Get Time    epoch
    FOR    ${i}    IN RANGE    ${timeout}
        Sleep    ${interval}
        Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
        Sleep    1
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${RESUMO_SC}']]//td[8]//input   
        Run Keyword If    ${element_found}    Click Element    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${RESUMO_SC}']]//td[8]//input
        Run Keyword If    ${element_found}    Exit For Loop

        Execute JavaScript    window.location.reload()
        Sleep    ${interval}

        ${current_time}=    Get Time    epoch
        ${elapsed_time}=    Evaluate    ${current_time} - ${start_time}
        Run Keyword If    ${elapsed_time} > ${timeout}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    END
    

Então faço o planejamento para Pregão Eletrônico - OPD

    # Clique no botão Encaminhar
   Wait Until Element Is Visible    xpath=//a[contains(.,'Encaminhar')]    timeout=30s
   Click Element    xpath=//a[contains(.,'Encaminhar')]

    ${all_windows}=    Get Window Handles
    ${second_window}=    Set Variable    ${all_windows}[0]

    Switch Window    ${all_windows}[0]

    Select Frame    //frame[contains(@name,'main')]


    # Seleção Modalidade pregão eletronico
    Wait Until Element Is Visible    //form[1]/div[4]/table[1]/tbody[1]/tr[1]/td[2]/span[1]    timeout=30s
    Click Element    //form[1]/div[4]/table[1]/tbody[1]/tr[1]/td[2]/span[1]
    Sleep    1
    Wait Until Element Is Visible    //li[contains(.,'Pregao Eletronico')]
    Click Element    //li[contains(.,'Pregao Eletronico')]


    # Seleção critério  - Pregão eletronico LEI FEDERAL 14.133/21
    Wait Until Element Is Visible    //form[1]/div[4]/table[1]/tbody[1]/tr[3]/td[2]/span[1]/span[1]/span[1]    timeout=30s
    Click Element    //form[1]/div[4]/table[1]/tbody[1]/tr[3]/td[2]/span[1]/span[1]/span[1]
    Sleep    1
    Wait Until Element Is Visible    //li[contains(.,'LICITAÇÃO NA MODALIDADE PREGÃO ELETRÔNICO - LEI FEDERAL 14.133/21 - DECRETO 54.142/22')]    timeout=30s
    Click Element    //li[contains(.,'LICITAÇÃO NA MODALIDADE PREGÃO ELETRÔNICO - LEI FEDERAL 14.133/21 - DECRETO 54.142/22')]


    # clique em NÂO para pedido de descentralização
    Wait Until Element Is Visible    //input[@value='0'][contains(@id,'Nao')]    timeout=30s
    Click Element    //input[@value='0'][contains(@id,'Nao')]
    Capture Page Screenshot

    Wait Until Element Is Visible    //input[contains(@value,'Salvar e fechar')]
    Click Element    //input[contains(@value,'Salvar e fechar')]
    Sleep    2


    # Clique no botão de confirmação
    Wait Until Element Is Visible    //a[contains(.,'Sim')]    timeout=30s
    Click Element    //a[contains(.,'Sim')]
    Sleep    3
    Capture Page Screenshot
    Sleep    1

    # Campo justificativa
    Wait Until Element Is Visible    //textarea[contains(@name,'txtJustificativa')]    timeout=30s
    Input Text    //textarea[contains(@name,'txtJustificativa')]    Justificativa
    Capture Page Screenshot


    # Clique no botão confirmar justificativa
    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    timeout=30s
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    4
    Capture Page Screenshot
    Sleep    1
    SeleniumLibrary.Close Browser
 

Então faço o planejamento para Pregão Eletrônico

    # Clique no botão Encaminhar
   Wait Until Element Is Visible    xpath=//a[contains(.,'Encaminhar')]    timeout=30s
   Click Element    xpath=//a[contains(.,'Encaminhar')]

    ${all_windows}=    Get Window Handles
    ${second_window}=    Set Variable    ${all_windows}[0]

    Switch Window    ${all_windows}[0]

    Select Frame    //frame[contains(@name,'main')]


    # Seleção Modalidade pregão eletronico
    Wait Until Element Is Visible    //form[1]/div[4]/table[1]/tbody[1]/tr[1]/td[2]/span[1]    timeout=30s
    Click Element    //form[1]/div[4]/table[1]/tbody[1]/tr[1]/td[2]/span[1]
    Sleep    1
    Wait Until Element Is Visible    //li[contains(.,'Pregao Eletronico')]
    Click Element    //li[contains(.,'Pregao Eletronico')]


    # Seleção critério  - Pregão eletronico LEI FEDERAL 14.133/21
    Wait Until Element Is Visible    //form[1]/div[4]/table[1]/tbody[1]/tr[3]/td[2]/span[1]/span[1]/span[1]    timeout=30s
    Click Element    //form[1]/div[4]/table[1]/tbody[1]/tr[3]/td[2]/span[1]/span[1]/span[1]
    Sleep    1
    Wait Until Element Is Visible    //li[contains(.,'LICITAÇÃO NA MODALIDADE PREGÃO ELETRÔNICO - LEI FEDERAL 14.133/21 - DECRETO 54.142/22')]    timeout=30s
    Click Element    //li[contains(.,'LICITAÇÃO NA MODALIDADE PREGÃO ELETRÔNICO - LEI FEDERAL 14.133/21 - DECRETO 54.142/22')]


    # clique em NÂO para pedido de descentralização
    Wait Until Element Is Visible    //input[@value='0'][contains(@id,'Nao')]    timeout=30s
    Click Element    //input[@value='0'][contains(@id,'Nao')]
    Capture Page Screenshot

    Wait Until Element Is Visible    //input[contains(@value,'Salvar e fechar')]
    Click Element    //input[contains(@value,'Salvar e fechar')]
    Sleep    2


    # Clique no botão de confirmação
    Wait Until Element Is Visible    //a[contains(.,'Sim')]    timeout=30s
    Click Element    //a[contains(.,'Sim')]
    Sleep    3
    Capture Page Screenshot
    Sleep    1
    SeleniumLibrary.Close Browser


Então faço planejamento da SC para compra Direta - Dispensa Emergencial - Ordenador
 
    # Clique no botão Encaminhar
   Wait Until Element Is Visible    xpath=//a[contains(.,'Encaminhar')]    timeout=30s
   Click Element    xpath=//a[contains(.,'Encaminhar')]

    ${all_windows}=    Get Window Handles
    ${second_window}=    Set Variable    ${all_windows}[0]
    Switch Window    ${all_windows}[0]
    Select Frame    //frame[contains(@name,'main')]


    # Seleção Modalidade Dispensa Emergencial
    Wait Until Element Is Visible    //form[1]/div[4]/table[1]/tbody[1]/tr[1]/td[2]/span[1]    timeout=30s
    Click Element    //form[1]/div[4]/table[1]/tbody[1]/tr[1]/td[2]/span[1]
    Sleep    1
    Wait Until Element Is Visible    //li[contains(.,'Dispensa Emergencial')]
    Click Element    //li[contains(.,'Dispensa Emergencial')]


    # Seleção critério  - LEI 14.133/2021, ART. 75, VIII
    Wait Until Element Is Visible    //form[1]/div[4]/table[1]/tbody[1]/tr[3]/td[2]/span[1]/span[1]/span[1]    timeout=30s
    Click Element    //form[1]/div[4]/table[1]/tbody[1]/tr[3]/td[2]/span[1]/span[1]/span[1]
    Sleep    1
    Wait Until Element Is Visible    //li[text() = "LEI 14.133/2021, ART. 75, VIII - DISPENSA POR EMERGÊNCIA OU DE CALAMIDADE PÚBLICA"]    timeout=30s
    Click Element    //li[text() = "LEI 14.133/2021, ART. 75, VIII - DISPENSA POR EMERGÊNCIA OU DE CALAMIDADE PÚBLICA"]


    # clique em NÂO para pedido de descentralização
    Wait Until Element Is Visible    //input[@value='0'][contains(@id,'Nao')]    timeout=30s
    Click Element    //input[@value='0'][contains(@id,'Nao')]
    Capture Page Screenshot


    Wait Until Element Is Visible    //input[contains(@value,'Salvar e fechar')]
    Click Element    //input[contains(@value,'Salvar e fechar')]
    Sleep    2


    # Clique no botão de confirmação
    Wait Until Element Is Visible    //a[contains(.,'Sim')]    timeout=30s
    Click Element    //a[contains(.,'Sim')]
    Sleep    3
    Capture Page Screenshot
    Sleep    2
    SeleniumLibrary.Close Browser



Então faço planejamento da SC para compra Direta - Dispensa Emergencial - Solicitante

    ${start_time}    Get Time    epoch 
    FOR    ${i}    IN RANGE    ${timeout}
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${RESUMO_SC}']]//td[9]//input
        Run Keyword If    ${element_found}    Click Element    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${RESUMO_SC}']]//td[9]//input
        Run Keyword If    ${element_found}    Exit For Loop
        
        Execute JavaScript    window.location.reload()
        Sleep    ${interval} sec

        ${current_time}=    Get Time    epoch
        ${elapsed_time}=    Evaluate    ${current_time} - ${start_time}
        Run Keyword If    ${elapsed_time} > ${timeout}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    END
    Run Keyword If    not ${element_found}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.

    # Clique no botão Encaminhar
   Wait Until Element Is Visible    xpath=//a[contains(.,'Encaminhar')]    timeout=30s
   Click Element    xpath=//a[contains(.,'Encaminhar')]
   Capture Page Screenshot

    ${all_windows}=    Get Window Handles
    ${second_window}=    Set Variable    ${all_windows}[0]

    Switch Window    ${all_windows}[0]

    Select Frame    //frame[contains(@name,'main')]


    # Seleção Modalidade Dispensa Emergencial
    Wait Until Element Is Visible    //form[1]/div[4]/table[1]/tbody[1]/tr[1]/td[2]/span[1]    timeout=30s
    Click Element    //form[1]/div[4]/table[1]/tbody[1]/tr[1]/td[2]/span[1]
    Sleep    1
    Wait Until Element Is Visible    //li[contains(.,'Dispensa Emergencial')]
    Click Element    //li[contains(.,'Dispensa Emergencial')]


    # Seleção critério  - LEI 14.133/2021, ART. 75, VIII
    Wait Until Element Is Visible    //form[1]/div[4]/table[1]/tbody[1]/tr[3]/td[2]/span[1]/span[1]/span[1]    timeout=30s
    Click Element    //form[1]/div[4]/table[1]/tbody[1]/tr[3]/td[2]/span[1]/span[1]/span[1]
    Sleep    1
    Wait Until Element Is Visible    //li[text() = "LEI 14.133/2021, ART. 75, VIII - DISPENSA POR EMERGÊNCIA OU DE CALAMIDADE PÚBLICA"]    timeout=30s
    Click Element    //li[text() = "LEI 14.133/2021, ART. 75, VIII - DISPENSA POR EMERGÊNCIA OU DE CALAMIDADE PÚBLICA"]
    Capture Page Screenshot


    # Clique do botão salvar e Fechar
    Wait Until Element Is Visible    //input[@value='Salvar e fechar']
    Click Element    //input[@value='Salvar e fechar']


    # Clique no botão de confirmação
    Wait Until Element Is Visible    //a[contains(.,'Sim')]    timeout=30s
    Click Element    //a[contains(.,'Sim')]
    Sleep    3
    Capture Page Screenshot
    Sleep    1


    # Campo justificativa
    Wait Until Element Is Visible    //textarea[contains(@name,'txtJustificativa')]    timeout=30s
    Input Text    //textarea[contains(@name,'txtJustificativa')]    Justificativa
    Capture Page Screenshot


    # Clique do botão confirmar Justificativa
    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    3
    Capture Page Screenshot
    SeleniumLibrary.Close Browser

Então faço planejamento da SC para Compra Direta - Dispensa - Ordenador

    # Clique no botão Encaminhar
    Sleep    2
   Wait Until Element Is Visible    xpath=//a[contains(.,'Encaminhar')]    timeout=30s
   Click Element    xpath=//a[contains(.,'Encaminhar')]

    ${all_windows}=    Get Window Handles
    ${second_window}=    Set Variable    ${all_windows}[0]

    Switch Window    ${all_windows}[0]

    Select Frame    //frame[contains(@name,'main')]


    # Seleção Modalidade Dispensa
    Wait Until Element Is Visible    //form[1]/div[4]/table[1]/tbody[1]/tr[1]/td[2]/span[1]    timeout=30s
    Click Element    //form[1]/div[4]/table[1]/tbody[1]/tr[1]/td[2]/span[1]
    Sleep    1
    Wait Until Element Is Visible    //li[text() = "Dispensa"]
    Click Element    //li[text() = "Dispensa"]


    # Seleção critério  - LEI 14.133/2021, ART. 75, VIII
    Wait Until Element Is Visible    //form[1]/div[4]/table[1]/tbody[1]/tr[3]/td[2]/span[1]/span[1]/span[1]    timeout=30s
    Click Element    //form[1]/div[4]/table[1]/tbody[1]/tr[3]/td[2]/span[1]/span[1]/span[1]
    Sleep    1
    Wait Until Element Is Visible    //li[text() = "LEI 14.133/2021, ART. 75, VIII - DISPENSA POR EMERGÊNCIA OU DE CALAMIDADE PÚBLICA"]    timeout=30s
    Click Element    //li[text() = "LEI 14.133/2021, ART. 75, VIII - DISPENSA POR EMERGÊNCIA OU DE CALAMIDADE PÚBLICA"]
    

    # clique em NÂO para pedido de descentralização/Centralização
    Wait Until Element Is Visible    //input[@value='0'][contains(@id,'Nao')]    timeout=30s
    Click Element    //input[@value='0'][contains(@id,'Nao')]
    Capture Page Screenshot


    # Clique do botão salvar e Fechar
    Wait Until Element Is Visible    //input[@value='Salvar e fechar']
    Click Element    //input[@value='Salvar e fechar']


    # Clique no botão de confirmação
    Wait Until Element Is Visible    //a[contains(.,'Sim')]    timeout=30s
    Click Element    //a[contains(.,'Sim')]
    Sleep    3
    Capture Page Screenshot
    Sleep    2
    SeleniumLibrary.Close Browser


E acesso a tela de Solicitação de compras centralizadas
    Select Frame    xpath=//frame[contains(@name,'main')]

    # Clique em negociação
    Wait Until Element Is Visible    xpath=//div[@unselectable='on'][contains(.,'Negociação')]    timeout=30s
    Click Element    xpath=//div[@unselectable='on'][contains(.,'Negociação')]

    # mouse over em Solicitação de Compras
    ${elemento}    Get WebElement    
    ...    xpath=//td[@class='label'][contains(.,'Solicitação de compra')]
    Mouse Over    ${elemento}
    
    # Clique em planejamento de Compras
    Wait Until Element Is Visible    
    ...    xpath=//td[@class='label'][contains(.,'Solicitações de compra centralizadas')]    timeout=30s
    Click Element    
    ...    xpath=//td[@class='label'][contains(.,'Solicitações de compra centralizadas')]
    # Sleep    2
    Capture Page Screenshot


E acesso a tela de Planejamento de compras
    Select Frame    xpath=//frame[contains(@name,'main')]

    # Clique em negociação
    Wait Until Element Is Visible    xpath=//div[@unselectable='on'][contains(.,'Negociação')]    timeout=30s
    Click Element    xpath=//div[@unselectable='on'][contains(.,'Negociação')]

    # mouse over em Solicitação de Compras
    ${elemento}    Get WebElement    
    ...    xpath=//td[@class='label'][contains(.,'Solicitação de compra')]
    Mouse Over    ${elemento}

    # Clique em planejamento de Compras
    Wait Until Element Is Visible    
    ...    xpath=//td[@class='label'][contains(.,'Planejamento de compra')]    timeout=30s
    Click Element    
    ...    xpath=//td[@class='label'][contains(.,'Planejamento de compra')]
    Sleep    3

    # Ocultar Icones de Chat
    # Sleep    2
    # Wait Until Element Is Visible    //img[contains(@class,'open-launcher')]    timeout=10
    # Execute Javascript    document.querySelector("img.open-launcher").style.display = 'none';
    # Sleep    1
    # Wait Until Element Is Visible    //div[@class='tooltip-body'][contains(.,'Olá! Como posso ajudar?')]
    # Execute Javascript    document.querySelector("div.tooltip-body").style.display = 'none';
    # Execute JavaScript    document.querySelector('.launcher').style.display = 'none';
    # Sleep    1
    
    Capture Page Screenshot


E pesquiso por SC aguradando atribuir comissão
    Select Frame    xpath=//iframe[contains(@name,'frmConteudo')]

   # Clicar no campo Exibir
   Wait Until Element Is Visible    xpath=//select[@id= "ctl00_ddlVisoes"]    timeout=30s
   Click Element    xpath=//select[@id= "ctl00_ddlVisoes"]

   # Clicar na seleção 'SC'
   Click Element    xpath=//select[@id= "ctl00_ddlVisoes"]//*[@value='1010003']

   # Clique no botão Pesquisar
   Wait Until Element Is Visible    xpath=//input[@value= "Pesquisar"]    timeout=30s
   Click Element    xpath=//input[@value= "Pesquisar"]
   Capture Page Screenshot


E pesquiso por atribuir comissão com planejador
    Select Frame    xpath=//iframe[contains(@name,'frmConteudo')]

   # Clicar no campo Exibir
   Wait Until Element Is Visible    xpath=//select[@id= "ctl00_ddlVisoes"]    timeout=30s
   Click Element    xpath=//select[@id= "ctl00_ddlVisoes"]
   Capture Page Screenshot

   # Clicar na seleção 'SC'
   Click Element    xpath=//select[@id= "ctl00_ddlVisoes"]//*[@value='31508']

   # Clique no botão Pesquisar
   Wait Until Element Is Visible    xpath=//input[@value= "Pesquisar"]    timeout=30s
   Click Element    xpath=//input[@value= "Pesquisar"]
   Capture Page Screenshot


E seleciono a SC para atribuir comissão com Gestor Central

    ${start_time}    Get Time    epoch
    FOR    ${i}    IN RANGE    ${timeout}
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${RESUMO_SC}']]//td[9]//input
        Run Keyword If    ${element_found}    Click Element    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${RESUMO_SC}']]//td[9]//input
        Run Keyword If    ${element_found}    Exit For Loop
        
        Execute JavaScript    window.location.reload()
        Sleep    ${interval} sec

        ${current_time}=    Get Time    epoch
        ${elapsed_time}=    Evaluate    ${current_time} - ${start_time}
        Run Keyword If    ${elapsed_time} > ${timeout}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    END
    Run Keyword If    not ${element_found}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    Capture Page Screenshot

 
E seleciono a SC para atribuir comissão com Planejador

    
    ${start_time}    Get Time    epoch
    FOR    ${i}    IN RANGE    ${timeout}

        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${RESUMO_SC}']]//td[8]//input
        Run Keyword If    ${element_found}    Click Element    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${RESUMO_SC}']]//td[8]//input
        Run Keyword If    ${element_found}    Exit For Loop
        
        Execute JavaScript    window.location.reload()
        Sleep    ${interval} sec

        ${current_time}=    Get Time    epoch
        ${elapsed_time}=    Evaluate    ${current_time} - ${start_time}
        Run Keyword If    ${elapsed_time} > ${timeout}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    END
    Run Keyword If    not ${element_found}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    Capture Page Screenshot


Então atribuo a Comissão Permanente de Licitação
    
    # Clique no botão 'atribuir comissão'
    Click Element    //a[contains(.,'Atribuir comissão')]

    # Busca pela comissão no campo 'Descrição'
    Wait Until Element Is Visible    //input[@id="ctl00_ContentPrincipal_tbxComissao"]    timeout=30s
    Input Text    //input[@id="ctl00_ContentPrincipal_tbxComissao"]
    ...    COMISSÃO PERMANENTE DE LICITAÇÃO - 120101

    # Clique no botão pesquisar
    Click Element    //a[contains(.,'Pesquisar')]

    # Clique para selecionar a comissão
    Wait Until Element Is Visible    //input[@value='169|COMISSÃO PERMANENTE DE LICITAÇÃO - 120101']    timeout=30s
    Click Element    //input[@value='169|COMISSÃO PERMANENTE DE LICITAÇÃO - 120101']
    Capture Page Screenshot


    # clique do botão 'Confirma'
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    3
    SeleniumLibrary.Close Browser


E clico na SC da lista no Homol03
    Sleep    1
    # Select Frame    //iframe[contains(@name,'frmConteudo')]
    Sleep    2
    Wait Until Element Is Visible    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${RESUMO_SC}']]//td[2]//a    timeout=30s
    Sleep    2
    Click Element    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${RESUMO_SC}']]//td[2]//a
    Sleep    2



E seleciono a SC da lista
    Sleep    1
    Select Frame    //iframe[contains(@name,'frmConteudo')]
    Sleep    2
    Wait Until Element Is Visible    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${RESUMO_SC}']]//td[2]//a    timeout=30s
    Sleep    2
    Click Element    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${RESUMO_SC}']]//td[2]//a
    Sleep    2
 

Então incluo os itens e agrupo por lote
    
    #Campo Descrição
    # Wait Until Element Is Visible    //input[contains(@name,'txtDescricao')]    timeout=30s
    Input Text     //*[@name="ctl00$ContentPrincipal$txtCodigo"]    1000268    15
    # Input Text    //input[contains(@name,'txtDescricao')]    TUBO DE SILICONE

    #Pesquisar Item
    Click Element    //a[contains(@onclick,'AtualizarPesquisaProduto()')]


    # Item 01 - Selecionar
    Wait Until Element Is Visible    (//input[contains(@id,'ckbListProduto')])[1]    timeout=30s
    Click Element    (//input[contains(@id,'ckbListProduto')])[1]

    # Item 02
    # Wait Until Element Is Visible    (//input[contains(@type,'checkbox')])[5]    timeout=30s
    # Click Element    (//input[contains(@id,'ckbListProduto')])[2] 

    Capture Page Screenshot     

    # Confirmar Item
    Click Element    //*[@id="ctl00_ContentButtom_btnConfirmar"]


    # Clique para marcar o checkbox Todos
    Wait Until Element Is Visible    //table[3]/tbody[1]/tr[1]/td[1]/div[1]/div[4]/div[1]/input[1]    timeout=30s
    Click Element    //table[3]/tbody[1]/tr[1]/td[1]/div[1]/div[4]/div[1]/input[1]

    # Clique do botão agrupar por Lote''
    Wait Until Element Is Visible    //a[contains(.,'Agrupar por lote')]    timeout=30s
    Click Element    //a[contains(.,'Agrupar por lote')]

    ${all_windows}=    Get Window Handles
 
    Switch Window    NEW
    Wait Until Element Is Visible    //input[contains(@field,'normal')]    timeout=30s
    Input Text    //input[contains(@field,'normal')]    Lote Único
    Capture Page Screenshot

    Click Element    //input[contains(@value,'Salvar')]
    Sleep    3

   ${second_window}=    Set Variable    ${all_windows}[1]
    Switch Window    ${second_window}

    # Implementar aqui a quantidade do item
    # Item 01
    Wait Until Element Is Visible    //table[1]/tbody[1]/tr[3]/td[1]/span[2]/span[1]/span[1]/span[1]/span[1]    timeout=30s
    Double Click Element    //table[1]/tbody[1]/tr[3]/td[1]/span[2]/span[1]/span[1]/span[1]/span[1]
    Double Click Element    //table[1]/tbody[1]/tr[3]/td[1]/span[2]/span[1]/span[1]/span[1]/span[1]
    Double Click Element    //table[1]/tbody[1]/tr[3]/td[1]/span[2]/span[1]/span[1]/span[1]/span[1]
    Double Click Element    //table[1]/tbody[1]/tr[3]/td[1]/span[2]/span[1]/span[1]/span[1]/span[1]
    Double Click Element    //table[1]/tbody[1]/tr[3]/td[1]/span[2]/span[1]/span[1]/span[1]/span[1]

    # Item 02
    # Wait Until Element Is Visible    //table[1]/tbody[1]/tr[5]/td[1]/span[2]/span[1]/span[1]/span[1]/span[1]    timeout=30s
    # Double Click Element    //table[1]/tbody[1]/tr[5]/td[1]/span[2]/span[1]/span[1]/span[1]/span[1]
    Capture Page Screenshot


    #  Click no botão 'Salvar'
    Wait Until Element Is Visible    xpath=//*[@id="ctl00_conteudoBotoes_btSalvar"]    timeout=30s
    Capture Page Screenshot
    Click Element         xpath=//*[@id="ctl00_conteudoBotoes_btSalvar"]
    
    Sleep    4
    SeleniumLibrary.Close Browser

Então atribuo a comissão de Compra Direta - TJ

    # Clique no botão 'atribuir comissão'
    Click Element    //a[contains(.,'Atribuir comissão')]

    # Busca pela comissão no campo 'Descrição'
    Wait Until Element Is Visible    //input[@id="ctl00_ContentPrincipal_tbxComissao"]    timeout=30s
    Input Text    //input[@id="ctl00_ContentPrincipal_tbxComissao"]
    ...    COMISSÃO DE COMPRA DIRETA

    # Clique no botão pesquisar
    Click Element    //a[contains(.,'Pesquisar')]

    # Clique para selecionar a comissão
    Wait Until Element Is Visible    //input[@value='17|Comissão de Compra Direta - TJPE']    timeout=30s
    Click Element    //input[@value='17|Comissão de Compra Direta - TJPE']
    Capture Page Screenshot


    # clique do botão 'Confirma'
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    3
    SeleniumLibrary.Close Browser

Então atribuo a comissão de Compra Direta - SEDUC
   
    # Clique no botão 'atribuir comissão'
    Click Element    //a[contains(.,'Atribuir comissão')]

    # Busca pela comissão no campo 'Descrição'
    Wait Until Element Is Visible    //input[@id="ctl00_ContentPrincipal_tbxComissao"]    timeout=30s
    Input Text    //input[@id="ctl00_ContentPrincipal_tbxComissao"]
    ...    COMISSÃO DE COMPRA DIRETA

    # Clique no botão pesquisar
    Click Element    //a[contains(.,'Pesquisar')]

    # Clique para selecionar a comissão
    Wait Until Element Is Visible    //input[@value='243|COMISSÃO DE COMPRA DIRETA']    timeout=30s
    Click Element    //input[@value='243|COMISSÃO DE COMPRA DIRETA']
    Capture Page Screenshot


    # clique do botão 'Confirma'
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    3
    SeleniumLibrary.Close Browser

    
E clico em Atribuir Comissão
    Click Element    //a[contains(.,'Atribuir comissão')]
    Sleep    2
    Capture Page Screenshot


Então atribuo a comissão de Compra Direta

    # Busca pela comissão no campo 'Descrição'
    Wait Until Element Is Visible    //input[@id="ctl00_ContentPrincipal_tbxComissao"]    30
    Input Text    //input[@id="ctl00_ContentPrincipal_tbxComissao"]
    ...    COMISSÃO DE COMPRA DIRETA

    # Clique no botão pesquisar
    Click Element    //a[contains(.,'Pesquisar')]

    # Clique para selecionar a comissão
    Wait Until Element Is Visible    //input[contains(@id,'radListComissao')]
    Click Element    //input[contains(@id,'radListComissao')]
    Capture Page Screenshot


    # clique do botão 'Confirma'
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    3
    SeleniumLibrary.Close Browser