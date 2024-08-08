*** Settings ***
Documentation    Fluxo feliz - Cadastro de Ata de Registro de Preço
Library          SeleniumLibrary
Library          DateTime
Library          Browser
Resource         ../../Ressource/Resource_Cadastro_pregão.robot
Resource         ../../Ressource/Resource_compra_direta.robot
Resource         ../../Ressource/Ressource_ARP.robot

# *** Variables ***

# ${OBJETO_ATA}              Ata Externa Teste Automatizado
# ${TITULO_ATA_EXTERNA}      Ata Externa Municipal Mod_Pregão


# ${CAMPO_TITULO}          //input[contains(@name,'tbxTitulo')]
# ${CAMPO_OBJETO}                //textarea[contains(@name,'txtObjeto')]
# ${LUPA_TIPO_OBJETO_ATA}        //a[@onclick='AbrirJanelaTipoObjetoCompra();']
# ${INPUT_TIPO_OBJETO_ATA}       //input[contains(@name,'tbxTipoObjetoCompra')]
# ${LUPA_GRUPO_COMPRA_ATA}       //a[@onclick='abrirJanelaGrupoCompras();']
# ${INPUT_PESQ_GRUPO_COMPRA}     //input[contains(@name,'ctl00$ContentPrincipal$tbxGrupoCompra')]
# ${LUPA_UG_DEMANDANTE_ATA}      //a[@onclick='abrirJanelaPesquisaUnidadeGestora();']
# ${INPUT_PESQ_UG_ATA}           //input[contains(@name,'ctl00$ContentPrincipal$txtNome')]
# ${LUPA_GESTOR_ATA}             //a[@onclick='abrirJanelaPesquisaOrgaoGestorAta();']
# ${INPUT_PESQ_GESTOR_ATA}       //input[contains(@name,'ctl00$ContentPrincipal$txtNome')]

*** Keywords ***
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
    Click Element    //input[@id='ctl00_ContentPrincipal_rbtEsferaAdministrativa_0']


E seleciono Esfera administrativa como Federal
    Switch Window
    Select Frame    //frame[@name='main']
    
    Wait Until Element Is Visible    //input[@id='ctl00_ContentPrincipal_rbtEsferaAdministrativa_0']    timeout=15s
    Click Element    //input[@id='ctl00_ContentPrincipal_rbtEsferaAdministrativa_2']


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


E preencho todos os Dados Gerais

    # Clique no listbox Município
    Click Element    //span[@aria-owns='ctl00_ContentPrincipal_ddlMunicipio_listbox']
    Sleep    1

    # Clique para selecinar Município TERESINA
    Wait Until Element Is Visible    //li[@tabindex='-1'][contains(.,'TERESINA')]    timeout=10s
    Click Element    //li[@tabindex='-1'][contains(.,'TERESINA')]
    Sleep    1

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
    Input Text    ${INPUT_PESQ_GRUPO_COMPRA}    SECRETARIA EXECUTIVA DE DEFESA CIVIL	
    Wait Until Element Is Visible    //a[contains(.,'Pesquisar')]   timeout=30s
    Click Element    //a[contains(.,'Pesquisar')] 


    Wait Until Element Is Visible    
    ...    //input[@value='46|Grupo de Compras Padrão - SECRETARIA EXECUTIVA DE DEFESA CIVIL']    timeout=30s
    Click Element    //input[@value='46|Grupo de Compras Padrão - SECRETARIA EXECUTIVA DE DEFESA CIVIL']
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
    ...    //input[@value='129744|GOVERNO DO PIAUÍ|0|0']    timeout=30s
    Click Element    //input[@value='129744|GOVERNO DO PIAUÍ|0|0']
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    2
    Capture Page Screenshot

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


Então incluo o documento na Ata
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

Então assino o documento da Ata
    Switch Window
    Select Frame    //frame[@name='main']

    Wait Until Element Is Visible    //li[contains(.,'Documentos do processo')]    timeout=30s
    Click Element        //li[contains(.,'Documentos do processo')]

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








*** Test Cases ***

Cenário 01 - Criar Ata Externa Municipal
    [Tags]    criar_ata_municipal
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de Atas de Registro de preços
    E clico em Incluir Ata
    E seleciono Esfera administrativa como Municipal
    # E seleciono Esfera administrativa como Estadual
    # E seleciono Esfera administrativa como Federal
    E preencho todos os Dados Gerais
    E configuro as datas de vigencia
    Então salvo a ARP
    E vejo a Auditoria da ARP


Cenário 02 - Incluir Documento
    [Tags]    incluir_documento
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata Externa da Lista
    Então incluo o documento na Ata
    E vejo a Auditoria da ARP


Cenário 03 - Assinar Documento
    [Tags]    assinar_documento
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata Externa da Lista
    Então assino o documento da Ata
    E vejo a Auditoria da ARP


Cenário 04 - Ativar ATA Externa
    [Tags]    ativar_ata
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de Atas de Registro de preços
    E seleciono a Ata Externa da Lista
    Então ativo a ARP
    # E vejo a Auditoria da ARP

Cenário 05 - Concluir Análise com Gestor Ata Central
    [Tags]    concluir_ata
    Dado que acesso o sistema
    E faço login com usuário "Gestoratacentral2.120101"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata Externa da Lista
    Então concluo a análise da Ata

Cenário 06 - Deliberar Ata
    [Tags]    deliberar_ata
    Dado que acesso o sistema
    E faço login com usuário "Gestoratacentral2.120101"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata Externa da Lista
    Então Delibero a Ata Externa