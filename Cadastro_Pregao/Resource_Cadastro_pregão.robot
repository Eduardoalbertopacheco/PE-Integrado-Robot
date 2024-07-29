*** Settings ***
Documentation    Fluxo feliz - Cadastro de Pregão Eletronico
Library          SeleniumLibrary
Library          Browser
Library          DateTime
Library          OperatingSystem
Resource         ../Cadastro_SC/Resource_Cadastro_SC.robot
     
*** Variables ***

${OBJETO}       Pregão Aberto - Item - 25/07
${TITULO_PARECER}    Título do Parecer

${DROPDOWN_TPO_PARECER}  xpath=//span[contains(@aria-owns,'nCdTipoParecerMap_listbox')]
${CAMPO_SELECAO_MARCA}    //span[contains(@aria-owns,'dtgPesquisaItens_ctl01_ddlMarca_listbox')]




&{SELECAO_PARECER}
...        CAMPO_TIPO_PARECER=//span[contains(@aria-owns,'nCdTipoParecerMap_listbox')]

&{VALOR_TIPO_PARECER}
...        JURIDICO=//span[contains(@aria-owns,'nCdTipoParecerMap_listbox')]//*[@value="2"]




${ITEM_LIST_PARECER}    //ul[@id='nCdTipoParecerMap_listbox']
${ITEM_TEXT_PARECER}      Jurídico
${ITEM_PARECER}        ${ITEM_LIST_PARECER}//li[text()="Jurídico"]




${ITEM_LIST}       //ul[@id='dtgPesquisaItens_ctl01_ddlMarca_listbox']
${ITEM_TEXT}      12V 3AH
${ITEM}        ${ITEM_LIST}//li[text()="12V 3AH"]


${CAMPO_DT_INICIAL_PROP}       //input[contains(@name,'tDtInicialProposta')]
${CAMPO_DT_FINAL_PROP}        id=_cP_PREGAO_x_tDtFinalProposta
${CAMPO_DT_INCIAL_DISPUTA}     //input[contains(@name,'tDtInicialDisputa')]

${FRAME_NEGOCIACAO}    //frame[@name='frmNegociacao']
${FRAME_MAIN}=    //frame[@name='main']
${FRAME_FRM_CONTEUDO}    //iframe[contains(@name,'frmConteudo')]
${FRAME_PARECER}    //iframe[@id="frameParecer"]
${FRAME_DETALHE_PREGAO}    //frame[@name='frmDetalhePregao']
${BTN_SALVAR}     css=#btnSalvarParecer
${TEXTAREA_NAME}    sDsParecer
${XPATH}    //textarea[contains(@name,'sDsParecer')]
${SELECT_XPATH}    //select[@id='nCdTipoParecerMap']


${URL}    https://www.homologpeintegrado.pe.gov.br/default.aspx
${BTN_LUPA_COMISSAO}    (//img[contains(@id,'img')])[2]
${UTILIZA_VERBA_FEDERAL_VALUE_NAO}    //table[2]/tbody[1]/tr[16]/td[2]/span[1]/input[2]

${MENU_NEGOCIACAO}    xpath=//div[@unselectable='on'][contains(.,'Negociação')]


&{SELECAO_MENU_NEGOCIACAO}    
...    SOLICITACAO_COMPRA=//td[@class='label'][contains(.,'Solicitação de compra')]
...    COTACAO=//td[@class='label'][contains(.,'Cotação')]
...    COMPRA_DIRETA=//td[@class='label'][contains(.,'Compra direta')]
...    LICITACAO=//td[@class='label'][contains(.,'Licitação')]


&{SUBMENU_SOLICITACAO_COMPRA}
...    LISTA_SOLICTACAO_COMPRA=//td[@class='label'][contains(.,'Lista de solicitações de compra')]


&{SUBMENU_COTACAO}
...    LISTA_COTACAO=//a[@title='Cota&#231;&#245;es'][contains(.,'Lista de cotações')]


&{SUBMENU_LICITACAO}
...    NOVA_LICITACAO=//td[@class='label'][contains(.,'Nova licitação eletrönica')]
...    LICITACOES_ELERONICAS=//td[@class='label'][contains(.,'Licitações eletrônicas')]


${CAMPO_BOJETO}    //input[contains(@name,'_cP_PREGAO_x_sDsObjeto')]


&{SELECAO}
...    MODALIDADE=//td[@id= "td_cP_PREGAO_x_nCdModalidade"]
...    CRITERIO=//td[@id= "td_cP_PREGAO_x_nCdCriterio"]
...    CODICAO_PAGAMENTO=//td[@id= "td_cP_PREGAO_x_nCdCondicaoPagamento"]
...    PRAZO_ENTREGA=//td[@id= "td_cP_PREGAO_x_nCdPrazoEntrega"]
...    MODO_DISPUTA=//td[@id="td_cP_PREGAO_x_nIdTipoDisputa"]
...    CAMPO_EXIBIR_INCLUIR_ITEM_SC=//select[contains(@name,'ctl00$ddlVisoes')]

&{VALOR_SELECAO}
...    MODAL_PREGAO=//li[contains(.,'Pregão Eletrônico')]
...    MODAL_CONCORRENCIA=//li[contains(.,'Concorrência Eletrônica')]
...    CRIT_PREGAO_LEI_14_133=//li[contains(.,'LICITAÇÃO NA MODALIDADE PREGÃO ELETRÔNICO - LEI FEDERAL 14.133/21 - DECRETO 54.142/22')]
...    CRIT_CONCORRENCIA_LEI_14_133_21=//li[contains(.,'LICITAÇÃO NA MODALIDADE CONCORRÊNCIA ELETRÔNICA - LEI FEDERAL 14.133/21 - DECRETO 54.142/22')]
...    COD_PAGAMENTO_AVISTA=//li[@tabindex='-1'][contains(.,'Á vista')]
...    PRAZO_ENTRG_10_DIAS=//li[@tabindex='-1'][contains(.,'10 DIAS')]
...    MODO_DISPUTA_ABERTO=(//li[@tabindex='-1'][contains(.,'Aberto')])[1]
...    MODO_DISPUTA_ABERTO_FECHADO=//li[@tabindex='-1'][contains(.,'Aberto-fechado')]
...    MODO_DISPUTA_FECHADO_ABERTO=//li[@tabindex='-1'][contains(.,'Fechado-aberto')]
...    EXIBIR_INCLUIR_ITEM_SC_POR_ITEM=//option[contains(@value,'7053')]
...    EXIBIR_INCLUIR_ITEM_SC_POR_LOTE=//option[contains(@value,'7054')]


*** Keywords ***
E acesso a tela de Licitações Eletrônicas
    Select Frame    ${FRAME_MAIN}
    
    Wait Until Element Is Visible    ${MENU_NEGOCIACAO}    timeout=30s
    Click Element    ${MENU_NEGOCIACAO}

    # mouse over em Licitações
    ${elemento}    Get WebElement    
    ...    ${SELECAO_MENU_NEGOCIACAO.LICITACAO}
    Mouse Over    ${elemento}

    # Clique em Nova Licitações eletronicas
    Wait Until Element Is Visible    ${SUBMENU_LICITACAO.LICITACOES_ELERONICAS}    timeout=30s
    Click Element    ${SUBMENU_LICITACAO.LICITACOES_ELERONICAS}
    Capture Page Screenshot

    ${all_windows}=    Get Window Handles


E clico em Incluir Processo
    
    Select Frame    //iframe[contains(@name,'frmConteudo')]
    Wait Until Element Is Visible    //a[contains(.,'Incluir processo')]    timeout=30s
    Click Element    //a[contains(.,'Incluir processo')]


Então preencho a Aba de Dados Gerais
    
    # Seleção do campo 'Confição de pagamento'
    Click Element    ${SELECAO.CODICAO_PAGAMENTO}
    Wait Until Element Is Visible    ${VALOR_SELECAO.COD_PAGAMENTO_AVISTA}    timeout=30s
    Capture Page Screenshot
    Click Element    ${VALOR_SELECAO.COD_PAGAMENTO_AVISTA}


    # Seleção do campo 'Prazo de entrega'
    Click Element    ${SELECAO.PRAZO_ENTREGA}
    Wait Until Element Is Visible    ${VALOR_SELECAO.PRAZO_ENTRG_10_DIAS}    timeout=30s
    Capture Page Screenshot
    Click Element    ${VALOR_SELECAO.PRAZO_ENTRG_10_DIAS}

    Sleep    2
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

    Wait Until Element Is Visible    ${UTILIZA_VERBA_FEDERAL_VALUE_NAO}    timeout=30s
    Click Element    ${UTILIZA_VERBA_FEDERAL_VALUE_NAO}
    Capture Page Screenshot

    Wait Until Element Is Visible    ${CAMPO_BOJETO}    timeout=30s
    Input Text    ${CAMPO_BOJETO}    ${OBJETO}
    Capture Page Screenshot

    
    ${all_windows}=    Get Window Handles
    ${second_window}=    Set Variable    ${all_windows}[1]
    Switch Window    ${second_window}

    
    # Clique no botão 'Salvar'
    Wait Until Element Is Visible    //input[@name='btnSalvar']
    Click Element    //input[@name='btnSalvar']
    Sleep    2
    Handle Alert    ACCEPT
    Sleep    2
    Capture Page Screenshot


E mostro a auditoria
 
    ${all_windows}=    Get Window Handles
    ${second_window}=    Set Variable    ${all_windows}[1]
    Switch Window    ${second_window}

    Wait Until Element Is Visible    //a[contains(.,'Auditoria')]    timeout=30s
    Click Element    //a[contains(.,'Auditoria')]
    Capture Page Screenshot
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Capture Page Screenshot
    SeleniumLibrary.Close Browser

E vejo a Auditoria

    ${all_windows}=    Get Window Handles
    ${window}=    Set Variable    ${all_windows}[0]
    
    
    Wait Until Element Is Visible    //a[contains(.,'Voltar à pesquisa')]    timeout=30s
    Click Element    //a[contains(.,'Voltar à pesquisa')]
    Sleep    3

    Switch Window    ${window}
    Select Frame    //frame[@name='main']
    Sleep    3
    

    Wait Until Element Is Visible    //td[@id="ctl00_pesquisaDataGrid_dtgPesquisa_gridTd"]//tr[td[4][contains(text(), '${OBJETO}')]]//td[9]//img[@id="imgAuditoria"]    timeout=30s
    Click Element    //td[@id="ctl00_pesquisaDataGrid_dtgPesquisa_gridTd"]//tr[td[4][contains(text(), '${OBJETO}')]]//td[9]//img[@id="imgAuditoria"]
    Capture Page Screenshot
    SeleniumLibrary.Close Browser


E seleciono a modalidade para Pregão Eletrônico

    #Seleção do campo 'Modalidade'
    Switch Window    NEW
    Maximize Browser Window
    Wait Until Element Is Visible    ${SELECAO.MODALIDADE}    timeout=30s
    Click Element    ${SELECAO.MODALIDADE}
    Wait Until Element Is Visible    ${VALOR_SELECAO.MODAL_PREGAO}    timeout=30s
    Capture Page Screenshot
    Click Element    ${VALOR_SELECAO.MODAL_PREGAO}

E seleciono a modalidade para Concorrência Eletrônica

    #Seleção do campo 'Modalidade'
    Switch Window    NEW
    Maximize Browser Window
    Wait Until Element Is Visible    ${SELECAO.MODALIDADE}    timeout=30s
    Click Element    ${SELECAO.MODALIDADE}
    Wait Until Element Is Visible    ${VALOR_SELECAO.MODAL_PREGAO}    timeout=30s
    Capture Page Screenshot
    Click Element    ${VALOR_SELECAO.MODAL_CONCORRENCIA}



E Seleciono o Critério de Pregão Eletrônico

    # Seleção do campo 'Critério'
    Wait Until Element Is Visible    ${SELECAO.CRITERIO}    timeout=30s
    Click Element    ${SELECAO.CRITERIO}
    Capture Page Screenshot
    Click Element    ${VALOR_SELECAO.CRIT_PREGAO_LEI_14_133}

E Seleciono o Critério de Concorrência Eletrônica

    # Seleção do campo 'Critério'
    Wait Until Element Is Visible    ${SELECAO.CRITERIO}    timeout=30s
    Click Element    ${SELECAO.CRITERIO}
    Wait Until Element Is Visible    ${VALOR_SELECAO.CRIT_CONCORRENCIA_LEI_14_133_21}    timeout=30s
    Click Element    ${VALOR_SELECAO.CRIT_CONCORRENCIA_LEI_14_133_21}
    Capture Page Screenshot


E seleciono o modo de Disputa Aberto

    ${all_windows}=    Get Window Handles
    ${second_window}=    Set Variable    ${all_windows}[1]
    Switch Window    ${second_window}

    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

    Wait Until Element Is Visible    ${SELECAO.MODO_DISPUTA}    timeout=30s
    Click Element    ${SELECAO.MODO_DISPUTA}
    Capture Page Screenshot
    Click Element    ${VALOR_SELECAO.MODO_DISPUTA_ABERTO}


E Seleciono o Modo de Disputa Aberto-Fechado

    ${all_windows}=    Get Window Handles
    ${second_window}=    Set Variable    ${all_windows}[1]
    Switch Window    ${second_window}

    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

    Wait Until Element Is Visible    ${SELECAO.MODO_DISPUTA}    timeout=30s
    Click Element    ${SELECAO.MODO_DISPUTA}
    Capture Page Screenshot
    Click Element    ${VALOR_SELECAO.MODO_DISPUTA_ABERTO_FECHADO}


E Seleciono o Modo de Disputa Fechado-Aberto

    ${all_windows}=    Get Window Handles
    ${second_window}=    Set Variable    ${all_windows}[1]
    Switch Window    ${second_window}

    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

    Wait Until Element Is Visible    ${SELECAO.MODO_DISPUTA}    timeout=30s
    Click Element    ${SELECAO.MODO_DISPUTA}
    Capture Page Screenshot
    Click Element    ${VALOR_SELECAO.MODO_DISPUTA_FECHADO_ABERTO}



    # Input do campo Prazo de habilitação
    Input Text    //input[contains(@class,'k-formatted-value k-input')]    3
    Capture Page Screenshot


E insiro as datas para agendamento

    # Data e hora de inicio das propostas
    Execute JavaScript    window.scrollTo(0, 0)

   ${hora_atual+10min}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(minutes=10)).strftime('%d-%m-%Y %H:%M:%S')    datetime
    Log    ${hora_atual+10min}

    # Data e hora do fim das proposta
    ${hora_atual+20min}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(minutes=20)).strftime('%d-%m-%Y %H:%M:%S')    datetime
    Log    ${hora_atual+20min}
    
    # Data e hora para inicio das disputas
    ${hora_atual+25min}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(minutes=25)).strftime('%d-%m-%Y %H:%M:%S')    datetime
    Log    ${hora_atual+25min}

    # Data Inicial propostas
    Wait Until Element Is Visible    ${CAMPO_DT_INICIAL_PROP}    timeout=30s
    Clear Element Text    ${CAMPO_DT_INICIAL_PROP}
    Input Text    ${CAMPO_DT_INICIAL_PROP}    ${hora_atual+10min}

    # Data final proposta
    Sleep    1
    Wait Until Element Is Visible    ${CAMPO_DT_FINAL_PROP}    timeout=30s
    Clear Element Text    ${CAMPO_DT_FINAL_PROP}
    Input Text    ${CAMPO_DT_FINAL_PROP}    ${hora_atual+20min}
    Clear Element Text    ${CAMPO_DT_FINAL_PROP}
    Input Text    ${CAMPO_DT_FINAL_PROP}    ${hora_atual+20min}

    # Data Inicio disputa
    Sleep    1
    Wait Until Element Is Visible    ${CAMPO_DT_INCIAL_DISPUTA}    timeout=30s
    Clear Element Text    ${CAMPO_DT_INCIAL_DISPUTA}
    Input Text    ${CAMPO_DT_INCIAL_DISPUTA}    ${hora_atual+25min}
    Capture Page Screenshot


E insiro a Comissão e Salvo

    Wait Until Element Is Visible    ${BTN_LUPA_COMISSAO}    timeout=30s
    Click Element    ${BTN_LUPA_COMISSAO}


    # Busca pela comissão no campo 'Descrição'
    Switch Window    new

    Sleep    1
    Wait Until Element Is Visible    //input[@field='normal'][contains(@id,'sDsProduto')]    timeout=30s
    Input Text    //input[@field='normal'][contains(@id,'sDsProduto')]
    ...    COMISSÃO PERMANENTE DE LICITAÇÃO - 120101

    # Clique no botão pesquisar
    Click Element    //input[contains(@value,'Pesquisar')]

    # Clique para selecionar a comissão
    Wait Until Element Is Visible    //input[contains(@value,'169')]    timeout=30s
    Sleep    1
    Click Element    //input[contains(@value,'169')]
    Capture Page Screenshot


    # clique do botão 'Confirma' da tela de inserir comissão
    Click Element    //input[contains(@value,'Confirmar')]


Então incluo a SC ao Pregão

    Switch Window    NEW

    # Clique na aba 'Itens'
    Wait Until Element Is Visible    //a[contains(.,'Itens')]    timeout=30s
    Click Element    //a[contains(.,'Itens')]


    # Clique na aba Itens
    Wait Until Element Is Visible     //a[contains(.,'Incluir')]    timeout=30s
    Click Element    //a[contains(.,'Incluir')]
    Sleep    2

    # Cliue no botão Incluir itens da Solicitacçao
    Wait Until Element Is Visible    //a[contains(.,'Incluir item(ns) da solicitação')]    timeout=30s
    Click Element    //a[contains(.,'Incluir item(ns) da solicitação')]

    Log    ${resumo_sc}

    Switch Window    NEW

    Wait Until Element Is Visible    ${SELECAO.CAMPO_EXIBIR_INCLUIR_ITEM_SC}    timeout=30s
    Click Element    ${SELECAO.CAMPO_EXIBIR_INCLUIR_ITEM_SC}
    Capture Page Screenshot
    Sleep    2

    # Clique no campo exibir
    Wait Until Element Is Visible    ${VALOR_SELECAO.EXIBIR_INCLUIR_ITEM_SC_POR_ITEM}    timeout=30s
    Click Element    ${VALOR_SELECAO.EXIBIR_INCLUIR_ITEM_SC_POR_ITEM}


    # Selecionar a SC para Incluir
    ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${resumo_sc}']]//td[9]//input
    WHILE    ${element_found} == False
        Execute JavaScript    window.location.reload()
        Sleep    5 sec
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${resumo_sc}']]//td[5]//input
    END
    Click Element    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${resumo_sc}']]//td[5]//input
    Capture Page Screenshot


    # # Selecionar a SC para Incluir
    # Wait Until Element Is Visible    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${resumo_sc}']]//td[5]//input    timeout=30s
    # Click Element    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${resumo_sc}']]//td[5]//input
    # Capture Page Screenshot

    # Clique no botão de Incluir SC
    Click Element    //a[contains(.,'Incluir')]
    Sleep    2
    

E incluo um documento do tipo Edital
    Switch Window    NEW

    # Clique na aba documentos
    Wait Until Element Is Visible    //a[contains(.,'Documentos do processo')]    timeout=30s
    Click Element    //a[contains(.,'Documentos do processo')]


    # Clique do botão 'Escolher Arquivo'
    Wait Until Element Is Visible    //input[contains(@type,'file')]    timeout=30s
    Choose File    css=input[type="file"]    C:\\Users\\Basis\\Downloads\\shareFile.pdf

    # Switch Window

    Sleep    1
    # Clique e escrevo no campo 'Tipo do documento'
    Wait Until Element Is Visible    
    ...    css=input[id="ctl00_conteudoPagina_objListagemDeDocumentos_autoTipoDeDocumento"]    timeout=30s
    Input Text    
    ...    css=input[id="ctl00_conteudoPagina_objListagemDeDocumentos_autoTipoDeDocumento"]
    ...    Edital - PE
    Sleep    2
    Wait Until Element Is Visible    //li[text()="Edital - PE"]    timeout=30s
    Click Element    //li[text()="Edital - PE"]


    # Clique no botão 'Anexar' o arquivo
    Capture Page Screenshot
    Click Element    //input[@value='Anexar']
    Handle Alert    ACCEPT


E seleciono assino o documento do tipo Edital
    Switch Window    NEW

    # Clique na aba documentos
    Wait Until Element Is Visible    //a[contains(.,'Documentos do processo')]    timeout=30s
    Click Element    //a[contains(.,'Documentos do processo')]

    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

    # Selecionar o doc do tipo Edital
    Wait Until Element Is Visible
    ...    //table[@id= "ctl00_conteudoPagina_objListagemDeDocumentos_dtgPesquisaNovo"]//tr[td/a[text()='Edital - PE']]//td[10]//input    timeout=30s
    Select Checkbox
    ...    //table[@id= "ctl00_conteudoPagina_objListagemDeDocumentos_dtgPesquisaNovo"]//tr[td/a[text()='Edital - PE']]//td[10]//input

    # Clicar no botão 'Assinar Documento'
    Wait Until Element Is Visible    xpath=//a[contains(.,'Assinar documento')]    timeout=30s
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
    Sleep    3


E solicito o parecer para o Ordenador

    Switch Window    NEW
    # Clique no botão 'Parecer'
    Wait Until Element Is Visible    //input[contains(@name,'btnParecer')]    timeout=30s
    Click Element    //input[contains(@name,'btnParecer')]
    Sleep    2
    
    ${all_windows}=    Get Window Handles
    
    ${janela_atual}=    Set Variable    ${all_windows}[0]
    Switch Window    ${janela_atual}


    Sleep    5
    Select Frame    ${FRAME_MAIN}
    Select Frame    ${FRAME_FRM_CONTEUDO}
    Select Frame    ${FRAME_PARECER}
    

    Wait Until Element Is Visible    //li[contains(@onclick,'OpenWindowUsuarioLookup()')]    timeout=30s
    Click Element    //li[contains(@onclick,'OpenWindowUsuarioLookup()')]
    

    Sleep    2
    Wait Until Element Is Visible    //input[@id='tbxPesquisar']    timeout=30s
    Input Text    //input[@id='tbxPesquisar']    Ordenador
    Sleep    1

    Click Element    //span[contains(@onclick,'Pesquisar();')]

    Wait Until Element Is Visible    //td[contains(.,'Ordenador da UG 120101 (SECRETARIA DE ADMINISTRAÇÃO)')]    timeout=30s
    Click Element    //td[contains(.,'Ordenador da UG 120101 (SECRETARIA DE ADMINISTRAÇÃO)')]
    Sleep    1

    Wait Until Element Is Visible    //button[@type='button'][contains(.,'OK')]    timeout=30s
    Click Element    //button[@type='button'][contains(.,'OK')]


    # # Clique na seleção tipo do Parecer
    Wait Until Element Is Visible  ${DROPDOWN_TPO_PARECER}    timeout=30s
    Click Element  ${DROPDOWN_TPO_PARECER}


    # Execute JavaScript    window.scrollTo(0, document.body.scrollHeight / 2)



    # # Use JavaScript para clicar no dropdown e expandir a lista
    # Execute JavaScript    document.querySelector("span.k-widget.k-dropdown.k-header").click()
    # # Aguarde um pouco para garantir que a lista seja carregada
    # Sleep    2s
    # # Use JavaScript para garantir que o item "Jurídico" seja clicado
    # Execute JavaScript    var list = document.querySelector("ul[id$='nCdTipoParecerMap_listbox']"); if (list) { var items = list.querySelectorAll("li"); for (var i = 0; i < items.length; i++) { if (items[i].textContent.trim() === 'Jurídico') { items[i].scrollIntoView(); items[i].click(); break; } } }
    # # Verifique se o item foi realmente selecionado
    # Sleep    1s
    # # Verifique o texto selecionado (opcional)
    # ${selected_text}=    SeleniumLibrary.Get Text    //span[@class='k-input']
    # Should Be Equal As Strings    ${selected_text}    Jurídico

   



    # Implementar aqui o tipo do paracer para Jurídico



    Sleep    10


    Wait Until Element Is Visible    //input[@name='sDsTitulo']    timeout=30s
    Input Text    //input[@name='sDsTitulo']    ${TITULO_PARECER}


    Wait Until Element Is Visible    ${XPATH}    timeout=30s
    Input Text    ${XPATH}    Descrição parecer


    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Sleep    2

    Capture Page Screenshot
    Wait Until Element Is Visible    ${BTN_SALVAR}    timeout=30s
    Sleep    2
    Click Element    ${BTN_SALVAR}
    Capture Page Screenshot


Então encaminho o Parecer para o ordenador
    Wait Until Element Is Visible    //span[@name='btnEncaminharParecer']    timeout=30s
    Click Element    //span[@name='btnEncaminharParecer']


    Wait Until Element Is Visible    //button[contains(.,'Sim')]    timeout=30s
    Click Element    //button[contains(.,'Sim')]
    Sleep    1
    Capture Page Screenshot
    SeleniumLibrary.Close Browser

E acesso a tela com filtro todas as Licitações
    Select Frame    ${FRAME_FRM_CONTEUDO}

    # Clicar no campo Exibir
   Wait Until Element Is Visible    xpath=//select[@id= "ctl00_ddlVisoes"]    timeout=30s
   Click Element    xpath=//select[@id= "ctl00_ddlVisoes"]

   # Clicar na seleção 'Tdas as Lictações'
   Click Element    xpath=//select[@id= "ctl00_ddlVisoes"]//*[@value='18000']

   # Clique no botão Pesquisar
   Wait Until Element Is Visible    xpath=//input[@value= "Pesquisar"]    timeout=30s
   Click Element    xpath=//input[@value= "Pesquisar"]
   Capture Page Screenshot

E clico na licitação da lista

    # Clique na SC selecionada
    Wait Until Element Is Visible    //td[@id="ctl00_pesquisaDataGrid_dtgPesquisa_gridTd"]//tr[td[4][contains(text(), '${OBJETO}')]]//td[2]    timeout=30s
    Click Element    //td[@id="ctl00_pesquisaDataGrid_dtgPesquisa_gridTd"]//tr[td[4][contains(text(), '${OBJETO}')]]//td[2]
    Sleep    4

E Clique no botão Parecer

    ${all_windows}=    Get Window Handles
    
    ${segunda_janela}=    Set Variable    ${all_windows}[1]
    Switch Window    ${segunda_janela}
    

    Wait Until Element Is Visible    //input[contains(@name,'btnParecer')]    timeout=30s
    Click Element    //input[contains(@name,'btnParecer')]
    Sleep    2
    
    ${all_windows}=    Get Window Handles
    
    ${janela_atual}=    Set Variable    ${all_windows}[0]
    Switch Window    ${janela_atual}

    Sleep    2
    Select Frame    ${FRAME_MAIN}
    Select Frame    ${FRAME_FRM_CONTEUDO}
    Select Frame    ${FRAME_PARECER}


E seleciono o parecer

    ${all_windows}=    Get Window Handles

    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

    Wait Until Element Is Visible    //fieldset[2]//div[2]//div[2]//table//tr[td[2][contains(text(), '${TITULO_PARECER}')]]//td[1]//a[@class="wi-clickable"]    timeout=30s
    Capture Page Screenshot

    # Isso garante que o elemento esteja visível na janela de visualização do navegador.
    Scroll Element Into View  xpath=//fieldset[2]//div[2]//div[2]//table//tr[td[2][contains(text(), 'Título do Parecer')]]//td[1]//a[@class="wi-clickable"]

    # Clique no parecer selecionado
    Click Element    //fieldset[2]//div[2]//div[2]//table//tr[td[2][contains(text(), '${TITULO_PARECER}')]]//td[1]//a[@class="wi-clickable"]
    Sleep    4

    Capture Page Screenshot


Então finalizo o parecer

    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Wait Until Element Is Visible    //textarea[@name='sDsResposta']    timeout=30s
    Input Text    //textarea[@name='sDsResposta']    Finalizar parecer
    Capture Page Screenshot

    Wait Until Element Is Visible    //fieldset[2]/div[3]/div[1]/button[1]    timeout=30s
    Scroll Element Into View    //fieldset[2]/div[3]/div[1]/button[1]
    Click Element    //fieldset[2]/div[3]/div[1]/button[1]
    Capture Page Screenshot


    # clique do botão Finalizar aprecer
    Wait Until Element Is Visible    //button[@type='button'][contains(.,'Finalizar parecer')]    timeout=30s
    Click Element    //button[@type='button'][contains(.,'Finalizar parecer')]

    
    Wait Until Element Is Visible    //textarea[contains(@name,'sDsJustificativa')]
    Input Text    //textarea[contains(@name,'sDsJustificativa')]    justificativa
    Capture Page Screenshot

    Wait Until Element Is Visible    //button[@type='button'][contains(.,'Sim')]    timeout=30s
    Click Element    //button[@type='button'][contains(.,'Sim')]
    Sleep    1
    Capture Page Screenshot
    SeleniumLibrary.Close Browser



  



E clico no botão solicitar autorização
    ${all_windows}=    Get Window Handles
    
    ${segunda_janela}=    Set Variable    ${all_windows}[1]
    Switch Window    ${segunda_janela}
    

    Wait Until Element Is Visible    //input[@name='btnSolicitarAutorizacao']    timeout=30s
    Capture Page Screenshot
    Click Element    //input[@name='btnSolicitarAutorizacao']
    Sleep    2

Então solicito autorização central
    Wait Until Element Is Visible    //a[contains(.,'Sim')]    timeout=30s
    Capture Page Screenshot
    Click Element    //a[contains(.,'Sim')]
    Sleep    6
    Handle Alert    ACCEPT
    # SeleniumLibrary.Close Browser


E clico em Deliberar
    ${all_windows}=    Get Window Handles
    
    ${segunda_janela}=    Set Variable    ${all_windows}[1]
    Switch Window    ${segunda_janela}
    
    # Clique no botão deliberar
    Wait Until Element Is Visible    //input[@name='btnDeliberar']    timeout=30s
    Capture Page Screenshot
    Click Element    //input[@name='btnDeliberar']
    Sleep    2


Então aprovo a autorização

    # Clique no botão radio autorizar
    Wait Until Element Is Visible    //form[1]/div[4]/div[4]/table[1]/tbody[1]/tr[2]/td[2]/span[1]/input[1]    timeout=30s
    Click Element    //form[1]/div[4]/div[4]/table[1]/tbody[1]/tr[2]/td[2]/span[1]/input[1]
    Capture Page Screenshot

    # escrever no campo justificativa
    Wait Until Element Is Visible    //textarea[contains(@name,'txtJustificativa')]    timeout=30s
    Input Text    //textarea[contains(@name,'txtJustificativa')]    Ok
    Capture Page Screenshot

    # Clique do botao confirmar
    Wait Until Element Is Visible    //a[contains(@onclick,'Confirmar();')]    timeout=30s
    Click Element    //a[contains(@onclick,'Confirmar();')]
    Sleep    4
    # SeleniumLibrary.Close Browser
    Handle Alert    ACCEPT


E seleciono a licitação para agendamento
    Select Frame    ${FRAME_FRM_CONTEUDO}

    # Clicar no campo Exibir
   Wait Until Element Is Visible    xpath=//select[@id= "ctl00_ddlVisoes"]    timeout=30s
   Click Element    xpath=//select[@id= "ctl00_ddlVisoes"]

   # Clicar na seleção 'Tdas as Lictações'
   Click Element    xpath=//select[@id= "ctl00_ddlVisoes"]//*[@value='18000']

   # Clique no botão Pesquisar
   Wait Until Element Is Visible    xpath=//input[@value= "Pesquisar"]    timeout=30s
   Click Element    xpath=//input[@value= "Pesquisar"]
   Capture Page Screenshot

    # Clique na SC selecionada
    Wait Until Element Is Visible    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td[contains(text(), '${OBJETO}')]]//td[10]//input    timeout=30s
    Click Element    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td[contains(text(), '${OBJETO}')]]//td[10]//input
    Sleep    4

    # Clique no botão agendar
    Wait Until Element Is Visible    //a[contains(.,'Agendar')]    timeout=30s
    Click Element    //a[contains(.,'Agendar')]

Então faço o reagendamento

    ${hora_atual+3min}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(minutes=3)).strftime('%d-%m-%Y %H:%M:%S')    datetime
    Log    ${hora_atual+3min}

    ${hora_atual+300min}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(minutes=300)).strftime('%d-%m-%Y %H:%M:%S')    datetime
    Log    ${hora_atual+300min}

    ${hora_atual+301min}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(minutes=301)).strftime('%d-%m-%Y %H:%M:%S')    datetime
    Log    ${hora_atual+301min}


    # Clique para marcar para reagendar
    Switch Window    NEW
    Wait Until Element Is Visible    //input[contains(@name,'ckbAgendar')]    timeout=30s
    Click Element    //input[contains(@name,'ckbAgendar')]

    # Clique no botão SIM
    Click Element    //input[contains(@value,'Sim')]

    ${all_windows}=    Get Window Handles
    ${janela}=    Set Variable    ${all_windows}[1]

    Switch Window    ${janela}

    # Data inicial de propostas
    Wait Until Element Is Visible    //input[contains(@name,'tbxDataInicialProposta')]    timeout=30s
    Clear Element Text    //input[contains(@name,'tbxDataInicialProposta')]
    Input Text    //input[contains(@name,'tbxDataInicialProposta')]    ${hora_atual+3min}

    # Data Fianl de propostas
    Wait Until Element Is Visible    //input[contains(@name,'tbxDataEncerramento')]    timeout=30s
    Clear Element Text    //input[contains(@name,'tbxDataEncerramento')]
    Input Text    //input[contains(@name,'tbxDataEncerramento')]    ${hora_atual+300min}

    # Data inicial para Disputa de lances
    Wait Until Element Is Visible    //input[contains(@name,'tbxDataInicialDisputa')]    timeout=30s
    Clear Element Text    //input[contains(@name,'tbxDataInicialDisputa')]
    Input Text    //input[contains(@name,'tbxDataInicialDisputa')]    ${hora_atual+301min}
    Capture Page Screenshot

    # Clique do botão Agendar
    Wait Until Element Is Visible    //input[contains(@name,'btnAgendar')]    timeout=30s
    Click Element    //input[contains(@name,'btnAgendar')]
    Sleep    2
    # SeleniumLibrary.Close Browser
    Handle Alert    action=accept


E seleciono todos os pregões
    Select Frame    ${FRAME_FRM_CONTEUDO}

    # Clicar no campo Exibir
   Wait Until Element Is Visible    xpath=//select[@id= "ctl00_ddlVisoes"]    timeout=30s
   Click Element    xpath=//select[@id= "ctl00_ddlVisoes"]

   # Clicar na seleção 'Tdas as pregões'
   Click Element    xpath=//select[@id= "ctl00_ddlVisoes"]//*[@value='18039']

   # Clique no botão Pesquisar
   Wait Until Element Is Visible    xpath=//input[@value= "Pesquisar"]    timeout=30s
   Click Element    xpath=//input[@value= "Pesquisar"]
   Capture Page Screenshot

   
E seleciono não para lei 123 e confirmo
    ${all_windows}=    Get Window Handles

    # check box não para lei 123
    Wait Until Element Is Visible    //input[@value='0'][contains(@id,'1')]    timeout=30s
    Click Element    //input[@value='0'][contains(@id,'1')]

    ${all_windows}=    Get Window Handles

    # clique no botão confirmar
    Wait Until Element Is Visible    //input[contains(@value,'Confirmar')]    timeout=30s
    Click Element    //input[contains(@value,'Confirmar')]
    ${all_windows}=    Get Window Handles

E preencho os dados do lance
    Select Frame    ${FRAME_NEGOCIACAO}

    Log    Executando clique no dropdown
    Wait Until Element Is Visible    ${CAMPO_SELECAO_MARCA}    timeout=30s
    Click Element    ${CAMPO_SELECAO_MARCA}
    Log    Dropdown expandido, aguardando item

    Log    Aguardando a visibilidade do item na lista
    Wait Until Element Is Visible    ${ITEM}    timeout=30s

    Log    Item visível, clicando no item
    Capture Page Screenshot
    
    Click Element    ${ITEM}
    Sleep    2s
    Log    Verificando valor do dropdown
    ${dropdown_value}=    Execute JavaScript    return document.querySelector("span.k-input").innerText
    Log    Valor do dropdown: ${dropdown_value}
    Should Be Equal As Strings    ${dropdown_value}    ${ITEM_TEXT}


    # Valor do lance
    Wait Until Element Is Visible    //form[1]/table[1]/tbody[1]/tr[3]/td[1]/table[1]/tbody[1]/tr[2]/td[2]/div[1]/span[3]/span[1]/input[1]    timeout=30s
    Input Text    //form[1]/table[1]/tbody[1]/tr[3]/td[1]/table[1]/tbody[1]/tr[2]/td[2]/div[1]/span[3]/span[1]/input[1]    100
    Capture Page Screenshot


Então envio a proposta  
    Wait Until Element Is Visible    //a[contains(.,'Enviar proposta(s)')]    timeout=30s
    Click Element    //a[contains(.,'Enviar proposta(s)')]
    Sleep    3
    Capture Page Screenshot
    Sleep    2

E acesso todos as licitações da lista
    Select Frame    ${FRAME_FRM_CONTEUDO}

    # Clicar no campo Exibir
   Wait Until Element Is Visible    xpath=//select[@id= "ctl00_ddlVisoes"]    timeout=30s
   Click Element    xpath=//select[@id= "ctl00_ddlVisoes"]

   # Clicar na seleção 'Tdas as Lictações'
   Click Element    xpath=//select[@id= "ctl00_ddlVisoes"]//*[@value='18000']

   # Clique no botão Pesquisar
   Wait Until Element Is Visible    xpath=//input[@value= "Pesquisar"]    timeout=30s
   Click Element    xpath=//input[@value= "Pesquisar"]
   Capture Page Screenshot


E seleciono a licitação da lista

    ${all_windows}=    Get Window Handles
    # Clique na SC selecionada
    Wait Until Element Is Visible    //td[@id="ctl00_pesquisaDataGrid_dtgPesquisa_gridTd"]//tr[td[4][contains(text(), '${OBJETO}')]]//td[2]    timeout=30s
    Click Element    //td[@id="ctl00_pesquisaDataGrid_dtgPesquisa_gridTd"]//tr[td[4][contains(text(), '${OBJETO}')]]//td[2]
    Sleep    4
    Capture Page Screenshot

Então abro as proposta

    Wait Until Element Is Visible    ${FRAME_NEGOCIACAO}    timeout=30s
    Select Frame    ${FRAME_NEGOCIACAO}

    Wait Until Element Is Visible    //a[contains(.,'Abrir proposta(s)')]    timeout=120s
    Capture Page Screenshot
    Click Element    //a[contains(.,'Abrir proposta(s)')]
    Sleep    2
    Handle Alert    ACCEPT
    Sleep    3


Então inicio a disputa
    Wait Until Element Is Visible    ${FRAME_NEGOCIACAO}    timeout=30s
    Select Frame    ${FRAME_NEGOCIACAO}


    Wait Until Element Is Visible    //a[contains(.,'Iniciar disputa')]    timeout=30s
    Capture Page Screenshot
    Click Element    //a[contains(.,'Iniciar disputa')]
    Sleep    2
    Handle Alert    ACCEPT
    Sleep    3
    Capture Page Screenshot



Então abros os itens

    Wait Until Element Is Visible    ${FRAME_NEGOCIACAO}    timeout=30s
    Select Frame    ${FRAME_NEGOCIACAO}
    Capture Page Screenshot


    # Click no chekbox para marca o item
    Wait Until Element Is Visible    //table[1]/tbody[1]/tr[2]/td[12]/input[1]    timeout=30s
    Click Element    //table[1]/tbody[1]/tr[2]/td[12]/input[1]


    # clique do botão abrir itens
    Wait Until Element Is Visible    //a[contains(.,'Abrir item')]    timeout=30s
    Click Element    //a[contains(.,'Abrir item')]


    Switch Window    NEW
    Wait Until Element Is Visible    //textarea[contains(@name,'tbxJustificativa')]    timeout=30s
    Input Text    //textarea[contains(@name,'tbxJustificativa')]    Justificativa
    Capture Page Screenshot

    Click Element    //input[@value='Sim']
    Sleep    2
 

Então envio o lance
    Wait Until Element Is Visible    ${FRAME_NEGOCIACAO}    timeout=30s
    Select Frame    ${FRAME_NEGOCIACAO}
    Capture Page Screenshot

    Wait Until Element Is Visible    //input[@class='k-formatted-value k-input']    timeout=30s
    Input Text    //input[@class='k-formatted-value k-input']    90


    # Clicque do botão enviar lances
    Wait Until Element Is Visible    //a[contains(.,'Enviar lances')]
    Click Element    //a[contains(.,'Enviar lances')]
    Sleep    2
    Handle Alert    ACCEPT
    Sleep    2
    Capture Page Screenshot


E clico em prorrogar pregão
    Select Frame    ${FRAME_DETALHE_PREGAO}

    Wait Until Element Is Visible    //a[contains(.,'Prorrogar')]    timeout=30s
    Click Element    //a[contains(.,'Prorrogar')]
    Capture Page Screenshot


E insiro as novas datas
    ${all_windows}=    Get Window Handles
    ${janela}=    Set Variable    ${all_windows}[1]

    ${hora_atual+2min}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(minutes=2)).strftime('%d-%m-%Y %H:%M:%S')    datetime
    Log    ${hora_atual+2min}

    ${hora_atual+3min}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(minutes=3)).strftime('%d-%m-%Y %H:%M:%S')    datetime
    Log    ${hora_atual+3min}

    Switch Window    ${janela}

    Sleep    2

    # Campo justificativa
    Wait Until Element Is Visible    //textarea[contains(@name,'tbxJustificativa')]    timeout=30s
    Input Text    //textarea[contains(@name,'tbxJustificativa')]    Justificativa
    Sleep    2

    
    # Data final proposta
    Wait Until Element Is Visible    id=ctl00_conteudoPagina_tbxDataFinalProposta    timeout=30s
    Input Text    id=ctl00_conteudoPagina_tbxDataFinalProposta    ${hora_atual+2min}
    Sleep    2
    Set Focus To Element    id=ctl00_conteudoPagina_tbxDataFinalProposta
    Execute JavaScript    document.getElementById("ctl00_conteudoPagina_tbxDataFinalProposta").value="${hora_atual+2min}";
    Sleep    2
    Capture Page Screenshot


    # Data Inicial Disputa
    Wait Until Element Is Visible    id=ctl00_conteudoPagina_tbxDataInicioDisputa    timeout=30s
    Input Text    id=ctl00_conteudoPagina_tbxDataInicioDisputa    ${hora_atual+3min}
    Sleep    2
    Set Focus To Element    id=ctl00_conteudoPagina_tbxDataInicioDisputa
    Execute JavaScript    document.getElementById("ctl00_conteudoPagina_tbxDataInicioDisputa").value="${hora_atual+3min}";
    Sleep    2
    Capture Page Screenshot


Então faço o prorrogamento
    Wait Until Element Is Visible    //input[contains(@value,'Sim')]    timeout=30s
    Click Element    //input[contains(@value,'Sim')]

    Wait Until Element Is Visible    //a[contains(.,'Sim')]    timeout=30s
    Click Element    //a[contains(.,'Sim')]
    Sleep    3

    # Handle Alert    action=accept
    # Sleep    2
    
E Acesso a Auditoria
    Select Frame    ${FRAME_DETALHE_PREGAO}

    Wait Until Element Is Visible    //a[contains(.,'Auditoria')]    timeout=30s
    Capture Page Screenshot
    SeleniumLibrary.Close Browser


Então envio o segundo lances
    Wait Until Element Is Visible    ${FRAME_NEGOCIACAO}    timeout=30s
    Select Frame    ${FRAME_NEGOCIACAO}
    Capture Page Screenshot

    Wait Until Element Is Visible    //input[@class='k-formatted-value k-input']    timeout=30s
    Input Text    //input[@class='k-formatted-value k-input']    89

    # ${current_value}=    Get Value    //input[@class='k-formatted-value k-input']
    # ${new_value}=    Evaluate    ${current_value} - 10
    # Input Text    //input[@class='k-formatted-value k-input']    ${new_value}


    # Clicque do botão enviar lances
    Wait Until Element Is Visible    //a[contains(.,'Enviar lances')]
    Click Element    //a[contains(.,'Enviar lances')]
    Sleep    2
    Handle Alert    ACCEPT
    Sleep    2
    Capture Page Screenshot


Então abro os itens após disputa

    Wait Until Element Is Visible    ${FRAME_NEGOCIACAO}    timeout=30s
    Select Frame    ${FRAME_NEGOCIACAO}
    Capture Page Screenshot


    # Click no chekbox para marca o item
    Wait Until Element Is Visible    //table[1]/tbody[1]/tr[2]/td[12]/input[1]    timeout=30s
    Click Element    //table[1]/tbody[1]/tr[2]/td[12]/input[1]


    # clique do botão abrir itens
    Wait Until Element Is Visible    //a[contains(.,'Abrir item')]    timeout=30s
    Click Element    //a[contains(.,'Abrir item')]
    Sleep    2
    Capture Page Screenshot
    Sleep    2


Então ecerro a disputa

    Wait Until Element Is Visible    ${FRAME_NEGOCIACAO}    timeout=30s
    Select Frame    ${FRAME_NEGOCIACAO}
    Capture Page Screenshot


    # Click no chekbox para marca o item
    Wait Until Element Is Visible    //table[1]/tbody[1]/tr[2]/td[12]/input[1]    timeout=30s
    Click Element    //table[1]/tbody[1]/tr[2]/td[12]/input[1]


    # clique do botão abrir itens
    Wait Until Element Is Visible    //a[contains(.,'Encerrar disputa')]   timeout=30s
    Click Element    //a[contains(.,'Encerrar disputa')]
    Sleep    2
    Capture Page Screenshot
    Sleep    2

    Switch Window    NEW

    # Campo justificativa
    Wait Until Element Is Visible    //textarea[contains(@name,'tbxJustificativa')]   timeout=30s
    Input Text    //textarea[contains(@name,'tbxJustificativa')]    Justificativa


    # Clique do botão sim
    Wait Until Element Is Visible    //input[contains(@name,'btnSim')]    30s
    Capture Page Screenshot
    Click Element    //input[contains(@name,'btnSim')]
    Sleep    2
    

Então abro Item/Lote para Lei 123
    Wait Until Element Is Visible    ${FRAME_NEGOCIACAO}    timeout=30s
    Select Frame    ${FRAME_NEGOCIACAO}
    Capture Page Screenshot


    # Click no chekbox para marca o item
    Wait Until Element Is Visible    //table[1]/tbody[1]/tr[2]/td[13]/input[1]    timeout=30s
    Click Element    //table[1]/tbody[1]/tr[2]/td[13]/input[1]


    # clique do botão abrir itens
    Wait Until Element Is Visible    //a[contains(.,'Abrir item')]   timeout=30s
    Click Element    //a[contains(.,'Abrir item')]
    Sleep    2
    Capture Page Screenshot
    Sleep    2

    Switch Window    NEW

    # Campo justificativa
    Wait Until Element Is Visible    //textarea[contains(@name,'tbxJustificativa')]   timeout=30s
    Input Text    //textarea[contains(@name,'tbxJustificativa')]    Justificativa


    # Clique do botão sim
    Wait Until Element Is Visible    //input[contains(@name,'btnSim')]    30s
    Capture Page Screenshot
    Click Element    //input[contains(@name,'btnSim')]
    Sleep    2
    
    
Então encerro Item/Lote para Lei 123
    Wait Until Element Is Visible    ${FRAME_NEGOCIACAO}    timeout=30s
    Select Frame    ${FRAME_NEGOCIACAO}
    Capture Page Screenshot


    # Click no chekbox para marca o item
    Wait Until Element Is Visible    //table[1]/tbody[1]/tr[2]/td[14]/input[1]    timeout=30s
    Click Element    //table[1]/tbody[1]/tr[2]/td[14]/input[1]


    # clique do botão abrir itens
    Wait Until Element Is Visible    //a[contains(.,'Encerrar item')]   timeout=30s
    Click Element    //a[contains(.,'Encerrar item')]
    Sleep    2
    Capture Page Screenshot
    Sleep    2

    Switch Window    NEW

    # Campo justificativa
    Wait Until Element Is Visible    //textarea[contains(@name,'tbxJustificativa')]   timeout=30s
    Input Text    //textarea[contains(@name,'tbxJustificativa')]    Justificativa


    # Clique do botão sim
    Wait Until Element Is Visible    //input[contains(@name,'btnSim')]    30s
    Capture Page Screenshot
    Click Element    //input[contains(@name,'btnSim')]
    Sleep    2
    

Então faço a convocação do vencedor

    Select Frame    ${FRAME_DETALHE_PREGAO}

    Wait Until Element Is Visible    //a[contains(.,'Habilitação e proposta')]    30s
    Click Element    //a[contains(.,'Habilitação e proposta')]
    Capture Page Screenshot
    Sleep    2

    Switch Window    NEW

    Wait Until Element Is Visible    //table[1]/tbody[1]/tr[1]/td[8]/input[1]    30s
    Click Element    //table[1]/tbody[1]/tr[1]/td[8]/input[1]

    Wait Until Element Is Visible    //a[contains(.,'Convocar')]    30s
    Click Element    //a[contains(.,'Convocar')]
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[contains(.,'Enviar')]    30s
    Click Element    //a[contains(.,'Enviar')]
    Sleep    2
    Capture Page Screenshot

    # Clique no botão sim
    Wait Until Element Is Visible    //div[8]//table[1]/tbody[1]/tr[5]/td[1]/a[1]    30s
    Click Element    //div[8]//table[1]/tbody[1]/tr[5]/td[1]/a[1]
    Sleep    2
    Capture Page Screenshot


Então anexo o documento
    Select Frame    ${FRAME_DETALHE_PREGAO}

    Wait Until Element Is Visible    //a[contains(.,'Habilitação e proposta')]    30s
    Click Element    //a[contains(.,'Habilitação e proposta')]
    Capture Page Screenshot
    Sleep    2

    Switch Window    NEW

    Wait Until Element Is Visible    //table[1]/tbody[1]/tr[1]/td[8]/input[1]    30s
    Click Element    //table[1]/tbody[1]/tr[1]/td[8]/input[1]


    Wait Until Element Is Visible    //a[contains(.,'Anexar documentos')]    30s
    Click Element    //a[contains(.,'Anexar documentos')]
    Capture Page Screenshot


    Wait Until Element Is Visible    css=input[type="file"]    timeout=30s
    Choose File    css=input[type="file"]    C:\\Users\\Basis\\Downloads\\shareFile.pdf

    
    # Clique e escrevo no campo 'Tipo do documento'
    Wait Until Element Is Visible    
    ...    //input[contains(@name,'autoTipoDeDocumento')]    timeout=30s
    Input Text    
    ...    //input[contains(@name,'autoTipoDeDocumento')]
    ...    Carteira de Identidade
    Sleep    2
    Wait Until Element Is Visible    //li[text()="Carteira de Identidade"]    timeout=30s
    Click Element    //li[text()="Carteira de Identidade"]
    Sleep    2

    # Clique no botão 'Anexar' o arquivo
    Capture Page Screenshot
    Click Element    //input[@value='Anexar']
    Sleep    2
    Capture Page Screenshot


Então habilito o fonecedor vencedor
    Select Frame    ${FRAME_DETALHE_PREGAO}

    Wait Until Element Is Visible    //a[contains(.,'Habilitação e proposta')]    30s
    Click Element    //a[contains(.,'Habilitação e proposta')]
    Capture Page Screenshot
    Sleep    2

    Switch Window    NEW

    Wait Until Element Is Visible    //table[1]/tbody[1]/tr[1]/td[8]/input[1]    30s
    Click Element    //table[1]/tbody[1]/tr[1]/td[8]/input[1]

    Wait Until Element Is Visible    //a[contains(.,'Habilitar')]    30s
    Click Element    //a[contains(.,'Habilitar')]
    Capture Page Screenshot

    Switch Window    NEW

    Wait Until Element Is Visible    //textarea[contains(@name,'tbxJustificativa')]    30s
    Input Text    //textarea[contains(@name,'tbxJustificativa')]    Justificativa
    Capture Page Screenshot

    Wait Until Element Is Visible    //input[@value='Habilitar']    30s
    Click Element    //input[@value='Habilitar']
    Sleep    2
    Handle Alert    ACCEPT
    Sleep    2


Então encerro a etapa de pregão eletrônico
    ${TEXTO_ALERTA}    Set Variable    Confirma encerramento da etapa de negociação?
    
    Wait Until Element Is Visible    ${FRAME_NEGOCIACAO}    timeout=30s
    Select Frame    ${FRAME_NEGOCIACAO}
    Capture Page Screenshot


    # clique do botão encerrar atapa
    Wait Until Element Is Visible    //a[contains(.,'Encerrar etapa')]   timeout=30s
    Click Element    //a[contains(.,'Encerrar etapa')]
    Sleep    2
    Handle Alert    ACCEPT
    Sleep    2
    Capture Page Screenshot


Então registro intenção de recurso
    Wait Until Element Is Visible    ${FRAME_NEGOCIACAO}    timeout=30s
    Select Frame    ${FRAME_NEGOCIACAO}
    Capture Page Screenshot


    # clique do botão encerrar atapa
    Wait Until Element Is Visible    //a[contains(.,'Registrar intenção')]   timeout=30s
    Click Element    //a[contains(.,'Registrar intenção')]
   
    Switch Window    NEW
    Wait Until Element Is Visible    //textarea[@tb='P_PREGAO_INTENCAO_RECURSO']    30s
    Input Text    //textarea[@tb='P_PREGAO_INTENCAO_RECURSO']    Registro de intenção de recursos

    Wait Until Element Is Visible    //input[@value='Salvar e fechar']    30s
    Click Element    //input[@value='Salvar e fechar']
    Sleep    2
    SeleniumLibrary.Close Browser

  
Então não acato a intenção de recurso
    Wait Until Element Is Visible    ${FRAME_NEGOCIACAO}    timeout=30s
    Select Frame    ${FRAME_NEGOCIACAO}
    Capture Page Screenshot


    Wait Until Element Is Visible    //a[contains(.,'A B S TRANSPORTES E TURISMO LTDA EPP')]    30s
    Click Element    //a[contains(.,'A B S TRANSPORTES E TURISMO LTDA EPP')]

    Switch Window    NEW

    # Click no rádio 'Não acatado'
    Wait Until Element Is Visible    //input[@tipo='integer'][contains(@id,'1')]    30s
    Click Element    //input[@tipo='integer'][contains(@id,'1')]

    
    Wait Until Element Is Visible    //textarea[contains(@tb,'P_PREGAO_INTENCAO_RECURSO')]    30s
    Input Text    //textarea[contains(@tb,'P_PREGAO_INTENCAO_RECURSO')]    Não acatado
    Capture Page Screenshot
    
    Wait Until Element Is Visible    //input[@value='Salvar e fechar']    30s
    Click Element    //input[@value='Salvar e fechar']
    Sleep    2


Então adjudico o pregão eletrônico
    Wait Until Element Is Visible    ${FRAME_NEGOCIACAO}    timeout=30s
    Select Frame    ${FRAME_NEGOCIACAO}
    Capture Page Screenshot


    # clique do botão encerrar atapa
    Wait Until Element Is Visible    //a[contains(.,'Adjudicar')]   timeout=60s
    Click Element    //a[contains(.,'Adjudicar')]
    Capture Page Screenshot

    Switch Window    NEW
    
    Wait Until Element Is Visible    //textarea[contains(@name,'tbxJustificativa')]    timeout=30S
    Input Text    //textarea[contains(@name,'tbxJustificativa')]    Pregão adjudicado com sucesso
    Capture Page Screenshot

    Wait Until Element Is Visible    //input[contains(@value,'Sim')]    30s
    Click Element    //input[contains(@value,'Sim')]
    Sleep    6


Então homologo o pregão
    Wait Until Element Is Visible    ${FRAME_NEGOCIACAO}    timeout=30s
    Select Frame    ${FRAME_NEGOCIACAO}
    Capture Page Screenshot


    # clique do botão encerrar atapa
    Wait Until Element Is Visible    //a[contains(.,'Homologar pregão')]   timeout=60s
    Click Element    //a[contains(.,'Homologar pregão')]
    Capture Page Screenshot

    Switch Window    NEW
    
    Wait Until Element Is Visible    //textarea[contains(@name,'tbxJustificativa')]    timeout=30S
    Input Text    //textarea[contains(@name,'tbxJustificativa')]    Pregão homologado com sucesso
    Capture Page Screenshot

    Wait Until Element Is Visible    //input[contains(@value,'Sim')]    30s
    Click Element    //input[contains(@value,'Sim')]
    Sleep    6