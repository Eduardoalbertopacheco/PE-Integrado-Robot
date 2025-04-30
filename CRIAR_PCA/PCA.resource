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
${DFD}        DFD.227.DEF CIVIL/2024

*** Keywords ***

E clico em Elaborar PCA 
    Capture Page Screenshot
    Select Frame                       xpath=//iframe[contains(@name,'frmConteudo')] 
     
    Click Element                      css=a[onclick="Incluir()"] 
    
Então crio o PCA
    Capture Page Screenshot
    Switch Window
    Select Frame                       xpath=//frame[contains(@name,'main')]

    Wait Until Element Is Visible      xpath=(//span[@unselectable='on'][contains(.,'Selecione')])
    Click Element                      xpath=(//span[@unselectable='on'][contains(.,'Selecione')])

    Sleep    1

    Wait Until Element Is Visible      xpath=//li[@tabindex='-1'][contains(.,'Original')]
    Click Element                      xpath=//li[@tabindex='-1'][contains(.,'Original')]

    Sleep    1

    Input Text                         css=input[name="ctl00$ContentPrincipal$autDepartamento"]           SECRETARIA EXECUTIVA DE DEFESA CIVIL
    Sleep    3
    Click Element                      xpath=//li[@tabindex='-1'][contains(.,'[P]-SECRETARIA EXECUTIVA DE DEFESA CIVIL')]

    Sleep    1

    Wait Until Element Is Visible      css=#ctl00_ContentPrincipal_btnSalvar
    Click Element                      css=#ctl00_ContentPrincipal_btnSalvar

E clico em editar PCA
    Capture Page Screenshot
    Select Frame                       xpath=//iframe[contains(@name,'frmConteudo')] 
     
    Click Element                      css=a[onclick="AbrirCadastro('nCdPca=323'); return false;"] 

Então edita o PCA 
    Capture Page Screenshot
    Switch Window
    Select Frame                       xpath=//frame[contains(@name,'main')]

    #Aba DFDS
    Wait Until Element Is Visible      xpath=//span[@class='k-link'][contains(.,'DFDS')]
    Click Element                      xpath=//span[@class='k-link'][contains(.,'DFDS')]
    Sleep    2                                            

    Switch Window
    Capture Page Screenshot
    Select Frame                       xpath=//frame[contains(@name,'main')]
    Input Text                         css=input[name="ctl00$ContentPrincipal$autDfdDepartamentos"]           SECRETARIA EXECUTIVA DE DEFESA CIVIL
    Sleep    3
    Click Element                      xpath=//li[@tabindex='-1'][contains(.,'[P]-SECRETARIA EXECUTIVA DE DEFESA CIVIL')]
    
    Wait Until Element Is Visible      css=a[onclick="AbrirJanelaIncluirDfd()"]
    Click Element                      css=a[onclick="AbrirJanelaIncluirDfd()"]

    Sleep    2

    Switch Window
    Capture Page Screenshot
    Select Frame                       xpath=//frame[contains(@name,'main')]
    
    ${checkbox_xpath}=    Set Variable    //td[text()='${DFD}']/following-sibling::td//input[@type='checkbox']
    Wait Until Element Is Visible      xpath=${checkbox_xpath}
    Click Element                      xpath=${checkbox_xpath}  

    Sleep    2

    Wait Until Element Is Visible      css=a[onclick="IncluirDfd();"]
    Click Element                      css=a[onclick="IncluirDfd();"]

    Sleep    2

    Switch Window
    Select Frame                       xpath=//frame[contains(@name,'main')]

    Wait Until Element Is Visible      css=#ctl00_ContentButtom_btnSalvarDfd
    Click Element                      css=#ctl00_ContentButtom_btnSalvarDfd
    Capture Page Screenshot

Então encaminha o PCA  
    Switch Window
    Select Frame                       xpath=//frame[contains(@name,'main')]    
    Wait Until Element Is Visible      css=a[onclick="Encaminhar();"]
    Click Element                      css=a[onclick="Encaminhar();"]
    Capture Page Screenshot

    Sleep    1
    
    Switch Window
    Select Frame                       xpath=//frame[contains(@name,'main')]    
    Input Text                         css=input[name="ctl00$ContentPrincipal$autEmpresaGestora"]           SECRETARIA EXECUTIVA DE DEFESA CIVIL
    Sleep    3
    Click Element                      xpath=//li[@tabindex='-1'][contains(.,'SECRETARIA EXECUTIVA DE DEFESA CIVIL')]

    Sleep    2

    Input Text                         css=input[name="ctl00$ContentPrincipal$autSetor"]           SECRETARIA EXECUTIVA DE DEFESA CIVIL
    Sleep    3
    Click Element                      xpath=//li[@tabindex='-1'][contains(.,'[P]-SECRETARIA EXECUTIVA DE DEFESA CIVIL')]

    Sleep    2
    
    Wait Until Element Is Visible      xpath=(//span[@unselectable='on'][contains(.,'Selecione')])[3]
    Click Element                      xpath=(//span[@unselectable='on'][contains(.,'Selecione')])[3]
    
    Sleep    1

    Wait Until Element Is Visible      xpath=(//li[contains(.,'Encaminhar para aprovação da autoridade competente')])
    Click Element                      xpath=(//li[contains(.,'Encaminhar para aprovação da autoridade competente')])

    Sleep    2

    Input Text                         css=textarea[name="ctl00$ContentPrincipal$txtDespacho"]           Teste Automatizado
    
    Wait Until Element Is Visible      css=a[onclick="Encaminhar()"]
    Click Element                      css=a[onclick="Encaminhar()"]

    Switch Window
    Select Frame                       xpath=//frame[contains(@name,'main')]    
    Wait Until Element Is Visible      xpath=//a[contains(.,'Sim')]
    Click Element                      xpath=//a[contains(.,'Sim')]

Então delibera o PCA  
    Switch Window
    Select Frame                       xpath=//frame[contains(@name,'main')]    
    Wait Until Element Is Visible      css=a[onclick="Deliberar();"]
    Click Element                      css=a[onclick="Deliberar();"]
    Capture Page Screenshot

    Sleep    2

    Click Element                      css=input[id="ctl00_ContentPrincipal_aprovar"]
    
    Input Text                         css=textarea[name="ctl00$ContentPrincipal$txtJustificativa"]           Teste Automatizado
    
    Sleep    2

    Wait Until Element Is Visible      css=a[onclick="Confirmar()"]
    Click Element                      css=a[onclick="Confirmar()"]

    Capture Page Screenshot

    Sleep    2

    Switch Window
    Select Frame                       xpath=//frame[contains(@name,'main')]    
    Wait Until Element Is Visible      xpath=//a[contains(.,'Sim')]
    Click Element                      xpath=//a[contains(.,'Sim')]
    Capture Page Screenshot
    Sleep    2

E verifica a Auditoria
    Switch Window
    Select Frame                       xpath=//frame[contains(@name,'main')]    
    Wait Until Element Is Visible      xpath=//span[@class='k-link'][contains(.,'Auditoria')]
    Click Element                      xpath=//span[@class='k-link'][contains(.,'Auditoria')]
    Sleep    1
    Capture Page Screenshot
    Sleep    1

    Wait Until Element Is Visible      xpath=//span[@class='k-link'][contains(.,'Dados gerais')]
    Click Element                      xpath=//span[@class='k-link'][contains(.,'Dados gerais')]
    Sleep    1
