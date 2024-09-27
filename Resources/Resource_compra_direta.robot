*** Settings ***
Documentation    Ações e Elementos do Móduo de Cadastro de Compra Direta
Library          SeleniumLibrary
Resource         ../Resources/Variaveis.robot
Resource        ../Resources/Resource_Cadastro_SC.robot
Resource        ../Resources/Resource_cadastro_pregao.robot


*** Variables ***
${CAMPO_OBJETO_COMPRA}    //input[@name='_cP_COMPRA_DIRETA_x_sDsObjeto']
${CAMPO_MODALIDADE}    //td[@id="td_cP_COMPRA_DIRETA_x_nCdModalidade"]
${CAMPO_CRITERIO}    //td[@id="td_cP_COMPRA_DIRETA_x_nCdCriterio"]
${CONDICAO_PAGAMENTO}    //td[@id="td_cP_COMPRA_DIRETA_x_nCdCondicaoPagamento"]
${PRAZO_ENTREGA}    //td[@id="td_cP_COMPRA_DIRETA_x_nCdPrazoEntrega"]
${MOD_DISPENSA_EMERGENCIAL}    //li[contains(.,'Dispensa Emergencial')]
${CRITERIO_DISPENSA_EMERGENCIAL}    //li[text() = "LEI 14.133/2021, ART. 75, VIII - DISPENSA POR EMERGÊNCIA OU DE CALAMIDADE PÚBLICA"]
${CONDICAO_PAGAMENTO_A_VISTA}    //li[@tabindex='-1'][contains(.,'Á vista')]
${PRAZO_ENTREGA_10_DIAS}    //li[@tabindex='-1'][contains(.,'10 DIAS')]
${MOD_DISPENSA}    (//li[@tabindex='-1'][contains(.,'Dispensa')])[1]
${MOD_INEXIGIBILIDADE}     //li[contains(.,'Inexigibilidade')]
${CRITERIO_DISPENSA}   //li[@tabindex='-1'][contains(.,'LEI 14.133/2021, ART. 75, VIII - DISPENSA POR EMERGÊNCIA OU DE CALAMIDADE PÚBLICA')]
${CRITERIO_INEXIGIBILIDADE}    //li[text() = "LEI FEDERAL Nº 14.133/2021, ART. 74, CAPUT - INEXIGIBILIDADE QUANDO INVIÁVEL A COMPETIÇÃO"]
${timeout}=        300    
${interval}=       5 


*** Keywords ***

E acesso a lista de todas as Compras Direta
    Select Frame    //frame[@name='main']

    # Clique em negociação
    Wait Until Element Is Visible    xpath=//div[@unselectable='on'][contains(.,'Negociação')]    timeout=30s
    Click Element    xpath=//div[@unselectable='on'][contains(.,'Negociação')]

    # mouse over em Compra Direta
    ${elemento}    Get WebElement    
    ...    xpath=//td[@class='label'][contains(.,'Compra direta')]
    Mouse Over    ${elemento}


    # Clique em Lista de compras diretas
    Wait Until Element Is Visible    
    ...    xpath=//td[@class='label'][contains(.,'Lista de compras diretas')]    timeout=30s
    Click Element    
    ...    xpath=//td[@class='label'][contains(.,'Lista de compras diretas')]
    # Sleep    2
    Capture Page Screenshot

E clico em Incluir Processo de Compra Direta
    
    Wait Until Element Is Visible    //a[contains(.,'Incluir processo')]    timeout=30s
    Click Element    //a[contains(.,'Incluir processo')]


E seleciono o filtro Compras diretas encerradas

    Select Frame    xpath=//iframe[@class='ifrmConteudo']

    # Clique no campo exibir
    Wait Until Element Is Visible    //select[contains(@name,'ddlVisoes')]    timeout=30s
    Click Element    //select[contains(@name,'ddlVisoes')]

    # Seleção de todas as compras diretas
    Wait Until Element Is Visible    //option[@value='19009'][contains(.,'Compras diretas encerradas')]    timeout=30s
    Click Element    //option[@value='19009'][contains(.,'Compras diretas encerradas')]

    # Clique do botão pesquisar
    Wait Until Element Is Visible    //input[@value='Pesquisar']    timeout=30s
    Click Element    //input[@value='Pesquisar']
    Sleep    2
    Capture Page Screenshot



E seleciono o filtro Todas as compras diretas

    Select Frame    xpath=//iframe[@class='ifrmConteudo']

    # Clique no campo exibir
    Wait Until Element Is Visible    //select[contains(@name,'ddlVisoes')]    timeout=30s
    Click Element    //select[contains(@name,'ddlVisoes')]

    # Seleção de todas as compras diretas
    Wait Until Element Is Visible    //option[@value='19000'][contains(.,'Todas as compras diretas')]    timeout=30s
    Click Element    //option[@value='19000'][contains(.,'Todas as compras diretas')]

    # Clique do botão pesquisar
    Wait Until Element Is Visible    //input[@value='Pesquisar']    timeout=30s
    Click Element    //input[@value='Pesquisar']
    Sleep    2
    Capture Page Screenshot


E seleciono o filtro Compra diretas em andamento

    Select Frame    xpath=//iframe[@class='ifrmConteudo']

    # Clique no campo exibir
    Wait Until Element Is Visible    //select[contains(@name,'ddlVisoes')]    timeout=30s
    Click Element    //select[contains(@name,'ddlVisoes')]

    # Seleção de todas as compras diretas
    Wait Until Element Is Visible    //option[@value='19002'][contains(.,'Compras diretas em andamento')]    timeout=30s
    Click Element    //option[@value='19002'][contains(.,'Compras diretas em andamento')]

    # Clique do botão pesquisar
    Wait Until Element Is Visible    //input[@value='Pesquisar']    timeout=30s
    Click Element    //input[@value='Pesquisar']
    Sleep    2
    Capture Page Screenshot


E seleciono o modalidade para Dispensa
    Wait Until Element Is Visible    ${CAMPO_MODALIDADE}    timeout=30s
    Click Element    ${CAMPO_MODALIDADE}
    Sleep    2
    Click Element     ${MOD_DISPENSA}
    Capture Page Screenshot


E seleciono o modalidade para Inexigibilidade
    Wait Until Element Is Visible    ${CAMPO_MODALIDADE}    timeout=30s
    Click Element    ${CAMPO_MODALIDADE}
    Sleep    2
    Click Element     ${MOD_INEXIGIBILIDADE}
    Capture Page Screenshot


E seleciono o modalidade para Dispensa Emergencial
    Wait Until Element Is Visible    ${CAMPO_MODALIDADE}    timeout=30s
    Click Element    ${CAMPO_MODALIDADE}
    Sleep    2
    Click Element     ${MOD_DISPENSA_EMERGENCIAL}
    Capture Page Screenshot


E seleciono Critério para LEI 14.133/2021, ART. 75, VIII - DISPENSA
    Wait Until Element Is Visible    ${CAMPO_CRITERIO}    timeout=30s
    Click Element    ${CAMPO_CRITERIO}
    Sleep    2
    Click Element     ${CRITERIO_DISPENSA}
    Capture Page Screenshot


E seleciono a Comissão - TJ
    # Comissão
    Wait Until Element Is Visible    (//img[contains(@id,'img')])[2]    timeout=30s
    Click Element    (//img[contains(@id,'img')])[2]

    ${all_windows}=    Get Window Handles
    ${second_window}=    Set Variable    ${all_windows}[1]

    Switch Window    NEW

    Wait Until Element Is Visible    //input[contains(@value,'17')]    timeout=30s
    Click Element    //input[contains(@value,'17')]
    Capture Page Screenshot

    Click Element    //input[contains(@value,'Confirmar')]
    Sleep    2


E Seleciono Critério LEI FEDERAL Nº 14.133/2021, ART. 74 - Inexigibilidade
    Wait Until Element Is Visible    ${CAMPO_CRITERIO}    timeout=30s
    Click Element    ${CAMPO_CRITERIO}
    Sleep    2
    Click Element     ${CRITERIO_INEXIGIBILIDADE}
    Capture Page Screenshot


E seleciono Critério LEI 14.133/2021, ART. 75, VIII - DISPENSA EMERGENCIAl
    Wait Until Element Is Visible    ${CAMPO_CRITERIO}    timeout=30s
    Click Element    ${CAMPO_CRITERIO}
    Sleep    2
    Click Element     ${CRITERIO_DISPENSA_EMERGENCIAL}
    Capture Page Screenshot


E incluo as datas do agendamento
    Switch Window    NEW

    # Data inicial dos lances
   ${hora_atual+05min}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(minutes=5)).strftime('%d-%m-%Y %H:%M:%S')    datetime
    Log    ${hora_atual+05min}

    # Data final dos lances
    ${hora_atual+07min}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(minutes=7)).strftime('%d-%m-%Y %H:%M:%S')    datetime
    Log    ${hora_atual+07min}


    Wait Until Element Is Visible    //input[contains(@name,'tDtInicial')]
    Input Text    //input[contains(@name,'tDtInicial')]    ${hora_atual+05min}


    Wait Until Element Is Visible    //input[contains(@name,'tDtFinal')]
    Input Text    //input[contains(@name,'tDtFinal')]    ${hora_atual+07min}
    Input Text    //input[contains(@name,'tDtFinal')]    ${hora_atual+07min}
    Capture Page Screenshot


Então preencho todos os campos da Aba Dados gerais
    ${all_windows}=    Get Window Handles
    ${second_window}=    Set Variable    ${all_windows}[1]
    Switch Window    ${all_windows}[1]

    # Seleção para registro de preço 'SIM'
    Wait Until Element Is Visible    //table[1]/tbody[1]/tr[7]/td[2]/span[1]/input[1]
    Click Element    //table[1]/tbody[1]/tr[7]/td[2]/span[1]/input[1]

    Wait Until Element Is Visible    ${CAMPO_OBJETO_COMPRA}    30
    Input Text    ${CAMPO_OBJETO_COMPRA}     ${OBJETO_COMPRA}

    # Condição de pagamento
    Wait Until Element Is Visible    ${CONDICAO_PAGAMENTO}    timeout=30s
    Click Element    ${CONDICAO_PAGAMENTO}
    Sleep    2
    Wait Until Element Is Visible    ${CONDICAO_PAGAMENTO_A_VISTA}    timeout=30s
    Click Element    ${CONDICAO_PAGAMENTO_A_VISTA}


    # Prazo de entrega
    Wait Until Element Is Visible    ${PRAZO_ENTREGA}    timeout=30s
    Click Element    ${PRAZO_ENTREGA}
    Sleep    2
    Wait Until Element Is Visible    ${PRAZO_ENTREGA_10_DIAS}    timeout=30s
    Click Element    ${PRAZO_ENTREGA_10_DIAS}
    Capture Page Screenshot


    # Comissão
    Wait Until Element Is Visible    (//img[contains(@id,'img')])[2]    timeout=30s
    Click Element    (//img[contains(@id,'img')])[2]

    ${all_windows}=    Get Window Handles
    ${second_window}=    Set Variable    ${all_windows}[1]

    Switch Window    NEW

    Wait Until Element Is Visible    //input[contains(@value,'344')]    timeout=30s
    Click Element    //input[contains(@value,'344')]
    Capture Page Screenshot

    Click Element    //input[contains(@value,'Confirmar')]
    Sleep    2

    ${all_windows}=    Get Window Handles
    ${second_window}=    Set Variable    ${all_windows}[1]
    Switch Window    ${all_windows}[1]
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

    # clique em não utilizar verba vederal
    Wait Until Element Is Visible    //input[contains(@id,'_cP_COMPRA_DIRETA_x_bFlUtilizaVerbaFederal_1')]    timeout=30s
    Click Element    //input[contains(@id,'_cP_COMPRA_DIRETA_x_bFlUtilizaVerbaFederal_1')]
    Capture Page Screenshot

    # Clique do botão Salvar
    Wait Until Element Is Visible    //input[@name='btnSalvar']    timeout=30s
    Click Element    //input[@name='btnSalvar']
    Sleep    2
    Handle Alert    ACCEPT
    Sleep    2
    SeleniumLibrary.Close Browser


E clico na compra direta em recebimento de lances

    ${start_time}=    Get Time    epoch
    FOR    ${i}    IN RANGE    ${timeout}
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //td[@id='ctl00_pesquisaDataGrid_dtgPesquisa_gridTd']//table//tr[td/label[text()='${OBJETO_COMPRA}']]//td[8]//img[contains(@title,'Recebimento de lances')]
        Sleep    20
        Run Keyword If    ${element_found}    Click Element    //td[@id='ctl00_pesquisaDataGrid_dtgPesquisa_gridTd']//table//tr[td/label[text()='${OBJETO_COMPRA}']]//td[2]//a
        Run Keyword If    ${element_found}    Exit For Loop
        
        Execute JavaScript    window.location.reload()
        Sleep    ${interval} sec

        ${current_time}=    Get Time    epoch
        ${elapsed_time}=    Evaluate    ${current_time} - ${start_time}
        Run Keyword If    ${elapsed_time} > ${timeout}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    END
    Run Keyword If    not ${element_found}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.


E clico na Compra Direta da lista Aguardando ratificação
   
    ${start_time}=    Get Time    epoch
    FOR    ${i}    IN RANGE    ${timeout}
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //td[@id='ctl00_pesquisaDataGrid_dtgPesquisa_gridTd']//table//tr[td/label[text()='${OBJETO_COMPRA}']]//td[8]//img[contains(@title,'Aguardando ratificação')]
        Run Keyword If    ${element_found}    Click Element    //td[@id='ctl00_pesquisaDataGrid_dtgPesquisa_gridTd']//table//tr[td/label[text()='${OBJETO_COMPRA}']]//td[2]//a
        Run Keyword If    ${element_found}    Exit For Loop
        
        Execute JavaScript    window.location.reload()
        Sleep    ${interval} sec

        ${current_time}=    Get Time    epoch
        ${elapsed_time}=    Evaluate    ${current_time} - ${start_time}
        Run Keyword If    ${elapsed_time} > ${timeout}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    END
    Run Keyword If    not ${element_found}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.


E clico na Compra Direta da lista

    Wait Until Element Is Visible    //td[@id='ctl00_pesquisaDataGrid_dtgPesquisa_gridTd']//table//tr[td/label[text()='${OBJETO_COMPRA}']]//td[2]//a    timeout=30s
    Click Element     //td[@id='ctl00_pesquisaDataGrid_dtgPesquisa_gridTd']//table//tr[td/label[text()='${OBJETO_COMPRA}']]//td[2]//a
    Capture Page Screenshot


E seleciono a Compra Direta da lista
    Wait Until Element Is Visible    //td[@id='ctl00_pesquisaDataGrid_dtgPesquisa_gridTd']//table//tr[td/label[text()='${OBJETO_COMPRA}']]//td[10]//input    timeout=30s
    Click Element     //td[@id='ctl00_pesquisaDataGrid_dtgPesquisa_gridTd']//table//tr[td/label[text()='${OBJETO_COMPRA}']]//td[10]//input
    Capture Page Screenshot


Então incluo a SC Lote na compra Direta

    Switch Window    NEW
    Wait Until Element Is Visible    //a[contains(.,'Itens')]    timeout=30s
    Click Element    //a[contains(.,'Itens')]

    # Clique em Inserir itens da solicitação
    Wait Until Element Is Visible    //a[contains(.,'Inserir itens da solicitação')]    timeout=30s
    Click Element    //a[contains(.,'Inserir itens da solicitação')]


    Switch Window    NEW

    # Clique no campo exibir
    Wait Until Element Is Visible    //select[contains(@name,'ctl00$ddlVisoes')]    timeout=30s
    Click Element    //select[contains(@name,'ctl00$ddlVisoes')]
    Sleep    1
    Wait Until Element Is Visible    //option[contains(@value,'7051')]
    Click Element    //option[contains(@value,'7051')]


    # Selecionar a SC para Incluir
    Wait Until Element Is Visible    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${resumo_sc}']]//td[5]//input    timeout=30s
    Click Element    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${resumo_sc}']]//td[5]//input
    Capture Page Screenshot
    
    # Clique em incluir
    Wait Until Element Is Visible     //a[contains(.,'Incluir')]    timeout=30s
    Click Element    //a[contains(.,'Incluir')]
    Sleep    2    Capture Page Screenshot
    SeleniumLibrary.Close Browser


Então incluo a SC Item na compra Direta

    Switch Window    NEW
    Wait Until Element Is Visible    //a[contains(.,'Itens')]    timeout=30s
    Click Element    //a[contains(.,'Itens')]

    # Clique em Inserir itens da solicitação
    Wait Until Element Is Visible    //a[contains(.,'Inserir itens da solicitação')]    timeout=30s
    Click Element    //a[contains(.,'Inserir itens da solicitação')]


    Switch Window    NEW

    # Clique no campo exibir
    Wait Until Element Is Visible    //select[contains(@name,'ctl00$ddlVisoes')]    timeout=30s
    Click Element    //select[contains(@name,'ctl00$ddlVisoes')]
    Sleep    1
    Wait Until Element Is Visible    //option[contains(@value,'7000')]
    Sleep    1
    Click Element    //option[contains(@value,'7000')]


    # Selecionar a SC para Incluir
    Wait Until Element Is Visible    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${resumo_sc}']]//td[5]//input    timeout=30s
    Click Element    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${resumo_sc}']]//td[5]//input
    Capture Page Screenshot
    
    # Clique em incluir
    Wait Until Element Is Visible     //a[contains(.,'Incluir')]    timeout=30s
    Click Element    //a[contains(.,'Incluir')]
    Sleep    2    Capture Page Screenshot
    SeleniumLibrary.Close Browser


Então faço o agendamento da compra Direta
    Wait Until Element Is Visible    //a[contains(.,'Agendar')]    timeout=30s
    Click Element    //a[contains(.,'Agendar')]
    Sleep    2
 

E configuro o agendamento

    # Data inicial dos lances
   ${hora_atual+03min}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(minutes=4)).strftime('%d-%m-%Y %H:%M:%S')    datetime
    Log    ${hora_atual+03min}

    # Data final dos lances
    ${hora_atual+300min}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(minutes=300)).strftime('%d-%m-%Y %H:%M:%S')    datetime
    Log    ${hora_atual+300min}

    Switch Window    NEW

    # Clique do chekbox
    Wait Until Element Is Visible    //input[@name='ckbAgendar']    timeout=30s
    Click Element    //input[@name='ckbAgendar']
    Capture Page Screenshot

    # Clique do borão Sim 
    Click Element    //input[contains(@value,'Sim')]
    Sleep    2

    ${all_windows}=    Get Window Handles
    ${second_window}=    Set Variable    ${all_windows}[1]

    Switch Window    ${all_windows}[1]

    Wait Until Element Is Visible    //input[contains(@name,'tbxDataInicialProposta')]    timeout=30s
    # Clear Text    //input[contains(@name,'tbxDataInicialProposta')]
    Input Text    //input[contains(@name,'tbxDataInicialProposta')]    ${hora_atual+03min}

    
    Wait Until Element Is Visible    //input[contains(@name,'tbxDataEncerramento')]    timeout=30s
    # Clear Text    //input[contains(@name,'tbxDataEncerramento')]
    Input Text    //input[contains(@name,'tbxDataEncerramento')]    ${hora_atual+300min}
    Capture Page Screenshot

    Click Element    //input[@value='Agendar']
    Sleep    3
    SeleniumLibrary.Close Browser

E preencho os dados do segundo lance na Compra Direta por Lote

    Select Frame    ${FRAME_NEGOCIACAO} 
    ${start_time}=    Get Time    epoch
    FOR    ${i}    IN RANGE    ${timeout}
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    ${CAMPO_SELECAO_MARCA_LOTE}
        Run Keyword If    ${element_found}    Click Element    ${CAMPO_SELECAO_MARCA_LOTE}
        Run Keyword If    ${element_found}    Exit For Loop
        
        Execute JavaScript    window.location.reload()
        Sleep    ${interval} sec

        ${current_time}=    Get Time    epoch
        ${elapsed_time}=    Evaluate    ${current_time} - ${start_time}
        Run Keyword If    ${elapsed_time} > ${timeout}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    END
    Run Keyword If    not ${element_found}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.

    Log    Aguardando a visibilidade do item na lista
    Wait Until Element Is Visible    ${ITEM_LOTE}    timeout=30s

    Log    Item visível, clicando no item
    Capture Page Screenshot
    
    Click Element    ${ITEM_LOTE}
    Sleep    2s


    # Valor do lance
    Wait Until Element Is Visible    //input[contains(@class,'k-formatted-value k-input')]    timeout=30s
    Input Text    //input[contains(@class,'k-formatted-value k-input')]    98
    Sleep    2
    Capture Page Screenshot


E preencho os dados do lance na Compra Direta por Lote

    Select Frame    ${FRAME_NEGOCIACAO}  
    ${start_time}=    Get Time    epoch
    FOR    ${i}    IN RANGE    ${timeout}
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    ${CAMPO_SELECAO_MARCA_LOTE}
        Run Keyword If    ${element_found}    Click Element    ${CAMPO_SELECAO_MARCA_LOTE}
        Run Keyword If    ${element_found}    Exit For Loop
        
        Execute JavaScript    window.location.reload()
        Sleep    ${interval} sec

        ${current_time}=    Get Time    epoch
        ${elapsed_time}=    Evaluate    ${current_time} - ${start_time}
        Run Keyword If    ${elapsed_time} > ${timeout}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    END
    Run Keyword If    not ${element_found}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.

    Log    Aguardando a visibilidade do item na lista
    Wait Until Element Is Visible    ${ITEM_LOTE}    timeout=30s

    Log    Item visível, clicando no item
    Capture Page Screenshot
    
    Click Element    ${ITEM_LOTE}
    Sleep    2s


    # Valor do lance
    Wait Until Element Is Visible    //input[contains(@class,'k-formatted-value k-input')]    timeout=30s
    Input Text    //input[contains(@class,'k-formatted-value k-input')]    99
    Capture Page Screenshot



E preencho os dados do lance na Compra Direta por Item

    Select Frame    ${FRAME_NEGOCIACAO}   
    ${start_time}=    Get Time    epoch
    FOR    ${i}    IN RANGE    ${timeout}
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    ${CAMPO_SELECAO_MARCA}
        Run Keyword If    ${element_found}    Click Element    ${CAMPO_SELECAO_MARCA}
        Run Keyword If    ${element_found}    Exit For Loop
        
        Execute JavaScript    window.location.reload()
        Sleep    ${interval} sec

        ${current_time}=    Get Time    epoch
        ${elapsed_time}=    Evaluate    ${current_time} - ${start_time}
        Run Keyword If    ${elapsed_time} > ${timeout}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    END
    Run Keyword If    not ${element_found}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    Capture Page Screenshot

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
    Wait Until Element Is Visible    //form[1]/table[1]/tbody[1]/tr[3]/td[1]/table[1]/tbody[1]/tr[2]/td[2]/div[1]/span[2]/span[1]/input[1]    timeout=30s
    Input Text    //form[1]/table[1]/tbody[1]/tr[3]/td[1]/table[1]/tbody[1]/tr[2]/td[2]/div[1]/span[2]/span[1]/input[1]    100
    Capture Page Screenshot


E preencho os dados do segundo lance na Compra Direta por item

    Select Frame    ${FRAME_NEGOCIACAO}   
    ${start_time}=    Get Time    epoch
    FOR    ${i}    IN RANGE    ${timeout}
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    ${CAMPO_SELECAO_MARCA}
        Run Keyword If    ${element_found}    Click Element    ${CAMPO_SELECAO_MARCA}
        Run Keyword If    ${element_found}    Exit For Loop
        
        Execute JavaScript    window.location.reload()
        Sleep    ${interval} sec

        ${current_time}=    Get Time    epoch
        ${elapsed_time}=    Evaluate    ${current_time} - ${start_time}
        Run Keyword If    ${elapsed_time} > ${timeout}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    END
    Run Keyword If    not ${element_found}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    Capture Page Screenshot


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
    Sleep    2s
    Wait Until Element Is Visible    //form[1]/table[1]/tbody[1]/tr[3]/td[1]/table[1]/tbody[1]/tr[2]/td[2]/div[1]/span[2]/span[1]/input[1]    30
    Sleep    2s
    Input Text    //form[1]/table[1]/tbody[1]/tr[3]/td[1]/table[1]/tbody[1]/tr[2]/td[2]/div[1]/span[2]/span[1]/input[1]    99
    Capture Page Screenshot


Então envio o lance na compra direta

    # Clicque do botão enviar lances
    Wait Until Element Is Visible    //a[contains(.,'Enviar lances')]
    Click Element    //a[contains(.,'Enviar lances')]
    Sleep    3
    Capture Page Screenshot
    SeleniumLibrary.Close Browser


E clico em prorrogar pregão na compra Direta
    Select Frame    //frame[@name='frmDetalheCompraDireta']

    Wait Until Element Is Visible    //a[contains(.,'Prorrogar')]    timeout=30s
    Click Element    //a[contains(.,'Prorrogar')]
    Capture Page Screenshot


E insiro as novas datas para prorrogar Compra Direta

    ${all_windows}=    Get Window Handles
    ${janela}=    Set Variable    ${all_windows}[1]

    ${hora_atual+3min}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(minutes=4)).strftime('%d-%m-%Y %H:%M:%S')    datetime
    Log    ${hora_atual+3min}

    Switch Window    ${janela}
    Sleep    2

    Wait Until Element Is Visible    //textarea[contains(@name,'tbxJustificativa')]    timeout=30s
    Input Text    //textarea[contains(@name,'tbxJustificativa')]    Justificativa

    Sleep    2

    # Nova data para prorrogação
    Wait Until Element Is Visible    id=ctl00_conteudoPagina_tbxDataFinalLance
    Click Element    id=ctl00_conteudoPagina_tbxDataFinalLance
    Sleep    2
    Set Focus To Element    id=ctl00_conteudoPagina_tbxDataFinalLance
    Execute JavaScript    document.getElementById("ctl00_conteudoPagina_tbxDataFinalLance").value="${hora_atual+3min}";
    Sleep    2
    Capture Page Screenshot

Então faço o prorrogamento da compra direta
    Wait Until Element Is Visible    //input[contains(@value,'Sim')]    timeout=30s
    Click Element    //input[contains(@value,'Sim')]
    Sleep    2
    Handle Alert    ACCEPT
    Sleep    2
    SeleniumLibrary.Close Browser


Então finalizo a Compra Direta

    Select Frame    //frame[contains(@name,'frmNegociacao')]   
    ${start_time}=    Get Time    epoch
    FOR    ${i}    IN RANGE    ${timeout}
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //a[contains(.,'Finalizar compra direta')]
        Run Keyword If    ${element_found}    Click Element    //a[contains(.,'Finalizar compra direta')]
        Run Keyword If    ${element_found}    Exit For Loop
        
        Execute JavaScript    window.location.reload()
        Sleep    ${interval} sec

        ${current_time}=    Get Time    epoch
        ${elapsed_time}=    Evaluate    ${current_time} - ${start_time}
        Run Keyword If    ${elapsed_time} > ${timeout}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    END
    Run Keyword If    not ${element_found}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.

    Sleep    2

    ${all_windows}=    Get Window Handles
    ${janela_02}=    Set Variable    ${all_windows}[1]
    Switch Window    ${janela_02} 
    
    # Campo Justificativa
    Wait Until Element Is Visible    //textarea[contains(@name,'tbxJustificativa')]    timeout=30S
    Input Text    //textarea[contains(@name,'tbxJustificativa')]    Justificativa
    Capture Page Screenshot

    # Clique do botão conformar a justificativa
    Wait Until Element Is Visible    //input[contains(@value,'Sim')]
    Click Element    //input[contains(@value,'Sim')]
    Sleep    4
    SeleniumLibrary.Close Browser



Então ratifico a Compra Direta
    Select Frame    //frame[contains(@name,'frmNegociacao')]

    Wait Until Element Is Visible    //a[contains(.,'Ratificar compra direta')]    timeout=30s
    Click Element    //a[contains(.,'Ratificar compra direta')]
    Sleep    2

    ${all_windows}=    Get Window Handles
    ${janela_02}=    Set Variable    ${all_windows}[1]
    Switch Window    ${janela_02} 
    
    # Campo Justificativa
    Wait Until Element Is Visible    //textarea[contains(@name,'tbxJustificativa')]    timeout=30S
    Input Text    //textarea[contains(@name,'tbxJustificativa')]    Justificativa
    Capture Page Screenshot

    # Clique do botão conformar a justificativa
    Wait Until Element Is Visible    //input[contains(@value,'Sim')]
    Click Element    //input[contains(@value,'Sim')]
    Sleep    4
    SeleniumLibrary.Close Browser


E acesso a auditoria

    ${all_windows}=    Get Window Handles
    Switch Window    ${all_windows}[0]
    Select Frame    //frame[@name='frmDetalheCompraDireta']

    Wait Until Element Is Visible    //a[contains(.,'Auditoria')]    timeout=30s
    Click Element    //a[contains(.,'Auditoria')]
    Sleep    2
    Capture Page Screenshot
    SeleniumLibrary.Close Browser





    
