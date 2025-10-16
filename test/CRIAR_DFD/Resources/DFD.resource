*** Settings ***
Documentation    
Library          SeleniumLibrary
Library          OperatingSystem
Library          DateTime
Library          Collections

*** Variables ***
${TIMEOUT}    30s
${DATA}       02/01/2025
${Descricao}  Teste Automatizado 07


*** Keywords ***
E seleciona o filtro para todos documentos 
    Capture Page Screenshot
    Select Frame                       xpath=//iframe[contains(@name,'frmConteudo')]    

    # Clicar no campo Exibir
    Wait Until Element Is Visible      xpath=(//span[@unselectable='on'][contains(.,'Selecione')])[15]    timeout=${TIMEOUT}
    Click Element                      xpath=(//span[@unselectable='on'][contains(.,'Selecione')])[15]

    Sleep    2
   # Clicar na seleção 'Todos os documentos de formalização de demanda'
    Click Element                      xpath=//li[contains(.,'Todos os documentos de formalização de demanda')]
    
    Sleep    2

    Wait Until Element Is Visible      xpath=//a[contains(@id,'ctl00_Pesquisar')]   timeout=${TIMEOUT}
    Click Element                      xpath=//a[contains(@id,'ctl00_Pesquisar')]

E clica em criar DFD
    Click Element                      css=a[onclick="Incluir()"]
    Capture Page Screenshot

Então cria DFD 
    ${all_windows}=                    Get Window Handles
    Sleep   5     
    Capture Page Screenshot  
    
    Switch Window  
    Select Frame                       xpath=//frame[contains(@name,'main')]
    Wait Until Element Is Visible      css=textarea[id="ctl00_ContentPrincipal_txtJustificativaNecessidadeContratacao"] 
    Input Text                         css=textarea[id="ctl00_ContentPrincipal_txtJustificativaNecessidadeContratacao"]           DFD Teste Automatizado

    Sleep    2

    Wait Until Element Is Visible      xpath=(//span[@unselectable='on'][contains(.,'Selecione')])[3]
    Click Element                      xpath=(//span[@unselectable='on'][contains(.,'Selecione')])[3]

    Sleep    2

    Wait Until Element Is Visible      xpath=//li[@tabindex='-1'][contains(.,'Original')]
    Click Element                      xpath=//li[@tabindex='-1'][contains(.,'Original')] 

    Sleep    2

    Wait Until Element Is Visible      xpath=(//span[contains(.,'Selecione')])[3]   
    Click Element                      xpath=(//span[contains(.,'Selecione')])[3]  

    Sleep    2

    Wait Until Element Is Visible      xpath=//li[@tabindex='-1'][contains(.,'2025')]   
    Click Element                      xpath=//li[@tabindex='-1'][contains(.,'2025')]

    Sleep    1

    Wait Until Element Is Visible     css=input[id="ctl00_ContentPrincipal_tDtPretendidaContratacao"]    timeout=${TIMEOUT}
    # Define o valor do campo de entrada usando JavaScript
    Execute JavaScript    document.querySelector('input[id="ctl00_ContentPrincipal_tDtPretendidaContratacao"]').value = '${DATA}';
    # Verifica se o valor foi inserido corretamente
    ${valor}    Get Value              css=input[id="ctl00_ContentPrincipal_tDtPretendidaContratacao"]
    Should Be Equal As Strings         ${valor}    ${DATA}

    Sleep    2
    
    Wait Until Element Is Visible      xpath=(//span[@unselectable='on'][contains(.,'Selecione')])[3]
    Click Element                      xpath=(//span[@unselectable='on'][contains(.,'Selecione')])[3]

    Sleep    2

    Wait Until Element Is Visible      xpath=//li[@tabindex='-1'][contains(.,'Nova Contratação')][1]
    Click Element                      xpath=//li[@tabindex='-1'][contains(.,'Nova Contratação')][1]

    Sleep    2

    Wait Until Element Is Visible      xpath=(//span[@unselectable='on'][contains(.,'Selecione')])[3]
    Click Element                      xpath=(//span[@unselectable='on'][contains(.,'Selecione')])[3]

    Sleep    2 
    
    Wait Until Element Is Visible      xpath=//li[@tabindex='-1'][contains(.,'Alta')]
    Click Element                      xpath=//li[@tabindex='-1'][contains(.,'Alta')]

    Sleep    2

    Input Text                         css=textarea[name="ctl00$ContentPrincipal$txtGrauPrioridadeAlta"]        DFD Teste Automatizado

    Sleep    2

    Input Text                         css=input[id="ctl00_ContentPrincipal_autTipoObjeto"]           ANIMAIS VIVOS
    Sleep    2
    Click Element                      xpath=//li[contains(.,'ANIMAIS VIVOS')]

    Sleep    2

    Input Text                         css=textarea[name="ctl00$ContentPrincipal$txtDescricaoSucinta"]            ${Descricao}

    # Rolar a página para baixo
    Execute JavaScript                 window.scrollTo(0, document.body.scrollHeight);

    Wait Until Element Is Visible      xpath=(//span[@unselectable='on'][contains(.,'Selecione')])[3]
    Click Element                      xpath=(//span[@unselectable='on'][contains(.,'Selecione')])[3]

    Sleep    1

    Wait Until Element Is Visible      xpath=//li[@tabindex='-1'][contains(.,'Convênios')]
    Execute JavaScript                 document.evaluate("//li[@tabindex='-1'][contains(.,'Convênios')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    
    Sleep    1

    Wait Until Element Is Visible      css=a[id="ctl00_ContentButtom_btnSalvarDadosGerais"]
    Click Element                      css=a[id="ctl00_ContentButtom_btnSalvarDadosGerais"]

    Sleep    3
    Capture Page Screenshot
    #Aba Dados orçamentários

    Wait Until Element Is Visible      xpath=//span[@class='k-link'][contains(.,'Dados orçamentários')]
    Click Element                      xpath=//span[@class='k-link'][contains(.,'Dados orçamentários')]

    Sleep    2

    Select Checkbox                    css=input[id="cCusteio"]
    Checkbox Should Be Selected        css=input[id="cCusteio"]    

    Select Checkbox                    css=input[id="cInvestimento"]
    Checkbox Should Be Selected        css=input[id="cInvestimento"]     
    
    Wait Until Element Is Visible      css=a[onclick="AbrirJanelaFonteRecursos();"]
    Click Element                      css=a[onclick="AbrirJanelaFonteRecursos();"]

    Switch Window 
    Select Frame                       xpath=//frame[contains(@name,'main')]
    Sleep    2

    Select Checkbox                    css=input[value="1|RECURSOS NÃO VINCULADOS DE IMPOSTOS|500"]
    Checkbox Should Be Selected        css=input[value="1|RECURSOS NÃO VINCULADOS DE IMPOSTOS|500"]  
    
    Wait Until Element Is Visible      xpath=//a[contains(@onclick,'ConfirmarFonteRecurso()')]
    Click Element                      xpath=//a[contains(@onclick,'ConfirmarFonteRecurso()')]
    
    Sleep    2

    
    Wait Until Element Is Visible      css=a[onclick="AbrirJanelaDespesaGerencial();"]
    Click Element                      css=a[onclick="AbrirJanelaDespesaGerencial();"]

    Switch Window 
    Select Frame                       xpath=//frame[contains(@name,'main')]
    Sleep    2

    Select Checkbox                    css=input[value="4|CUSTEIO - COTA GLOBAL"]
    Checkbox Should Be Selected        css=input[value="4|CUSTEIO - COTA GLOBAL"]  
    
    Wait Until Element Is Visible      xpath=//a[contains(@onclick,'ConfirmarDespesaGerencial()')]
    Click Element                      xpath=//a[contains(@onclick,'ConfirmarDespesaGerencial()')]
    
    Sleep    2

    Wait Until Element Is Visible      css=a[onclick="AbrirJanelaAcaoOrcamentaria();"]
    Click Element                      css=a[onclick="AbrirJanelaAcaoOrcamentaria();"]
    
    Capture Page Screenshot
    Switch Window 
    Select Frame                       xpath=//frame[contains(@name,'main')]
    Sleep    2

    Select Checkbox                    css=input[value="1|PROMOÇÃO DA DEFESA AGROPECUÁRIA|4041"]
    Checkbox Should Be Selected        css=input[value="1|PROMOÇÃO DA DEFESA AGROPECUÁRIA|4041"]  
    
    Wait Until Element Is Visible      xpath=//a[contains(@onclick,'ConfirmarAcaoOrcamentaria()')]
    Click Element                      xpath=//a[contains(@onclick,'ConfirmarAcaoOrcamentaria()')]
    
    Sleep    3

    Wait Until Element Is Visible      css=a[onclick="AbrirJanelaSubacao();"]
    Click Element                      css=a[onclick="AbrirJanelaSubacao();"]

    Switch Window 
    Select Frame                       xpath=//frame[contains(@name,'main')]
    Sleep    3

    Select Checkbox                    css=input[value="5|DEFESA ANIMAL|2593"]
    Checkbox Should Be Selected        css=input[value="5|DEFESA ANIMAL|2593"]  
    
    Wait Until Element Is Visible      css=a[id="ctl00_ContentButtom_btnConfirmar"]
    Click Element                      css=a[id="ctl00_ContentButtom_btnConfirmar"]
    
    Sleep    3

    Wait Until Element Is Visible      css=a[onclick="SalvarDadosOrcamentarios();"]
    Click Element                      css=a[onclick="SalvarDadosOrcamentarios();"]

    Sleep   6
    Capture Page Screenshot
    #Aba Materiais/Serviços

    Wait Until Element Is Visible      xpath=//span[@class='k-link'][contains(.,'Materiais/Serviços')]
    Click Element                      xpath=//span[@class='k-link'][contains(.,'Materiais/Serviços')]
    
    Sleep    2

    Wait Until Element Is Visible      css=a[onclick="IncluirMaterialServico()"]
    Click Element                      css=a[onclick="IncluirMaterialServico()"]
    
    Switch Window
    Select Frame                       xpath=//frame[contains(@name,'main')]
    Sleep    2

    Wait Until Element Is Visible      css=a[onclick="IncluirClasseGrid()"]
    Click Element                      css=a[onclick="IncluirClasseGrid()"]

    Sleep    2

    Wait Until Element Is Visible      xpath=(//span[contains(@class,'k-icon k-i-expand')])[1]
    Click Element                      xpath=(//span[contains(@class,'k-icon k-i-expand')])[1]

    Sleep    4

    Wait Until Element Is Visible      xpath=(//span[contains(@class,'k-icon k-i-expand')])[1]
    Click Element                      xpath=(//span[contains(@class,'k-icon k-i-expand')])[1]

    Sleep    4

    Wait Until Element Is Visible      css=a[data-text="M32434 - AERONAVE ANFIBIA"]
    Click Element                      css=a[data-text="M32434 - AERONAVE ANFIBIA"]

    Sleep    3

    Wait Until Element Is Visible      css=a[onclick="ConfirmarProduto()"]
    Click Element                      css=a[onclick="ConfirmarProduto()"]

    Sleep    5
    
    # Aguarda até que o campo de entrada esteja visível
    Wait Until Element Is Visible      css=input[onchange="calcularValorTotal()"]    timeout=${TIMEOUT}
    # Define o valor do campo de entrada usando JavaScript
    Execute JavaScript    document.querySelector('input[onchange="calcularValorTotal()"]').value = '515.158.421.546,0000';

    Sleep    3

    Select Checkbox                    css=input[id="cKTodosMateriaisServicos"]
    Checkbox Should Be Selected        css=input[id="cKTodosMateriaisServicos"]

    Sleep    2

    Wait Until Element Is Visible      css=a[onclick="SalvarMateriaisServicos();"]
    Click Element                      css=a[onclick="SalvarMateriaisServicos();"]

    Sleep    5
    Capture Page Screenshot
    #Dados Gerais Parte 2. Encaminhando DFD para PCA

    Wait Until Element Is Visible      xpath=//span[contains(.,'Dados gerais')]
    Click Element                      xpath=//span[contains(.,'Dados gerais')]

    Sleep    3

    Wait Until Element Is Visible      css=a[onclick="EncaminharDFD();"]
    Click Element                      css=a[onclick="EncaminharDFD();"]

    Sleep    2

    Input Text                         css=input[id="ctl00_ContentPrincipal_autEmpresaGestora"]           SECRETARIA EXECUTIVA DE DEFESA CIVIL
    Sleep    3
    Click Element                      xpath=//li[@tabindex='-1'][contains(.,'SECRETARIA EXECUTIVA DE DEFESA CIVIL')]

    Sleep    2

    Input Text                         css=input[name="ctl00$ContentPrincipal$autSetor"]           SECRETARIA EXECUTIVA DE DEFESA CIVIL
    Sleep    3
    Click Element                      xpath=//li[@tabindex='-1'][contains(.,'[P]-SECRETARIA EXECUTIVA DE DEFESA CIVIL')]

    Sleep    3

    Wait Until Element Is Visible      xpath=(//span[@unselectable='on'][contains(.,'Selecione')])[3]
    Click Element                      xpath=(//span[@unselectable='on'][contains(.,'Selecione')])[3]

    Sleep    3

    Execute JavaScript    document.evaluate("(//li[contains(.,'Encaminhar para PCA')])", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();


    Sleep    2

    Input Text                         css=textarea[name="ctl00$ContentPrincipal$txtDespacho"]           Teste Automatizado 

    Sleep    2

    Wait Until Element Is Visible      css=a[onclick="Encaminhar()"]
    Click Element                      css=a[onclick="Encaminhar()"]

    Sleep    2

    Switch Window
    Select Frame                       xpath=//frame[contains(@name,'main')]
    Sleep    2

    Wait Until Element Is Visible      xpath=//a[@href='javascript:void(0);'][contains(@id,'mbxEncaminhar')][contains(.,'Sim')]
    Click Element                      xpath=//a[@href='javascript:void(0);'][contains(@id,'mbxEncaminhar')][contains(.,'Sim')]

    Sleep    5

    Wait Until Element Is Visible      xpath=//a[contains(@id,'ctl00_ContentButtom_btnFechar')]
    Click Element                      xpath=//a[contains(@id,'ctl00_ContentButtom_btnFechar')]
    
    Capture Page Screenshot
