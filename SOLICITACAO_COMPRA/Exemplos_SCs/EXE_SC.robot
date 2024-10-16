*** Settings ***
Documentation    Cenário: Criar Um Solicitação de Compras Por Item e Encaminhar Para Compra Direta - Dispensa - Fluxo Feliz
Library          SeleniumLibrary
Library          Browser
Resource        ../../Resources/Resource_login.robot
Resource        ../../Resources/Resource_Cadastro_SC.robot

*** Variables ***
${HOMOLOG03}    https://www.homolog03.peintegrado.pe.gov.br/core/default.aspx

*** Keywords ***
Dado que acesso o sistema no honologue 03
    SeleniumLibrary.Open Browser    ${HOMOLOG03}    browser=chrome
    # SeleniumLibrary.Open Browser    ${URL}    chrome    options=--headless
    Maximize Browser Window
    Capture Page Screenshot

*** Test Cases ***

CT01 - Criar SC - Aba dados Gerais - Ações do Solicitante
    Configurar Variáveis de SC
    
    # Abrir navegador
    SeleniumLibrary.Open Browser    ${HOMOLOG03}    browser=chrome
    Maximize Browser Window
    Capture Page Screenshot

    #E faço login com usuário "${usuario}"
    Input Text        css=input[placeholder='Login']    solicitante.110402
    Input Text        css=input[placeholder='Senha']    PE@123456
    Capture Page Screenshot
    Click Element     css=input[type='submit']
    Sleep    3
    Capture Page Screenshot

    #E acesso a Tela de Lista de Solicitação de Compras
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
    
    Capture Page Screenshot
    Sleep    2

    #Então preencho os campos da Aba Dados gerais
    ${Janelas}    Get Window Handles
    
    Select Frame    //iframe[@name='frmConteudo']
    Wait Until Element Is Visible    //a[contains(.,'Incluir')]
    Click Element    //a[contains(.,'Incluir')]
    Sleep    2


    Switch Window    NEW
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
    Sleep    1
    Handle Alert    ACCEPT



    #Então incluo os itens e agrupo por lote
    Sleep    3
    Wait Until Element Is Visible    //a[contains(.,'Itens')]    timeout=30s
    Click Element    //a[contains(.,'Itens')]

    Wait Until Element Is Visible     //a[contains(.,'Incluir')]    timeout=30s
    Click Element    //a[contains(.,'Incluir')]
    Sleep    5
    
    #Campo Descrição
    Wait Until Element Is Visible    //input[contains(@name,'txtDescricao')]    timeout=30s
    Input Text    //input[contains(@name,'txtDescricao')]    TUBO DE SILICONE
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




    # # Então incluo os itens
    # Sleep    3
    # Wait Until Element Is Visible    //a[contains(.,'Itens')]    timeout=30s
    # Click Element    //a[contains(.,'Itens')]

    # Wait Until Element Is Visible     //a[contains(.,'Incluir')]    timeout=30s
    # Click Element    //a[contains(.,'Incluir')]
    # Sleep    5
    
    # Input Text     //*[@name="ctl00$ContentPrincipal$txtCodigo"]    1000241
    # Click Element    //*[@id="ctl00_ContentPrincipal_btnPesquisarProduto"]
    
    # Wait Until Element Is Visible    (//input[contains(@id,'ckbListProduto')])[1]    timeout=30s
    # Click Element    (//input[contains(@id,'ckbListProduto')])[1]

    # # Wait Until Element Is Visible    (//input[contains(@id,'ckbListProduto')])[2]
    # # Click Element    (//input[contains(@id,'ckbListProduto')])[2]

    # Click Element    //*[@id="ctl00_ContentButtom_btnConfirmar"]
    # Sleep    3


    # # Implementar aqui a quantidade do item
    # Wait Until Element Is Visible    xpath=(//span[contains(@unselectable,'on')])[10]    timeout=30s
    # Double Click Element    xpath=(//span[contains(@unselectable,'on')])[10]
    # Double Click Element    xpath=(//span[contains(@unselectable,'on')])[10]
    # Double Click Element    xpath=(//span[contains(@unselectable,'on')])[10]
    # Double Click Element    xpath=(//span[contains(@unselectable,'on')])[10]
    # Double Click Element    xpath=(//span[contains(@unselectable,'on')])[10]
    
    # #  Click no botão 'Salvar'
    # Wait Until Element Is Visible    xpath=//*[@id="ctl00_conteudoBotoes_btSalvar"]    timeout=30s
    # Capture Page Screenshot
    # Click Element         xpath=//*[@id="ctl00_conteudoBotoes_btSalvar"]
    # Sleep    4


    # Incluir Documento na Solicitação de Compras
    # Então incluo o documento do tipo Termo Referencia
    Wait Until Element Is Visible    xpath=//a[contains(.,'Documentos do processo')]    timeout=30s
    Click Element        xpath=//a[contains(.,'Documentos do processo')]

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
    Handle Alert    ACCEPT



    # Assinar documento
    # Então assino o documento
    Wait Until Element Is Visible    xpath=//a[contains(.,'Documentos do processo')]    timeout=30s
    Click Element        xpath=//a[contains(.,'Documentos do processo')]

    Wait Until Element Is Visible    //table[@id="ctl00_conteudoPagina_objListagemDeDocumentos_dtgPesquisaNovo"]//tr[td/a[text()='Termo de Referência']]//td[10]//input    timeout=30s
    Select Checkbox     //table[@id="ctl00_conteudoPagina_objListagemDeDocumentos_dtgPesquisaNovo"]//tr[td/a[text()='Termo de Referência']]//td[10]//input

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
    Sleep    2


    # Encaminhar SC para precificação
    # Então encaminho a Solicitação de compra para precificação
    Sleep    4
    Wait Until Element Is Visible    xpath=//input[@value = "Encaminhar"]    timeout=30s
    Click Element    xpath=//input[@value = "Encaminhar"]

    Wait Until Element Is Visible    xpath=//a[contains(.,'Sim')]    timeout=30s
    Capture Page Screenshot
    Click Element    xpath=//a[contains(.,'Sim')]
    Sleep    5
    


    # Planejamento com Solicitante
    # E acesso a Lista de SC em Precificação
    Switch Window    ${Janelas}[0]
    Select Frame    //frame[contains(@name,'main')]
    Select Frame    xpath=//iframe[contains(@name,'frmConteudo')]

   # Clicar no campo Exibir
   Wait Until Element Is Visible    xpath=//select[@id= "ctl00_ddlVisoes"]    timeout=30s
   Click Element    xpath=//select[@id= "ctl00_ddlVisoes"]

   # Clicar na seleção 'SC em precificação'
   Click Element    xpath=//select[@id= "ctl00_ddlVisoes"]//*[@value='31069']

   # Clique no botão Pesquisar
   Wait Until Element Is Visible    xpath=//input[@value= "Pesquisar"]    timeout=30s
   Click Element    xpath=//input[@value= "Pesquisar"]
   Capture Page Screenshot




#     #Então faço planejamento da SC para Pregão Eletronico
#     ${start_time}    Get Time    epoch
#     FOR    ${i}    IN RANGE    ${timeout}
#         ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${RESUMO_SC}']]//td[9]//input
#         Run Keyword If    ${element_found}    Click Element    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${RESUMO_SC}']]//td[9]//input
#         Run Keyword If    ${element_found}    Exit For Loop
        
#         Execute JavaScript    window.location.reload()
#         Sleep    ${interval} sec

#         ${current_time}=    Get Time    epoch
#         ${elapsed_time}=    Evaluate    ${current_time} - ${start_time}
#         Run Keyword If    ${elapsed_time} > ${timeout}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
#     END
#     Run Keyword If    not ${element_found}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.



#    # Clique no botão Encaminhar
#    Wait Until Element Is Visible    xpath=//a[contains(.,'Encaminhar')]    timeout=30s
#    Click Element    xpath=//a[contains(.,'Encaminhar')]


#     ${all_windows}=    Get Window Handles
#     ${second_window}=    Set Variable    ${all_windows}[0]

#     Switch Window    ${all_windows}[0]

#     Select Frame    //frame[contains(@name,'main')]


#     # Seleção Modalidade pregão eletronico
#     Wait Until Element Is Visible    //form[1]/div[4]/table[1]/tbody[1]/tr[1]/td[2]/span[1]    timeout=30s
#     Click Element    //form[1]/div[4]/table[1]/tbody[1]/tr[1]/td[2]/span[1]
#     Sleep    1
#     Wait Until Element Is Visible    //li[contains(.,'Pregao Eletronico')]
#     Click Element    //li[contains(.,'Pregao Eletronico')]


#     # Seleção critério  - Pregão eletronico LEI FEDERAL 14.133/21
#     Wait Until Element Is Visible    //form[1]/div[4]/table[1]/tbody[1]/tr[3]/td[2]/span[1]/span[1]/span[1]    timeout=30s
#     Click Element    //form[1]/div[4]/table[1]/tbody[1]/tr[3]/td[2]/span[1]/span[1]/span[1]
#     Sleep    1
#     Wait Until Element Is Visible    //li[contains(.,'LICITAÇÃO NA MODALIDADE PREGÃO ELETRÔNICO - LEI FEDERAL 14.133/21 - DECRETO 54.142/22')]    timeout=30s
#     Click Element    //li[contains(.,'LICITAÇÃO NA MODALIDADE PREGÃO ELETRÔNICO - LEI FEDERAL 14.133/21 - DECRETO 54.142/22')]
#     Sleep    1
#     Capture Page Screenshot

#     # Clique no botão 'Salvar e Fechar'
#     Wait Until Element Is Visible    //input[contains(@value,'Salvar e fechar')]
#     Click Element    //input[contains(@value,'Salvar e fechar')]
#     Sleep    2
#     Capture Page Screenshot
#     Sleep    2

    
#     # Clique no botão de confirmação
#     Wait Until Element Is Visible    //a[contains(.,'Sim')]    timeout=30s
#     Click Element    //a[contains(.,'Sim')]
#     Sleep    2
#     Capture Page Screenshot
#     Sleep    1

#     # Campo justificativa
#     # Switch Window
#     Wait Until Element Is Visible    //textarea[contains(@name,'txtJustificativa')]    timeout=30s
#     Input Text    //textarea[contains(@name,'txtJustificativa')]    Justificativa
#     Capture Page Screenshot


#     # Clique no botão confirmar justificativa
#     Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    timeout=30s
#     Click Element    //a[contains(.,'Confirmar')]
#     Sleep    4
#     Capture Page Screenshot
#     Sleep    1
#     SeleniumLibrary.Close Browser




    # Então faço planejamento da SC para compra Direta - Dispensa Emergencial - Solicitante
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



CT07 - Definir Natureza de despesa com o Financeiro
    Configurar Variáveis de SC

    [Tags]    definir_natureza
    # Dado que acesso o sistema
    Dado que acesso o sistema no honologue 03
    E faço login com usuário "financeiro.110402"
    E acesso a Tela de Lista de Solicitação de Compras
    Então defino a natureza de despesa


CT08 - Aprovação orçamentária
    Configurar Variáveis de SC

    [Tags]    aprovacao_orcamentaria
    # Dado que acesso o sistema
    Dado que acesso o sistema no honologue 03
    E faço login com usuário "orcamento.110402"
    E acesso Minhas tarefas
    E seleciono a SC para aprovação
    Então Clique no botão Aprovar com orçamento
    

CT09 - Aprovação com o Ordenador
    Configurar Variáveis de SC

    [Tags]    aprovacao_ordenador
    # Dado que acesso o sistema
    Dado que acesso o sistema no honologue 03
    E faço login com usuário "ordenador.110402"
    E acesso Minhas tarefas
    E seleciono a SC para aprovação
    E Clico em Ciente
    Então Clique no botão Aprovar com ordenador


CT10 - Liberar SC com autoridade central
    Configurar Variáveis de SC

    [Tags]    liberacao_autoridade
    # Dado que acesso o sistema
    Dado que acesso o sistema no honologue 03
    E faço login com usuário "autoridadecentral"
    E acesso a lista de SC centralizada
    E pesquiso por SC aguardando liberação
    Então seleciono a SC e aprovo


CT11 - Deliberar SC com autoridade da UG
    Configurar Variáveis de SC

    [Tags]    deliberar_autoridade_ug
    # Dado que acesso o sistema
    Dado que acesso o sistema no honologue 03
    E faço login com usuário "autoridade.110402"
    E acesso a Tela de Lista de Solicitação de Compras
    E pesquiso por SC aguardando deliberação
    # E seleciono a SC da lista
    E clico na SC da lista no Homol03
    Então faço a deliberação da SC


CT12 - Planejamento com Ordenador
    Configurar Variáveis de SC

    [Tags]    planejar_ordenador
    # Dado que acesso o sistema
    Dado que acesso o sistema no honologue 03
    E faço login com usuário "ordenador.110402"
    E acesso a lista de Planejamento de Compras
    E seleciono o filtro SC em Planejamento - Ordenador
    E seleciono a SC
    Então faço planejamento da SC para Pregão Eletronico


CT13 - Atribuir Comissão
    Configurar Variáveis de SC

    [Tags]    atribuir_comissao
    # Dado que acesso o sistema
    Dado que acesso o sistema no honologue 03
    E faço login com usuário "gestorlicitacaocentral.120101"
    E acesso a tela de Planejamento de compras
    E pesquiso por atribuir comissão com planejador
    E seleciono a SC para atribuir comissão com Planejador
    Então atribuo a Comissão Permanente de Licitação


CT14 - Aprovar SC com Pregoeiro Central
    Configurar Variáveis de SC
    
    [Tags]    aprovacao_pregoeiro_central
    Dado que acesso o sistema no honologue 03
    # Dado que acesso o sistema
    E faço login com usuário "pregoeiro.120101"
    E acesso Minhas tarefas
    E seleciono a SC para aprovação
    Então Clique no botão Aprovar com orçamento


















