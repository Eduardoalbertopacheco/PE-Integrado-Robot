*** Settings ***
Documentation    Fluxo feliz - Cadastro de Ata de Registro de Preço
Library          SeleniumLibrary
Library          DateTime
Library          Browser
Library          OperatingSystem
Library          String

Resource        ../Compra_direta/Resource_compra_direta.resource


*** Variables ***

${VAR_FILE}    .variables.py

${SELECAO_MARCA_ATA}    //span[contains(@aria-owns,'ctl00_ContentPrincipal_ddlMarca_listbox')]
${ITEM}        ${ITEM_LIST}//li[text()="12V 3AH"]
${ITEM_LIST}       //ul[@id='ctl00_ContentPrincipal_ddlMarca_listbox']

${TITULO_ATA_EXTERNA}      Ata Externa Teste

${CAMPO_TITULO}          //input[contains(@name,'tbxTitulo')]
${CAMPO_OBJETO}                //textarea[contains(@name,'txtObjeto')]
${LUPA_TIPO_OBJETO_ATA}        //a[@onclick='AbrirJanelaTipoObjetoCompra();']
${INPUT_TIPO_OBJETO_ATA}       //input[contains(@name,'tbxTipoObjetoCompra')]
${LUPA_GRUPO_COMPRA_ATA}       //a[@onclick='abrirJanelaGrupoCompras();']
${INPUT_PESQ_GRUPO_COMPRA}     //input[contains(@name,'ctl00$ContentPrincipal$tbxGrupoCompra')]
${LUPA_UG_DEMANDANTE_ATA}      //a[@onclick='abrirJanelaPesquisaUnidadeGestora();']
${INPUT_PESQ_UG_ATA}           //input[contains(@name,'ctl00$ContentPrincipal$txtNome')]
${LUPA_GESTOR_ATA}             //a[@onclick='abrirJanelaPesquisaOrgaoGestorAta();']
${INPUT_PESQ_GESTOR_ATA}       //input[contains(@name,'ctl00$ContentPrincipal$txtNome')]


*** Keywords ***

Então gero a ARP
    Select Frame    //frame[contains(@name,'frmNegociacao')]
    Wait Until Element Is Visible    //a[@onclick='GerarARP();']    timeout=30s
    Click Element    //a[@onclick='GerarARP();']

    # Selecionar todos o itens
    Wait Until Element Is Visible    //input[contains(@title,'Selecionar todos')]    timeout=30s
    Click Element    //input[contains(@title,'Selecionar todos')]
    Capture Page Screenshot
    
    # Confirmar
    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    timeout=30s
    Click Element    //a[contains(.,'Confirmar')]

    
    Wait Until Element Is Visible    //a[contains(.,'Sim')]    timeout=30s
    Capture Page Screenshot
    Click Element    //a[contains(.,'Sim')]
    Sleep    4

    Click Element    //a[contains(.,'Fechar')]


E acesso a lista de Atas de Registro de preços
    Select Frame    //frame[@name='main']

    # Clique em ata de registro de preços
    Wait Until Element Is Visible    xpath=//div[@unselectable='on'][contains(.,'Ata de Registro de Preços')]    timeout=30s
    Click Element    xpath=//div[@unselectable='on'][contains(.,'Ata de Registro de Preços')]

    # mouse over em lista de Atas
    ${elemento}    Get WebElement    
    ...    xpath=//td[@class='label'][contains(.,'Lista de Atas de Registro de Preços')]
    Mouse Over    ${elemento}


    # Clique em todas as Atas
    Wait Until Element Is Visible    
    ...    xpath=//td[@class='label'][contains(.,'Todas as Atas de Registro de Preços')]    timeout=30s
    Click Element    
    ...    xpath=//td[@class='label'][contains(.,'Todas as Atas de Registro de Preços')]
    Sleep    2
    Capture Page Screenshot


E clico na Ata da Lista

    Select Frame    //iframe[@name='frmConteudo']
    Wait Until Element Is Visible    //table[@id = "dtgPesquisa"]//tbody//tr[td/a[text()='${OBJETO_COMPRA}']]//a    timeout=30s
    Click Element    //table[@id = "dtgPesquisa"]//tbody//tr[td/a[text()='${OBJETO_COMPRA}']]//a
    Sleep    2
    Capture Page Screenshot

E seleciono a Ata Externa da Lista

    Select Frame    //iframe[@name='frmConteudo']
    Wait Until Element Is Visible    //table[@id = "dtgPesquisa"]//tbody//tr[td/a[text()='${OBJETO_ATA}']]//td[11]//input    timeout=30s
    Click Element    //table[@id = "dtgPesquisa"]//tbody//tr[td/a[text()='${OBJETO_ATA}']]//td[11]//input
    Sleep    2
    Capture Page Screenshot


E seleciono a Ata da Lista

    Select Frame    //iframe[@name='frmConteudo']
    Wait Until Element Is Visible    //table[@id = "dtgPesquisa"]//tbody//tr[td/a[text()='${OBJETO_COMPRA}']]//td[11]//input    timeout=30s
    Click Element    //table[@id = "dtgPesquisa"]//tbody//tr[td/a[text()='${OBJETO_COMPRA}']]//td[11]//input
    Sleep    2
    Capture Page Screenshot


E configuro a Aba Dados Gerais
    ${all_windows}=    Get Window Handles
    ${second_window}=    Set Variable    ${all_windows}[0]
    Switch Window    ${all_windows}[0]

    Select Frame    //frame[@name='main']

    ${DATA_ATUAL}=    Evaluate    datetime.datetime.now().strftime('%d-%m-%Y')   datetime
    Log    ${DATA_ATUAL}

    ${ULTIMO_DIA_ANO}=    Evaluate    datetime.datetime(datetime.datetime.now().year, 12, 31).strftime('%d-%m-%Y')    datetime
    Log    ${ULTIMO_DIA_ANO}

    # Data inicio vigencia
    Wait Until Element Is Visible    //input[contains(@name,'tDtInicio')]    
    Input Text    //input[contains(@name,'tDtInicio')]    ${DATA_ATUAL}
    
    # Dara encerramento
    Wait Until Element Is Visible    //input[contains(@name,'tDtEncerramento')]
    Input Text    //input[contains(@name,'tDtEncerramento')]    ${ULTIMO_DIA_ANO}

    # Nr dias para aviso de encerramento
    Wait Until Element Is Visible    //fieldset[2]/table[1]/tbody[1]/tr[1]/td[3]/span[1]/span[1]/input[1]
    Input Text    //fieldset[2]/table[1]/tbody[1]/tr[1]/td[3]/span[1]/span[1]/input[1]    10
    Capture Page Screenshot


E incluo o Documento na ARP

    Wait Until Element Is Visible    //li[contains(.,'Documentos do processo')]    timeout=30s
    Click Element        //li[contains(.,'Documentos do processo')]

    Wait Until Element Is Visible    css=input[type="file"]    timeout=30s
    Choose File    css=input[type="file"]    C:\\Users\\Basis\\Downloads\\shareFile.pdf

    
    # Clique e escrevo no campo 'Tipo do documento'
    Wait Until Element Is Visible    
    ...    //input[@name='ctl00$ContentPrincipal$objListagemDeDocumentos$autoTipoDeDocumento']    timeout=30s
    Input Text    
    ...    //input[@name='ctl00$ContentPrincipal$objListagemDeDocumentos$autoTipoDeDocumento']
    ...    Ata de Registro
    Sleep    2
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Ata de Registro de Preços')]    timeout=30s
    Click Element    //li[@tabindex='-1'][contains(.,'Ata de Registro de Preços')]


    # Clique no botão 'Anexar' o arquivo
    Capture Page Screenshot
    Click Element    //input[@value='Anexar']
    Handle Alert    ACCEPT
    # SeleniumLibrary.Close Browser

    
E assino o documento na ARP

    # Selecionar o documento
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Wait Until Element Is Visible    //table[@id="ctl00_ContentPrincipal_objListagemDeDocumentos_dtgPesquisaNovo"]//tr[td/a[text()='Ata de Registro de Preços']]//td[10]//input    timeout=30s
    Select Checkbox     //table[@id="ctl00_ContentPrincipal_objListagemDeDocumentos_dtgPesquisaNovo"]//tr[td/a[text()='Ata de Registro de Preços']]//td[10]//input

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
    # SeleniumLibrary.Close Browser

Então salvo os dados
    Wait Until Element Is Visible    //span[contains(.,'Dados gerais')]
    Click Element    //span[contains(.,'Dados gerais')]
    Sleep    2

    Wait Until Element Is Visible    //a[contains(.,'Salvar e fechar')]
    Click Element    //a[contains(.,'Salvar e fechar')]
    Sleep    3

Então ativo a ARP

    Wait Until Element Is Visible    //a[contains(.,'Ativar')]
    Click Element    //a[contains(.,'Ativar')]
    Capture Page Screenshot
    

    # Clique para confirmar ativação da ata
    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    timeout=15s
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    2
    Capture Page Screenshot


E clico em Incluir Ata
    Select Frame    //iframe[@name='frmConteudo']
    Wait Until Element Is Visible    //a[contains(.,'Incluir')]    timeout=15s
    Click Element    //a[contains(.,'Incluir')]


E seleciono Esfera administrativa como Municipal
    Switch Window
    Select Frame    //frame[@name='main']
    
    Wait Until Element Is Visible    //input[@id='ctl00_ContentPrincipal_rbtEsferaAdministrativa_0']    timeout=15s
    Click Element    //input[@id='ctl00_ContentPrincipal_rbtEsferaAdministrativa_0']


E seleciono Esfera administrativa como Estadual
    Switch Window
    Select Frame    //frame[@name='main']
    
    Wait Until Element Is Visible    //input[@id='ctl00_ContentPrincipal_rbtEsferaAdministrativa_1']    timeout=15s
    Click Element    //input[@id='ctl00_ContentPrincipal_rbtEsferaAdministrativa_1']


E seleciono Esfera administrativa como Federal
    Switch Window
    Select Frame    //frame[@name='main']
    
    Wait Until Element Is Visible    //input[@id='ctl00_ContentPrincipal_rbtEsferaAdministrativa_0']    timeout=15s
    Click Element    //input[@id='ctl00_ContentPrincipal_rbtEsferaAdministrativa_2']

E seleciono o município

    # Clique no listbox Município
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlMunicipio_listbox']
    Sleep    1

    # Clique para selecinar Município TERESINA
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'TERESINA')]    timeout=10s
    Click Element    //li[@tabindex='-1'][contains(.,'TERESINA')]
    Sleep    1

E seleciono o Estado de origem
    
    # Clique no listbox Município
    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlEstado_listbox']    timeout=10s
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlEstado_listbox']
    Sleep    1

    # Clique para selecinar Estado de origem 'Pernambuco'
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Pernambuco')]    timeout=10s
    Click Element    //li[@tabindex='-1'][contains(.,'Pernambuco')]
    Sleep    1


E configuro as datas de vigencia

    ${DATA_ATUAL}=    Evaluate    datetime.datetime.now().strftime('%d/%m/%Y')   datetime
    Log    ${DATA_ATUAL}

    ${ULTIMO_DIA_ANO_ATUL}=    Evaluate    datetime.datetime(datetime.datetime.now().year, 12, 31).strftime('%d/%m/%Y')    datetime
    Log    ${ULTIMO_DIA_ANO_ATUL}




    # Data inicio vigencia
    Wait Until Element Is Visible    id=ctl00_ContentPrincipal_tDtInicio    timeout=30s
    Input Text    id=ctl00_ContentPrincipal_tDtInicio     ${DATA_ATUAL}
    Sleep    2
    Set Focus To Element    id=ctl00_ContentPrincipal_tDtInicio
    Execute JavaScript    document.getElementById("ctl00_ContentPrincipal_tDtInicio").value="${DATA_ATUAL}";
    Sleep    2
    Capture Page Screenshot



    # Dara encerramento
    Wait Until Element Is Visible    id=ctl00_ContentPrincipal_tDtEncerramento    timeout=30s
    Sleep    2
    Input Text    id=ctl00_ContentPrincipal_tDtEncerramento     ${ULTIMO_DIA_ANO_ATUL}
    Sleep    2
    Set Focus To Element    id=ctl00_ContentPrincipal_tDtEncerramento
    Execute JavaScript    document.getElementById("ctl00_ContentPrincipal_tDtEncerramento").value="${ULTIMO_DIA_ANO_ATUL}";
    Sleep    2
    Capture Page Screenshot


    # Nr dias para aviso de encerramento
    Wait Until Element Is Visible    //fieldset[2]/table[1]/tbody[1]/tr[1]/td[3]/span[1]/span[1]/input[1]
    Input Text    //fieldset[2]/table[1]/tbody[1]/tr[1]/td[3]/span[1]/span[1]/input[1]    10


E seleciono o Orgão Gestor ATA Municipal

   # Seleção Orgão Gestor ATA
    Wait Until Element Is Visible    ${LUPA_GESTOR_ATA}
    Click Element    ${LUPA_GESTOR_ATA}

    # Switch Window
    Wait Until Element Is Visible    //span[contains(.,'Selecionar Órgão Gestor da Ata')]   timeout=30s
    Wait Until Element Is Visible    ${INPUT_PESQ_UG_ATA}
    Input Text    ${INPUT_PESQ_UG_ATA}    GOVERNO DO PIAUÍ
    Wait Until Element Is Visible    //a[contains(.,'Pesquisar')]   timeout=30s
    Click Element    //a[contains(.,'Pesquisar')] 

    Wait Until Element Is Visible    
    ...    //input[contains(@value,'129744|GOVERNO DO PIAUÍ|0|0')]    timeout=30s
    Click Element    //input[contains(@value,'129744|GOVERNO DO PIAUÍ|0|0')]
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    2
    Capture Page Screenshot



E seleciono o Orgão Gestor ATA
   # Seleção Orgão Gestor ATA
    Wait Until Element Is Visible    ${LUPA_GESTOR_ATA}
    Click Element    ${LUPA_GESTOR_ATA}

    # Switch Window
    Wait Until Element Is Visible    //span[contains(.,'Selecionar Órgão Gestor da Ata')]   timeout=30s
    Wait Until Element Is Visible    ${INPUT_PESQ_UG_ATA}
    Input Text    ${INPUT_PESQ_UG_ATA}    FUND OSWALDO CRUZ - INST AGGEU MAGALHAES
    Wait Until Element Is Visible    //a[contains(.,'Pesquisar')]   timeout=30s
    Click Element    //a[contains(.,'Pesquisar')] 

    Wait Until Element Is Visible    
    ...    //input[@value='129779|FUND OSWALDO CRUZ - INST AGGEU MAGALHAES|0|null']    timeout=30s
    Click Element    //input[@value='129779|FUND OSWALDO CRUZ - INST AGGEU MAGALHAES|0|null']
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    2
    Capture Page Screenshot


E preencho todos os Dados Gerais

    # Ano
    Wait Until Element Is Visible    //fieldset[1]/table[1]/tbody[1]/tr[2]/td[6]/span[1]/span[1]/input[1]
    Sleep    2
    Input Text    //fieldset[1]/table[1]/tbody[1]/tr[2]/td[6]/span[1]/span[1]/input[1]    2024

    # Numero ATA
    Click Element    //input[@name='ctl00$ContentPrincipal$tbxNumero']
    Input Text    //input[@name='ctl00$ContentPrincipal$tbxNumero']    123456

    # Numero processo
    Click Element    //input[contains(@name,'tbxNumeroProcesso')]
    Input Text    //input[contains(@name,'tbxNumeroProcesso')]    654321


    # Clique no listbox Modalidade
    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlModalidade_listbox']    10s
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlModalidade_listbox']
    Sleep    1

    
    # Clique para selecinar Município Pregão eletronico
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Pregão eletrônico')]    timeout=10
    Click Element    //li[@tabindex='-1'][contains(.,'Pregão eletrônico')]

    
    Wait Until Element Is Visible    ${CAMPO_TITULO}    timeout=20s
    Input Text    ${CAMPO_TITULO}    ${TITULO_ATA_EXTERNA}

    
    Wait Until Element Is Visible    ${CAMPO_OBJETO}    timeout=20s
    Input Text    ${CAMPO_OBJETO}    ${OBJETO_ATA}


    # Seleção do Tipo de Objeto
    Click Element  ${LUPA_TIPO_OBJETO_ATA}
    Wait Until Element Is Visible    ${TITULO_TIPO_OBEJTO}    timeout=30s
    Wait Until Element Is Visible    ${INPUT_TIPO_OBJETO_ATA}    timeout=30s
    Input Text    ${INPUT_TIPO_OBJETO_ATA}    AQUISIÇÃO DE EQUIPAMENTOS EM GERAL
    Click Element    //a[contains(.,'Pesquisar')]
    Click Element    //input[@value='9|AQUISIÇÃO DE EQUIPAMENTOS EM GERAL']
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    2


    # Seleção do grupo de compras
    Wait Until Element Is Visible    ${LUPA_GRUPO_COMPRA_ATA}
    Click Element    ${LUPA_GRUPO_COMPRA_ATA}

    # Switch Window
    Wait Until Element Is Visible    //span[contains(.,'Selecionar grupo de compras')]   timeout=30s
    Wait Until Element Is Visible    ${INPUT_PESQ_GRUPO_COMPRA}
    Input Text    ${INPUT_PESQ_GRUPO_COMPRA}    SECRETARIA DE ADMINISTRAÇÃO	
    Wait Until Element Is Visible    //a[contains(.,'Pesquisar')]   timeout=30s
    Click Element    //a[contains(.,'Pesquisar')] 


    Wait Until Element Is Visible    
    ...    //input[@value='17|Grupo de Compras Padrão - SECRETARIA DE ADMINISTRAÇÃO']    timeout=30s
    Click Element    //input[@value='17|Grupo de Compras Padrão - SECRETARIA DE ADMINISTRAÇÃO']
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    2


    # Seleção UG Demandante
    Wait Until Element Is Visible    ${LUPA_UG_DEMANDANTE_ATA}
    Click Element    ${LUPA_UG_DEMANDANTE_ATA}

    # Switch Window
    Wait Until Element Is Visible    //span[contains(.,'Selecionar unidade gestora')]   timeout=30s
    Wait Until Element Is Visible    ${INPUT_PESQ_GESTOR_ATA}
    Input Text    ${INPUT_PESQ_UG_ATA}    SECRETARIA EXECUTIVA DE DEFESA CIVIL	
    Wait Until Element Is Visible    //a[contains(.,'Pesquisar')]   timeout=30s
    Click Element    //a[contains(.,'Pesquisar')] 

    Wait Until Element Is Visible    
    ...    //input[@value='20|SECRETARIA EXECUTIVA DE DEFESA CIVIL|null|0']    timeout=30s
    Click Element    //input[@value='20|SECRETARIA EXECUTIVA DE DEFESA CIVIL|null|0']
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    2


    # Permite adesão SIM
    Click Element    //input[@id='ctl00_ContentPrincipal_rbtPermiteAdesao_0']

    # Necessita parecer técnico: Não
    Click Element     //input[contains(@id,'ctl00_ContentPrincipal_rbtParecerTecnico_1')]


    # numero de máximo de aderentes
    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlNumMaximoPermitidoAderentes_listbox']    timeout=20
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlNumMaximoPermitidoAderentes_listbox']
    Sleep    2
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'2')]    timeout=15
    Sleep    2
    Click Element    //li[@tabindex='-1'][contains(.,'2')]


    # Número máximo permitido por item para cada adesão (%):
    Wait Until Element Is Visible    //fieldset[3]/table[1]/tbody[1]/tr[1]/td[2]/span[2]/span[1]/input[1]    10s
    Sleep    1
    Input Text    //fieldset[3]/table[1]/tbody[1]/tr[1]/td[2]/span[2]/span[1]/input[1]    50
    Sleep    1


    # Número de dias para não aceitar mais a adesão (0 a 30):
    Wait Until Element Is Visible    //fieldset[3]/table[1]/tbody[1]/tr[2]/td[2]/span[1]/span[1]/input[1]    timeout=10s
    Sleep    1
    Input Text    //fieldset[3]/table[1]/tbody[1]/tr[2]/td[2]/span[1]/span[1]/input[1]    30
    Capture Page Screenshot


Então salvo a ARP
    Wait Until Element Is Visible    //a[@onclick='SalvarARP(false);']   10s
    Click Element    //a[@onclick='SalvarARP(false);']
    Sleep    2
    Capture Page Screenshot


E vejo a Auditoria da ARP
    Sleep    2
    Wait Until Element Is Visible    //span[contains(.,'Auditoria')]    10s
    Click Element    //span[contains(.,'Auditoria')]
    Sleep    1
    Capture Page Screenshot
    SeleniumLibrary.Close Browser


E clico na Ata Externa da Lista

    Select Frame    //iframe[@name='frmConteudo']
    Wait Until Element Is Visible    //table[@id = "dtgPesquisa"]//tbody//tr[td/a[text()='${OBJETO_ATA}']]//td[2]//a    timeout=30s
    Click Element    //table[@id = "dtgPesquisa"]//tbody//tr[td/a[text()='${OBJETO_ATA}']]//td[2]//a
    Sleep    2
    Capture Page Screenshot


Então incluo e assino o documento na Ata
    Switch Window
    Select Frame    //frame[@name='main']

    Wait Until Element Is Visible    //li[contains(.,'Documentos do processo')]    timeout=30s
    Click Element        //li[contains(.,'Documentos do processo')]

    Wait Until Element Is Visible    css=input[type="file"]    timeout=30s
    Choose File    css=input[type="file"]    C:\\Users\\Basis\\Downloads\\shareFile.pdf

    
    # Clique e escrevo no campo 'Tipo do documento'
    Wait Until Element Is Visible    
    ...    //input[@name='ctl00$ContentPrincipal$objListagemDeDocumentos$autoTipoDeDocumento']    timeout=30s
    Input Text    
    ...    //input[@name='ctl00$ContentPrincipal$objListagemDeDocumentos$autoTipoDeDocumento']
    ...    Ata de Registro
    Sleep    2
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Ata de Registro de Preços')]    timeout=30s
    Click Element    //li[@tabindex='-1'][contains(.,'Ata de Registro de Preços')]


    # Clique no botão 'Anexar' o arquivo
    Capture Page Screenshot
    Click Element    //input[@value='Anexar']
    Handle Alert    ACCEPT
    # SeleniumLibrary.Close Browser

# Então assino o documento da Ata
#     Switch Window
#     Select Frame    //frame[@name='main']

#     Wait Until Element Is Visible    //li[contains(.,'Documentos do processo')]    timeout=30s
#     Click Element        //li[contains(.,'Documentos do processo')]

    # Selecionar o documento
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Wait Until Element Is Visible    //table[@id="ctl00_ContentPrincipal_objListagemDeDocumentos_dtgPesquisaNovo"]//tr[td/a[text()='Ata de Registro de Preços']]//td[10]//input    timeout=30s
    Select Checkbox     //table[@id="ctl00_ContentPrincipal_objListagemDeDocumentos_dtgPesquisaNovo"]//tr[td/a[text()='Ata de Registro de Preços']]//td[10]//input

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
    Capture Page Screenshot


Então concluo a análise da Ata

    Switch Window
    Select Frame    //frame[@name='main']

    Wait Until Element Is Visible    //a[contains(@onclick,'concluirAnalise();')]   10s
    Click Element    //a[contains(@onclick,'concluirAnalise();')]
    Sleep    2
    Capture Page Screenshot
    Sleep    2



Então Delibero a Ata Externa
    Switch Window
    Select Frame    //frame[@name='main']
    

    Wait Until Element Is Visible    //a[contains(@onclick,'Deliberar();')]    timeout=20s
    Click Element    //a[contains(@onclick,'Deliberar();')]

    
    Wait Until Element Is Visible    //input[@id='ctl00_ContentPrincipal_rbtResultadoAnalise_0']    timeout=20s
    Click Element    //input[@id='ctl00_ContentPrincipal_rbtResultadoAnalise_0']

    Wait Until Element Is Visible    //textarea[@name='ctl00$ContentPrincipal$txtJustificativa']    timeout=20s
    Input Text    //textarea[@name='ctl00$ContentPrincipal$txtJustificativa']    Deliberado Ok
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    timeout=10s
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    2
    Capture Page Screenshot


Então incluo os itens na ATA Externa

    # clique de itens
    Switch Window
    Select Frame    //frame[@name='main']
    Wait Until Element Is Visible    //span[@class='k-link'][contains(.,'Itens')]    timeout=10s
    Click Element    //span[@class='k-link'][contains(.,'Itens')]

    # Clique do popup de confirmação
    Wait Until Element Is Visible    //a[contains(.,'OK')]    timeout=20s
    Click Element    //a[contains(.,'OK')]

    # clique em Incluir
    Wait Until Element Is Visible    //a[contains(@onclick,'incluirItem()')]    timeout=30s
    Click Element    //a[contains(@onclick,'incluirItem()')]


    # clique da lupa descrição
    Wait Until Element Is Visible    //a[@onclick='AbrirJanelaPesquisarItem();']    timeout=30s
    Click Element    //a[@onclick='AbrirJanelaPesquisarItem();']
    

    # Pesquisar produto pelo código
    Wait Until Element Is Visible    //input[contains(@name,'txtCodigo')]    timeout=30s
    Input Text    //input[contains(@name,'txtCodigo')]    1000241

    Click Element    //a[@onclick='AtualizarPesquisaProduto()']


    # Clique para selecionar o item
    Wait Until Element Is Visible    //input[contains(@title,'Selecione')]    timeout=30s
    Click Element    //input[contains(@title,'Selecione')]

    Click Element    //a[contains(@onclick,'ConfirmarProduto()')]


    # Seleção und. medida
    Wait Until Element Is Visible    //span[@aria-owns='ctl00_ContentPrincipal_ddlUnidadeDeMedida_listbox']    timeout=30s
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlUnidadeDeMedida_listbox']
    Sleep    2

    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'BD 1 KG')]    timeout=30s
    Click Element    //li[@tabindex='-1'][contains(.,'BD 1 KG')]


    # Qauntidade registrada
    Wait Until Element Is Visible    //form[1]/div[4]/div[4]/div[2]/div[4]/span[1]/span[1]/span[1]/span[1]/span[1]    timeout=30s
    Sleep    2
    Double Click Element    //form[1]/div[4]/div[4]/div[2]/div[4]/span[1]/span[1]/span[1]/span[1]/span[1]
    Double Click Element    //form[1]/div[4]/div[4]/div[2]/div[4]/span[1]/span[1]/span[1]/span[1]/span[1]
    Double Click Element    //form[1]/div[4]/div[4]/div[2]/div[4]/span[1]/span[1]/span[1]/span[1]/span[1]
    Double Click Element    //form[1]/div[4]/div[4]/div[2]/div[4]/span[1]/span[1]/span[1]/span[1]/span[1]
    Double Click Element    //form[1]/div[4]/div[4]/div[2]/div[4]/span[1]/span[1]/span[1]/span[1]/span[1]

    # Seleção moeda
    Wait Until Element Is Visible    //span[contains(@aria-owns,'ctl00_ContentPrincipal_ddlMoeda_listbox')]    timeout=30s
    Click Element    //span[contains(@aria-owns,'ctl00_ContentPrincipal_ddlMoeda_listbox')]
    Sleep    2

    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'Real')]    timeout=30s
    Click Element    //li[@tabindex='-1'][contains(.,'Real')]


    # Valor unitário
    Wait Until Element Is Visible    //form[1]/div[4]/div[4]/div[4]/div[4]/span[1]/span[1]/span[1]/span[1]/span[1]
    Double Click Element    //form[1]/div[4]/div[4]/div[4]/div[4]/span[1]/span[1]/span[1]/span[1]/span[1]


    # Fornecedor
    Wait Until Element Is Visible    //a[contains(@onclick,'AbrirJanelaPesquisarFornecedor();')]
    Click Element    //a[contains(@onclick,'AbrirJanelaPesquisarFornecedor();')]


    # Seleção do fornecedor
    Wait Until Element Is Visible    //input[contains(@data-scdestado,'RR')]    timeout=30s
    Click Element    //input[contains(@data-scdestado,'RR')]

    Click Element    //a[contains(@onclick,'ConfirmarEmpresa()')]


    # Seleção Marca
    Wait Until Element Is Visible    ${SELECAO_MARCA_ATA}   timeout=30s
    Click Element    ${SELECAO_MARCA_ATA}
    Wait Until Element Is Visible    ${ITEM}    timeout=30s
    
    Click Element    ${ITEM}
    Sleep    2s
    Capture Page Screenshot

    Click Element    //a[contains(.,'Salvar e fechar')]
    Sleep    3


E solicito adesão
    Switch Window
    Select Frame    //frame[@name='main']

    Wait Until Element Is Visible    //a[@onclick='SolicitarConsumoAdesao();']    timeout=30s
    Click Element    //a[@onclick='SolicitarConsumoAdesao();']

E seleciono o grupo de compras

    # Seleção do grupo de compras
    Wait Until Element Is Visible    ${LUPA_GRUPO_COMPRA_ATA}
    Click Element    ${LUPA_GRUPO_COMPRA_ATA}

    # Switch Window
    Wait Until Element Is Visible    //span[contains(.,'Selecionar grupo de compras')]   timeout=30s
    Wait Until Element Is Visible    ${INPUT_PESQ_GRUPO_COMPRA}
    Input Text    ${INPUT_PESQ_GRUPO_COMPRA}    CIVIL	
    Wait Until Element Is Visible    //a[contains(.,'Pesquisar')]   timeout=30s
    Click Element    //a[contains(.,'Pesquisar')] 


    Wait Until Element Is Visible    
    ...    //input[contains(@value,'46|Grupo de Compras Padrão - SECRETARIA EXECUTIVA DE DEFESA CIVIL')]    timeout=30s
    Click Element    //input[contains(@value,'46|Grupo de Compras Padrão - SECRETARIA EXECUTIVA DE DEFESA CIVIL')]
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    2


E confirmo a solicitação de adesão
 
    Wait Until Element Is Visible    //a[@id="ctl00_ContentButtom_btnSalvar"]    timeout=30s
    Click Element    //a[@id="ctl00_ContentButtom_btnSalvar"]
    Sleep    3


E seleciono itens da ARP para Adesão
    Sleep    3

    # clique de itens
    Wait Until Element Is Visible    //span[@class='k-link'][contains(.,'Itens')]    timeout=15s
    Scroll Element Into View    //span[@class='k-link'][contains(.,'Itens')]
    Sleep    2

    
    ${elements}=  Get WebElements  //span[@class='k-link'][contains(.,'Itens')]
    Click Element  ${elements}[1]  # Índice começa em 0, então [1] é o segundo elemento
    Sleep    3
    Click Element  ${elements}[1]

    
    # clique de selecionar item
    Wait Until Element Is Visible    //a[@onclick='selecionarItem()'][contains(.,'Selecionar item')]    timeout=15s
    Click Element    //a[@onclick='selecionarItem()'][contains(.,'Selecionar item')]


    # clique para selecionar o item da lista
    Wait Until Element Is Visible    //input[@name='ckbSelecionarItemAta']    timeout=15s
    Click Element    //input[@name='ckbSelecionarItemAta']
    Capture Page Screenshot

    # clique para conformar
    Wait Until Element Is Visible    //a[contains(@onclick,'confirmar();')]
    Scroll Element Into View    //a[contains(@onclick,'confirmar();')]
    Click Element    //a[contains(@onclick,'confirmar();')]
    Sleep    3
    Capture Page Screenshot


    # Selecionar a Qtd Solicitada do item
    Wait Until Element Is Visible    //span[contains(@class,'k-icon k-i-arrow-n')]    timeout=15s
    Double Click Element    //span[contains(@class,'k-icon k-i-arrow-n')]
    Double Click Element    //span[contains(@class,'k-icon k-i-arrow-n')]

    Wait Until Element Is Visible    //a[@onclick='SalvarItem(this, false);'][contains(@id,'btnSalvar')][contains(.,'Salvar')]
    Click Element    //a[@onclick='SalvarItem(this, false);'][contains(@id,'btnSalvar')][contains(.,'Salvar')]
    Sleep    4


    # Alterar valor de referencia
    

    # # Localizar a barra de rolagem horizontal
    # ${scroll_bar}    Get WebElement    xpath=//div[@class='k-grid-content k-auto-scrollable']
    # # Obter a largura da barra de rolagem
    # ${width}    Execute JavaScript    return arguments[0].offsetWidth;    ${scroll_bar}
    # # Clicar e arrastar a barra de rolagem para a direita
    # Drag And Drop By Offset    ${scroll_bar}    ${width}    0


    Sleep    3
    Wait Until Element Is Visible    //img[@alt='Alterar valor de referência']    timeout=15s
    Click Element    //img[@alt='Alterar valor de referência']
    Click Element    //img[@alt='Alterar valor de referência']
    Sleep    3

    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

    Click Element    //input[contains(@value,'9783')]
    Click Element    //input[contains(@value,'9108')]
    Click Element    //input[contains(@value,'9998')]
    Capture Page Screenshot

    Wait Until Element Is Visible    //a[contains(@onclick,'SalvarAlteracaoValorReferencia()')]
    Click Element    //a[contains(@onclick,'SalvarAlteracaoValorReferencia()')]
    Sleep    3

    

