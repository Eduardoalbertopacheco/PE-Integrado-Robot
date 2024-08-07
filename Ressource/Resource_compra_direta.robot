*** Settings ***
Documentation    
Library          SeleniumLibrary
Resource         ../Ressource/Resource_Cadastro_pregão.robot


*** Variables ***
${OBJETO_CP}       Compra Direta - ITEM - DISPENSA 05/08

${CAMPO_OBJETO}    //textarea[@name='ctl00$ContentPrincipal$txtObjeto']


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
    Wait Until Element Is Visible    ${SELECAO.CAMPO_MODALIDADE}    timeout=30s
    Click Element    ${SELECAO.CAMPO_MODALIDADE}
    Sleep    2
    Click Element     ${SELECAO_VALUE.MOD_DISPENSA}
    Capture Page Screenshot


E seleciono o modalidade para Inexigibilidade
    Wait Until Element Is Visible    ${SELECAO.CAMPO_MODALIDADE}    timeout=30s
    Click Element    ${SELECAO.CAMPO_MODALIDADE}
    Sleep    2
    Click Element     ${SELECAO_VALUE.MOD_INEXIGIBILIDADE}
    Capture Page Screenshot


E seleciono o modalidade para Dispensa Emergencial
    Wait Until Element Is Visible    ${SELECAO.CAMPO_MODALIDADE}    timeout=30s
    Click Element    ${SELECAO.CAMPO_MODALIDADE}
    Sleep    2
    Click Element     ${SELECAO_VALUE.MOD_DISPENSA_EMERGENCIAL}
    Capture Page Screenshot


E seleciono Critério para LEI 14.133/2021, ART. 75, VIII - DISPENSA
    Wait Until Element Is Visible    ${SELECAO.CAMPO_CRITERIO}    timeout=30s
    Click Element    ${SELECAO.CAMPO_CRITERIO}
    Sleep    2
    Click Element     ${SELECAO_VALUE.CRITERIO_DISPENSA}
    Capture Page Screenshot


E Seleciono Critério LEI FEDERAL Nº 14.133/2021, ART. 74 - Inexigibilidade
    Wait Until Element Is Visible    ${SELECAO.CAMPO_CRITERIO}    timeout=30s
    Click Element    ${SELECAO.CAMPO_CRITERIO}
    Sleep    2
    Click Element     ${SELECAO_VALUE.CRITERIO_INEXIGIBILIDADE}
    Capture Page Screenshot


E seleciono Critério LEI 14.133/2021, ART. 75, VIII - DISPENSA EMERGENCIAl
    Wait Until Element Is Visible    ${SELECAO.CAMPO_CRITERIO}    timeout=30s
    Click Element    ${SELECAO.CAMPO_CRITERIO}
    Sleep    2
    Click Element     ${SELECAO_VALUE.CRITERIO_DISPENSA_EMERGENCIAL}
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

    # Seleção para registro de preço 'SIM'
    Wait Until Element Is Visible    //table[1]/tbody[1]/tr[7]/td[2]/span[1]/input[1]
    Click Element    //table[1]/tbody[1]/tr[7]/td[2]/span[1]/input[1]

    Wait Until Element Is Visible    ${CAMPO_OBJETO} 
    Input Text    ${CAMPO_OBJETO}     ${OBJETO_CP}

    # Condição de pagamento
    Wait Until Element Is Visible    ${SELECAO.CONDICAO_PAGAMENTO}    timeout=30s
    Click Element    ${SELECAO.CONDICAO_PAGAMENTO}
    Sleep    2
    Wait Until Element Is Visible    ${SELECAO_VALUE.CONDICAO_PAGAMENTO_A_VISTA}    timeout=30s
    Click Element    ${SELECAO_VALUE.CONDICAO_PAGAMENTO_A_VISTA}


    # Prazo de entrega
    Wait Until Element Is Visible    ${SELECAO.PRAZO_ENTREGA}    timeout=30s
    Click Element    ${SELECAO.PRAZO_ENTREGA}
    Sleep    2
    Wait Until Element Is Visible    ${SELECAO_VALUE.PRAZO_ENTREGA_10_DIAS}    timeout=30s
    Click Element    ${SELECAO_VALUE.PRAZO_ENTREGA_10_DIAS}
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


E clico na compra direta em recebimento de lances
   ${all_windows}=    Get Window Handles

    ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //td[@id='ctl00_pesquisaDataGrid_dtgPesquisa_gridTd']//table//tr[td/label[text()='${OBJETO_CP}']]//td[8]//img[contains(@title,'Recebimento de lances')]
    WHILE    ${element_found} == False
        Execute JavaScript    window.location.reload()
        Sleep    5 sec
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //td[@id='ctl00_pesquisaDataGrid_dtgPesquisa_gridTd']//table//tr[td/label[text()='${OBJETO_CP}']]//td[8]//img[contains(@title,'Recebimento de lances')]
    END
    Click Element    //td[@id='ctl00_pesquisaDataGrid_dtgPesquisa_gridTd']//table//tr[td/label[text()='${OBJETO_CP}']]//td[2]//a



E clico na Compra Direta da lista
    Wait Until Element Is Visible    //td[@id='ctl00_pesquisaDataGrid_dtgPesquisa_gridTd']//table//tr[td/label[text()='${OBJETO_CP}']]//td[2]//a    timeout=30s
    Click Element     //td[@id='ctl00_pesquisaDataGrid_dtgPesquisa_gridTd']//table//tr[td/label[text()='${OBJETO_CP}']]//td[2]//a
    Capture Page Screenshot


E seleciono a Compra Direta da lista
    Wait Until Element Is Visible    //td[@id='ctl00_pesquisaDataGrid_dtgPesquisa_gridTd']//table//tr[td/label[text()='${OBJETO_CP}']]//td[10]//input    timeout=30s
    Click Element     //td[@id='ctl00_pesquisaDataGrid_dtgPesquisa_gridTd']//table//tr[td/label[text()='${OBJETO_CP}']]//td[10]//input
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
    Click Element    //option[contains(@value,'7000')]


    # Selecionar a SC para Incluir
    Wait Until Element Is Visible    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${resumo_sc}']]//td[5]//input    timeout=30s
    Click Element    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${resumo_sc}']]//td[5]//input
    Capture Page Screenshot
    
    # Clique em incluir
    Wait Until Element Is Visible     //a[contains(.,'Incluir')]    timeout=30s
    Click Element    //a[contains(.,'Incluir')]
    Sleep    2    Capture Page Screenshot

Então faço o agendamento da compra Direta
    Wait Until Element Is Visible    //a[contains(.,'Agendar')]    timeout=30s
    Click Element    //a[contains(.,'Agendar')]


    # Switch Window    NEW
    # Maximize Browser Window
    # Sleep    2
    # Capture Page Screenshot

    # # Clique do borão Sim 
    # Click Element    //input[contains(@value,'Sim')]
    # Sleep    3



E configuro o agendamento

    # Data inicial dos lances
   ${hora_atual+03min}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(minutes=3)).strftime('%d-%m-%Y %H:%M:%S')    datetime
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

E preencho os dados do segundo lance na Compra Direta por Lote

    Select Frame    ${FRAME_NEGOCIACAO}
    ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    ${CAMPO_SELECAO_MARCA_LOTE}
    WHILE    ${element_found} == False
        Execute JavaScript    window.location.reload()
        Sleep    5 sec
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    ${CAMPO_SELECAO_MARCA_LOTE}
    END

    Click Element    ${CAMPO_SELECAO_MARCA_LOTE}
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
    ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    ${CAMPO_SELECAO_MARCA_LOTE}
    WHILE    ${element_found} == False
        Execute JavaScript    window.location.reload()
        Sleep    5 sec
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    ${CAMPO_SELECAO_MARCA_LOTE}
    END

    Click Element    ${CAMPO_SELECAO_MARCA_LOTE}
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
    ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    ${CAMPO_SELECAO_MARCA}
    WHILE    ${element_found} == False
        Execute JavaScript    window.location.reload()
        Sleep    5 sec
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    ${CAMPO_SELECAO_MARCA}
    END
    Click Element    ${CAMPO_SELECAO_MARCA}

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
    ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    ${CAMPO_SELECAO_MARCA}
    WHILE    ${element_found} == False
        Execute JavaScript    window.location.reload()
        Sleep    5 sec
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    ${CAMPO_SELECAO_MARCA}
    END
    Click Element    ${CAMPO_SELECAO_MARCA}


    # Log    Executando clique no dropdown
    # Wait Until Element Is Visible    ${SELECAO_MARCA}    timeout=30s
    # Click Element    ${SELECAO_MARCA}
    # Log    Dropdown expandido, aguardando item

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
    Input Text    //form[1]/table[1]/tbody[1]/tr[3]/td[1]/table[1]/tbody[1]/tr[2]/td[2]/div[1]/span[2]/span[1]/input[1]    99
    Capture Page Screenshot


Então envio o lance na compra direta

    # Clicque do botão enviar lances
    Wait Until Element Is Visible    //a[contains(.,'Enviar lances')]
    Click Element    //a[contains(.,'Enviar lances')]
    Sleep    3
    Capture Page Screenshot

E clico em prorrogar pregão na compra Direta
    Select Frame    //frame[@name='frmDetalheCompraDireta']

    Wait Until Element Is Visible    //a[contains(.,'Prorrogar')]    timeout=30s
    Click Element    //a[contains(.,'Prorrogar')]
    Capture Page Screenshot


E insiro as novas datas para prorrogar Compra Direta

    ${all_windows}=    Get Window Handles
    ${janela}=    Set Variable    ${all_windows}[1]

    ${hora_atual+3min}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(minutes=3)).strftime('%d-%m-%Y %H:%M:%S')    datetime
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


Então finalizo a Compra Direta

    Select Frame    //frame[contains(@name,'frmNegociacao')]


   ${all_windows}=    Get Window Handles

    ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //a[contains(.,'Finalizar compra direta')]
    WHILE    ${element_found} == False
        Execute JavaScript    window.location.reload()
        Sleep    5 sec
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //a[contains(.,'Finalizar compra direta')]
    END
    Click Element    //a[contains(.,'Finalizar compra direta')]
    Sleep    2



    # Wait Until Element Is Visible    //a[contains(.,'Finalizar compra direta')]    timeout=30s
    # Click Element    //a[contains(.,'Finalizar compra direta')]
    # Sleep    2

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

E acesso a auditoria

    ${all_windows}=    Get Window Handles
    Switch Window    ${all_windows}[0]
    Select Frame    //frame[@name='frmDetalheCompraDireta']

    Wait Until Element Is Visible    //a[contains(.,'Auditoria')]    timeout=30s
    Click Element    //a[contains(.,'Auditoria')]
    Sleep    2
    Capture Page Screenshot





    
