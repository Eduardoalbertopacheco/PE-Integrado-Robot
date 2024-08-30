*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***



*** Keywords ***

KeyWord Exemplo

    ${timeout}=    Set Variable    150    
    ${interval}=   Set Variable    5     
    ${start_time}=    Get Time    epoch
    ${all_windows}=    Get Window Handles

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



    # ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${RESUMO_SC}']]//td[9]//input
    # WHILE    ${element_found} == False
    #     Execute JavaScript    window.location.reload()
    #     Sleep    5 sec
    #     ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${RESUMO_SC}']]//td[9]//input
    # END
    # Click Element    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${RESUMO_SC}']]//td[9]//input



   # Clique no botão Encaminhar
   Wait Until Element Is Visible    xpath=//a[contains(.,'Encaminhar')]    timeout=30s
   Click Element    xpath=//a[contains(.,'Encaminhar')]


    ${all_windows}=    Get Window Handles
    ${second_window}=    Set Variable    ${all_windows}[0]

    Switch Window    ${all_windows}[0]

    Select Frame    //frame[contains(@name,'main')]


    # Seleção Modalidade Dispensa 
    Wait Until Element Is Visible    //form[1]/div[4]/table[1]/tbody[1]/tr[1]/td[2]/span[1]/span[1]/span[1]    timeout=30s
    Click Element    //form[1]/div[4]/table[1]/tbody[1]/tr[1]/td[2]/span[1]/span[1]/span[1]
    Sleep    1
    Wait Until Element Is Visible    //li[text() = "Dispensa"]
    Click Element    //li[text() = "Dispensa"]


    # Seleção critério  - LEI 14.133/2021, ART. 75, VIII
    Wait Until Element Is Visible    //form[1]/div[4]/table[1]/tbody[1]/tr[3]/td[2]/span[1]/span[1]/span[1]    timeout=30s
    Click Element    //form[1]/div[4]/table[1]/tbody[1]/tr[3]/td[2]/span[1]/span[1]/span[1]
    Sleep    1
    Wait Until Element Is Visible    //li[text() = "LEI 14.133/2021, ART. 75, VIII - DISPENSA POR EMERGÊNCIA OU DE CALAMIDADE PÚBLICA"]    timeout=30s
    Click Element    //li[text() = "LEI 14.133/2021, ART. 75, VIII - DISPENSA POR EMERGÊNCIA OU DE CALAMIDADE PÚBLICA"]
    Sleep    1
    Capture Page Screenshot

    # Clique no botão 'Salvar e Fechar'
    Wait Until Element Is Visible    //input[contains(@value,'Salvar e fechar')]
    Click Element    //input[contains(@value,'Salvar e fechar')]
    Sleep    2
    Capture Page Screenshot
    Sleep    2

    
    # Clique no botão de confirmação
    Wait Until Element Is Visible    //a[contains(.,'Sim')]    timeout=30s
    Click Element    //a[contains(.,'Sim')]
    Sleep    2
    Capture Page Screenshot
    Sleep    1

    # Campo justificativa
    # Switch Window
    Wait Until Element Is Visible    //textarea[contains(@name,'txtJustificativa')]    timeout=30s
    Input Text    //textarea[contains(@name,'txtJustificativa')]    Justificativa
    Capture Page Screenshot


    # Clique no botão confirmar justificativa
    Wait Until Element Is Visible    //a[contains(.,'Confirmar')]    timeout=30s
    Click Element    //a[contains(.,'Confirmar')]
    Sleep    4
    Capture Page Screenshot
    Sleep    1
    SeleniumLibrary.Close Browser


 