*** Settings ***
Documentation    Fluxo Feliz - Cadastro de Pregão Eletronico
# Library          SeleniumLibrary
# Library          Browser
# Library          DateTime
# Library          OperatingSystem
Resource        ../../../Resources/Resource_login.robot
Resource        ../../../Resources/Resource_cadastro_pregao.robot
     
*** Variables ***
${HOMOLOTREI}    http://www.treinapeintegrado.pe.gov.br/default.aspx

*** Keywords ***



*** Test Cases ***

CT01 - Criar Pregão - Aba Dados Gerais

    Configurar Variáveis de Pregão

Dado que acesso o sistema no PE Treinamento
    SeleniumLibrary.Open Browser    ${HOMOLOTREI}    browser=chrome
    Maximize Browser Window
    Capture Page Screenshot

    # E faço login com usuário "pregoeiro.120101"
    Input Text        css=input[placeholder='Login']    pregoeiro.120101
    Input Text        css=input[placeholder='Senha']    PE@123456
    Capture Page Screenshot
    Click Element     css=input[type='submit']
    Sleep    3
    Capture Page Screenshot


    # E acesso a tela de Licitações Eletrônicas
    Select Frame    ${FRAME_MAIN}
    Wait Until Element Is Visible    ${MENU_NEGOCIACAO}    timeout=30s
    Click Element    ${MENU_NEGOCIACAO}

    # mouse over em Licitações
    ${elemento}    Get WebElement    ${LICITACAO}
    Mouse Over    ${elemento}

    # Clique em Licitações eletronicas
    Wait Until Element Is Visible    ${LICITACOES_ELERONICAS}    timeout=30s
    Sleep    1
    Click Element    ${LICITACOES_ELERONICAS}
    Sleep    5
    Capture Page Screenshot


    # E clico em Incluir Processo
    Select Frame    //iframe[contains(@name,'frmConteudo')]
    Wait Until Element Is Visible    //a[contains(.,'Incluir processo')]    timeout=30s
    Click Element    //a[contains(.,'Incluir processo')]
    Switch Window    NEW
    Maximize Browser Window
    Sleep    1
   
    Wait Until Element Is Visible    ${MODALIDADE}    timeout=30s
    Click Element    ${MODALIDADE}
    Wait Until Element Is Visible    ${MODAL_PREGAO}    timeout=30s
    Capture Page Screenshot
    Click Element    ${MODAL_PREGAO}


    # E Seleciono o Critério de Pregão Eletrônico
    # Seleção do campo 'Critério'
    Wait Until Element Is Visible    ${CRITERIO}    timeout=30s
    Click Element    ${CRITERIO}
    Capture Page Screenshot
    Click Element    //li[contains(.,'LEI FEDERAL Nº 14.133/2021, ART. 28, INCISO I - PREGÃO ELETRÔNICO')]



    # E insiro as datas para agendamento
    # Data e hora de inicio das propostas
    Execute JavaScript    window.scrollTo(0, 0)

    # ${hora_atual+10min}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(minutes=10)).strftime('%d-%m-%Y %H:%M:%S')    datetime
    ${atual+2dias_8:00}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(days=2)).replace(hour=8, minute=0, second=0, microsecond=0).strftime('%d-%m-%Y %H:%M:%S')    datetime

    # Data e hora do fim das proposta
    # ${hora_atual+20min}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(minutes=20)).strftime('%d-%m-%Y %H:%M:%S')    datetime
    ${atual+3dias_8:00}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(days=3)).replace(hour=8, minute=0, second=0, microsecond=0).strftime('%d-%m-%Y %H:%M:%S')    datetime

    
    # Data e hora para inicio das disputas
    # ${hora_atual+25min}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(minutes=25)).strftime('%d-%m-%Y %H:%M:%S')    datetime
    ${atual+3dias_8:10}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(days=3)).replace(hour=8, minute=10, second=0, microsecond=0).strftime('%d-%m-%Y %H:%M:%S')    datetime

    # Data Inicial propostas
    Wait Until Element Is Visible    ${CAMPO_DT_INICIAL_PROP}    15
    Clear Element Text    ${CAMPO_DT_INICIAL_PROP}
    Input Text    ${CAMPO_DT_INICIAL_PROP}    ${atual+2dias_8:00}

    # Data final proposta
    Sleep    1
    Wait Until Element Is Visible    ${CAMPO_DT_FINAL_PROP}    15
    Clear Element Text    ${CAMPO_DT_FINAL_PROP}
    Input Text    ${CAMPO_DT_FINAL_PROP}    ${atual+3dias_8:00}
    Clear Element Text    ${CAMPO_DT_FINAL_PROP}
    Input Text    ${CAMPO_DT_FINAL_PROP}    ${atual+3dias_8:00}

    # Data Inicio disputa
    Sleep    1
    Wait Until Element Is Visible    ${CAMPO_DT_INCIAL_DISPUTA}    15
    Clear Element Text    ${CAMPO_DT_INCIAL_DISPUTA}
    Input Text    ${CAMPO_DT_INCIAL_DISPUTA}    ${atual+3dias_8:10}
    Capture Page Screenshot

    # E insiro a Comissão e Salvo
    Wait Until Element Is Visible    ${BTN_LUPA_COMISSAO}    15
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

    # E Seleciono o Modo de Disputa Aberto
    ${all_windows}=    Get Window Handles
    ${second_window}=    Set Variable    ${all_windows}[1]
    Switch Window    ${second_window}

    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

    Wait Until Element Is Visible    ${MODO_DISPUTA}    timeout=30s
    Click Element    ${MODO_DISPUTA}
    Capture Page Screenshot
    Click Element    ${MODO_DISPUTA_ABERTO}

    # Input do campo Prazo de habilitação
    Wait Until Element Is Visible    //input[contains(@class,'k-formatted-value k-input')]    timeout=30s
    Input Text    //input[contains(@class,'k-formatted-value k-input')]    3
    Capture Page Screenshot

    # Então preencho a Aba de Dados Gerais
    # Seleção para registro de preço 'SIM'
    Wait Until Element Is Visible    //input[@id= "_cP_PREGAO_x_nCdPregaoTipo_0"]
    Click Element    //input[@id= "_cP_PREGAO_x_nCdPregaoTipo_0"]

    # Seleção do campo 'Confição de pagamento'
    Click Element    ${CODICAO_PAGAMENTO}
    Wait Until Element Is Visible    ${COD_PAGAMENTO_AVISTA}    timeout=30s
    Capture Page Screenshot
    Click Element    ${COD_PAGAMENTO_AVISTA}

    # Seleção do campo 'Prazo de entrega'
    Click Element    ${PRAZO_ENTREGA}
    Wait Until Element Is Visible    ${PRAZO_ENTRG_10_DIAS}    timeout=30s
    Capture Page Screenshot
    Click Element    ${PRAZO_ENTRG_10_DIAS}

    Sleep    2
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

    Wait Until Element Is Visible    ${UTILIZA_VERBA_FEDERAL_VALUE_NAO}    timeout=30s
    Click Element    ${UTILIZA_VERBA_FEDERAL_VALUE_NAO}
    Capture Page Screenshot

    Wait Until Element Is Visible    ${CAMPO_OBJETO}    timeout=30s
    Input Text    ${CAMPO_OBJETO}    ${OBJETO_PREGAO}
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
    Handle Alert    ACCEPT
    Sleep    3

    # # Capturar o valor do campo depois que ele for preenchido
    # ${NUM_PROC_PREGAO}    SeleniumLibrary.Get Text    ${INPUT_NUM_PROC_PREGAO}

    # # Salvar o valor em um arquivo de texto
    # Create File    ${EXECDIR}/test/processos/num_proc_pregao.txt    ${NUM_PROC_PREGAO} 
    # Sleep    2

# CT02 - Incluir SC ao Pregão
    Configurar Variáveis de Pregão
    Usar SC_Lote_Pregao_aberto_EXE

    # Clique na aba Itens
    Wait Until Element Is Visible    //a[contains(.,'Itens')]    timeout=30s
    Click Element    //a[contains(.,'Itens')]

    ${Janelas}    Get Window Handles
    ${Janela02}    Set Variable    ${Janelas}[1]
    
    # E acesso a tela de 'Incluir Itens da Solicitação'
    # Clique de incluir na aba Itens
    Wait Until Element Is Visible     //a[contains(.,'Incluir')]    timeout=30s
    Click Element    //a[contains(.,'Incluir')]
    Sleep    2

    # Cliue no botão Incluir itens da Solicitacçao
    Wait Until Element Is Visible    //a[contains(.,'Incluir item(ns) da solicitação')]    timeout=30s
    Click Element    //a[contains(.,'Incluir item(ns) da solicitação')]
    Switch Window    NEW
    Sleep    1


    # Então incluo a SC Por Lote ao Pregão
    Wait Until Element Is Visible    ${CAMPO_EXIBIR_INCLUIR_ITEM_SC}    timeout=30s
    Sleep    1
    Click Element    ${CAMPO_EXIBIR_INCLUIR_ITEM_SC}
    Capture Page Screenshot
    Sleep    2

    # Clique no campo exibir
    Wait Until Element Is Visible    ${EXIBIR_INCLUIR_ITEM_SC_POR_LOTE}    timeout=30s
    Click Element    ${EXIBIR_INCLUIR_ITEM_SC_POR_LOTE}


    # Selecionar a SC para Incluir
    ${start_time}    Get Time    epoch 
    FOR    ${i}    IN RANGE    ${timeout}
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${RESUMO_SC}']]//td[5]//input
        Run Keyword If    ${element_found}    Click Element    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${RESUMO_SC}']]//td[5]//input
        Run Keyword If    ${element_found}    Exit For Loop
        
        Execute JavaScript    window.location.reload()
        Sleep    ${interval} sec

        ${current_time}=    Get Time    epoch
        ${elapsed_time}=    Evaluate    ${current_time} - ${start_time}
        Run Keyword If    ${elapsed_time} > ${timeout}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    END
    Run Keyword If    not ${element_found}    Fail    Não foi possível encontrar o elemento dentro do tempo limite.
    Capture Page Screenshot

    # Clique no botão de Incluir SC
    Click Element    //a[contains(.,'Incluir')]
    Sleep    3


# CT03 - Incluir Documento - Edital
    # E acesso a tela de 'Documentos do Processo'
    # Clique na aba documentos
    Switch Window    ${Janela02}
    Sleep    2
    Wait Until Element Is Visible    //a[contains(.,'Documentos do processo')]    timeout=30s
    Click Element    //a[contains(.,'Documentos do processo')]
    Sleep    1


    # Então incluo os Documentos do tipo Edital
    FOR    ${index}    IN RANGE    2
   
        # Clique do botão 'Escolher Arquivo'
        Wait Until Element Is Visible    //input[contains(@type,'file')]    timeout=30s
        Choose File    css=input[type="file"]    ${EXECDIR}\\test\\Fixtures\\Mod03-Locators.pdf

        # Switch Window
        Sleep    1

        # Clique e escrevo no campo 'Tipo do documento'
        Wait Until Element Is Visible    
        ...    css=input[id="ctl00_conteudoPagina_objListagemDeDocumentos_autoTipoDeDocumento"]    timeout=30s

        ${tipo_doc} =    Set Variable    Edital - PE
        ${li_doc} =    Set Variable    //li[text()="Edital - PE"]

        # Ajustar os localizadores e o tipo de documento para a segunda execução
        IF    ${index} == 1
            ${tipo_doc} =    Set Variable    Edital
            ${li_doc} =    Set Variable    //li[text()="Edital"]
        END

        Input Text    
        ...    css=input[id="ctl00_conteudoPagina_objListagemDeDocumentos_autoTipoDeDocumento"]
        ...    ${tipo_doc}
        Sleep    2
        Wait Until Element Is Visible    ${li_doc}    timeout=30s
        Click Element    ${li_doc}

        # Clique no botão 'Anexar' o arquivo
        Capture Page Screenshot
        Click Element    //input[@value='Anexar']
        Handle Alert    ACCEPT
    END


# CT04 - Assinar Documento
    # E seleciono assino o documento do tipo Edital
        FOR    ${index}    IN RANGE    2
        Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

        # Selecionar o documento do tipo Edital
        ${doc_locator} =    Set Variable    //table[@id="ctl00_conteudoPagina_objListagemDeDocumentos_dtgPesquisaNovo"]//tr[td/a[text()='Edital - PE']]//td[10]//input

        # Ajustar o localizador para a segunda execução
        IF    ${index} == 1
            ${doc_locator} =    Set Variable    //table[@id="ctl00_conteudoPagina_objListagemDeDocumentos_dtgPesquisaNovo"]//tr[td/a[text()='Edital']]//td[10]//input
        END

        Wait Until Element Is Visible    ${doc_locator}    timeout=30s
        Select Checkbox    ${doc_locator}

        # Clicar no botão 'Assinar Documento'
        Wait Until Element Is Visible    xpath=//a[contains(.,'Assinar documento')]    timeout=30s
        Click Element    xpath=//a[contains(.,'Assinar documento')]

        # Preencher os campos de assinatura
        Sleep    2
        Wait Until Element Is Visible    //span[text()="Assinatura Eletrônica"]    timeout=30s

        Wait Until Element Is Visible    css=input[id="ctl00_ContentPrincipal_tbxCargo"]    timeout=30s
        Input Text    css=input[id="ctl00_ContentPrincipal_tbxCargo"]    Teste

        Wait Until Element Is Visible    css=input[id="tbxSenhaAcesso"]    timeout=30s
        Input Text    css=input[id="tbxSenhaAcesso"]    PE@123456

        # Clicar no botão 'Assinar'
        Capture Page Screenshot
        Click Element    xpath=//a[text()='Assinar']
        Sleep    7
    END


# CT05 - Solicitar Parecer para Ordenador

    # E acesso a aba 'Dados Gerais'
    Wait Until Element Is Visible    //a[contains(.,'Dados gerais')]    10
    Click Element    //a[contains(.,'Dados gerais')]

    # E acesso a tela de Solicitar Parecer
    # Clique no botão 'Parecer'
    Wait Until Element Is Visible    //input[contains(@name,'btnParecer')]    timeout=30s
    Click Element    //input[contains(@name,'btnParecer')]

    ${all_windows}=    Get Window Handles
    ${janela_atual}=    Set Variable    ${all_windows}[0]
    Switch Window    ${janela_atual}

    Sleep    5
    Select Frame    ${FRAME_MAIN}
    Select Frame    ${FRAME_FRM_CONTEUDO}
    Select Frame    ${FRAME_PARECER}


    # E solicito o parecer para o Ordenador
    Wait Until Element Is Visible    //li[contains(@onclick,'OpenWindowUsuarioLookup()')]    15
    Click Element    //li[contains(@onclick,'OpenWindowUsuarioLookup()')]
    
    Sleep    2
    Wait Until Element Is Visible    //input[@id='tbxPesquisar']    15
    Input Text    //input[@id='tbxPesquisar']    Ordenador da UG 120101
    Sleep    2

    Click Element    //span[contains(@onclick,'Pesquisar();')]
    Sleep    2

    Wait Until Element Is Visible    //td[contains(.,'Ordenador da UG 120101 (SECRETARIA DE ADMINISTRAÇÃO)')]    15
    Sleep    1
    Click Element    //td[contains(.,'Ordenador da UG 120101 (SECRETARIA DE ADMINISTRAÇÃO)')]
    Sleep    2
    
    Wait Until Element Is Visible    //button[@type='button'][contains(.,'OK')]    15
    Click Element    //button[@type='button'][contains(.,'OK')]

    #Clique na seleção tipo do Parecer
    Log    Executando clique no dropdown
    Wait Until Element Is Visible  ${DROPDOWN_TPO_PARECER}    15
    Click Element  ${DROPDOWN_TPO_PARECER}

    ${ELEMENTOS}    Get WebElements    //ul[@id='nCdTipoParecerMap_listbox']
    ${ITEM_LIST_PARECER}    Set Variable    ${ELEMENTOS}[1]

    ${elementos}    Get WebElements    //li[@tabindex='-1'][contains(.,'Jurídico')]
    ${ITEM_PARECER}    Set Variable    ${elementos}[1]

    Sleep    1
    Wait Until Element Is Visible    ${ITEM_PARECER}    timeout=30s
    Capture Page Screenshot

    Sleep    2
    Click Element    ${ITEM_PARECER}
    Sleep    1

    Wait Until Element Is Visible    //input[@name='sDsTitulo']    timeout=30s
    Input Text    //input[@name='sDsTitulo']    ${TITULO_PARECER}

    Wait Until Element Is Visible    ${XPATH}    timeout=30s
    Input Text    ${XPATH}    Descrição parecer


    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Sleep    2

    Wait Until Element Is Visible    ${BTN_SALVAR}    timeout=30s
    Sleep    2
    Click Element    ${BTN_SALVAR}

    # Então encaminho o Parecer para o ordenador
    Wait Until Element Is Visible    //span[@name='btnEncaminharParecer']    timeout=30s
    Click Element    //span[@name='btnEncaminharParecer']


    Wait Until Element Is Visible    //button[contains(.,'Sim')]    timeout=30s
    Click Element    //button[contains(.,'Sim')]
    Sleep    3
    SeleniumLibrary.Close Browser



CT06 - Aprovar parecer Ordenador

    Configurar Variáveis de Pregão
    Dado que acesso o sistema no PE Treinamento
    E faço login com usuário "ordenador.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso a tela com filtro todas as Licitações
    E clico na licitação da lista
    E acesso a tela de Solicitar Parecer
    E seleciono o parecer
    Então finalizo o parecer


CT07 - Solicitar Autorização

    Configurar Variáveis de Pregão
    Usar SC_Lote_Pregao_aberto
    Dado que acesso o sistema no PE Treinamento
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E acesso a tela com filtro todas as Licitações
    E clico na licitação da lista
    E clico no botão solicitar autorização
    Então solicito autorização central


CT08 - Deliberar autorização

    Configurar Variáveis de Pregão
    Usar SC_Lote_Pregao_aberto
    Dado que acesso o sistema no PE Treinamento
    E faço login com usuário "autoridadecentral"
    E acesso a tela de Licitações Eletrônicas
    E acesso a tela com filtro todas as Licitações
    E clico na licitação Aguardando autorização da Lista
    E acesso a tela de Deliberar Autorização
    Então aprovo a autorização
    E mostro a auditoria


CT09 - Agendar Pregão eletrônico

    Configurar Variáveis de Pregão
    Usar SC_Lote_Pregao_aberto
    Dado que acesso o sistema no PE Treinamento
    E faço login com usuário "pregoeiro.120101"
    E acesso a tela de Licitações Eletrônicas
    E seleciono a licitação para agendamento
    Então faço o agendamento do pregão
    # E acesso a tela do agendamento
    # Então faço o reagendamento


# CT10 - Envio de propostas Fornecedor 01

#     Configurar Variáveis de Pregão
#     Usar SC_Lote_Pregao_aberto
#     Dado que acesso o sistema no PE Treinamento
#     E faço login com usuário "29219904403.256"
#     E acesso a tela de Licitações Eletrônicas
#     E seleciono todos os pregões
#     E seleciono a SC Em propotas da lista
#     E seleciono não para lei 123 e confirmo
#     E preencho os dados do lance por Lote
#     Então envio a proposta
    

# CT11 - Envio de propostas Fornecedor 02

#     Configurar Variáveis de Pregão
#     Usar SC_Lote_Pregao_aberto
#     Dado que acesso o sistema no PE Treinamento
#     E faço login com usuário "02355633000148"
#     E acesso a tela de Licitações Eletrônicas
#     E seleciono todos os pregões
#     E seleciono a licitação da lista
#     E seleciono não para lei 123 e confirmo
#     E preencho os dados do lance por Lote
#     Então envio a proposta


# CT12 - Prorrogar Pregão

#     Configurar Variáveis de Pregão
#     Usar SC_Lote_Pregao_aberto
#     Dado que acesso o sistema no PE Treinamento
#     E faço login com usuário "pregoeiro.120101"
#     E acesso a tela de Licitações Eletrônicas
#     E acesso todos as licitações da lista
#     E seleciono a licitação da lista
#     E clico em prorrogar pregão
#     E insiro as novas datas
#     Então faço o prorrogamento


# CT13 - Abertura das propostas

#     Configurar Variáveis de Pregão
#     Usar SC_Lote_Pregao_aberto
#     Dado que acesso o sistema no PE Treinamento
#     E faço login com usuário "pregoeiro.120101"
#     E acesso a tela de Licitações Eletrônicas
#     E acesso todos as licitações da lista
#     E seleciono a licitação em abertura de proposta da lista
#     Então abro as proposta


# CT14 - Iniciar disputa

#     Configurar Variáveis de Pregão
#     Usar SC_Lote_Pregao_aberto
#     Dado que acesso o sistema no PE Treinamento
#     E faço login com usuário "pregoeiro.120101"
#     E acesso a tela de Licitações Eletrônicas
#     E acesso todos as licitações da lista
#     E seleciono a licitação da lista
#     Então inicio a disputa


# CT15 - Abrir Itens/Lotes para disputa

#     Configurar Variáveis de Pregão
#     Usar SC_Lote_Pregao_aberto
#     Dado que acesso o sistema no PE Treinamento
#     E faço login com usuário "pregoeiro.120101"
#     E acesso a tela de Licitações Eletrônicas
#     E acesso todos as licitações da lista
#     E seleciono a licitação da lista
#     Então abros os Lotes


# CT16 - Enviar disputa Fornecedor 01

#     Configurar Variáveis de Pregão
#     Usar SC_Lote_Pregao_aberto
#     Dado que acesso o sistema no PE Treinamento
#     E faço login com usuário "29219904403.256"
#     E acesso a tela de Licitações Eletrônicas
#     E seleciono todos os pregões
#     E seleciono a licitação da lista
#     Então envio o lance


# CT17 - Enviar disputa Fornecedor 02

#     Configurar Variáveis de Pregão
#     Usar SC_Lote_Pregao_aberto
#     Dado que acesso o sistema no PE Treinamento
#     E faço login com usuário "02355633000148"
#     E acesso a tela de Licitações Eletrônicas
#     E seleciono todos os pregões
#     E seleciono a licitação da lista
#     Então envio o segundo lances


   



    
    
    



    





