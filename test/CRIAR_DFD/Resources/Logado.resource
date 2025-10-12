*** Settings ***
Documentation    
Library          SeleniumLibrary
Library          OperatingSystem
Library          DateTime
Library          Collections


*** Keywords ***
E acesso a Tela de Lista de DFDs
    Select Frame    xpath=//frame[contains(@name,'main')]

    # Clique em negociação
    Wait Until Element Is Visible    xpath=//div[@unselectable='on'][contains(.,'Negociação')]    timeout=30s
    Click Element    xpath=//div[@unselectable='on'][contains(.,'Plano de Contratações Anual')]

    Wait Until Element Is Visible    
    ...    xpath=//td[@class='label'][contains(.,'Lista de Documentos de Formalização de Demandas - DFDs')]    timeout=30s
    Click Element    
    ...    xpath=//td[@class='label'][contains(.,'Lista de Documentos de Formalização de Demandas - DFDs')]
    # Sleep    2
    Capture Page Screenshot
    
    Wait Until Element Is Visible    
     ...    xpath=//span[contains(.,'Lista de Documentos de Formalização de Demandas - DFDs')]    timeout=30s
    Sleep    1

E acesso a Tela de Lista de PCA
    Select Frame    xpath=//frame[contains(@name,'main')]

    # Clique em negociação
    Wait Until Element Is Visible    xpath=//div[@unselectable='on'][contains(.,'Plano de Contratações Anual')]    timeout=30s
    Click Element                    xpath=//div[@unselectable='on'][contains(.,'Plano de Contratações Anual')]

    Wait Until Element Is Visible    
    ...    xpath=//td[@class='label'][contains(.,'Lista de Planos de Contratações Anuais - PCA')]    timeout=30s
    Click Element    
    ...    xpath=//td[@class='label'][contains(.,'Lista de Planos de Contratações Anuais - PCA')]
    # Sleep    2
    Capture Page Screenshot

    Wait Until Element Is Visible    
     ...    xpath=//span[contains(.,'Lista de Planos de Contratações Anuais - PCA')]    timeout=30s
    Sleep    1
