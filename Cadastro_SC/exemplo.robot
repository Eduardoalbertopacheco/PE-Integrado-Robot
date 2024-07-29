*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

Resource    ../Cadastro_SC//Resource_Cadastro_SC.robot

*** Variables ***
${TIMEOUT}    180    # 3 minutos em segundos

*** Test Cases ***
Planejamento Da SC Para Compra Direta - Dispensa - Solicitante
    ${START_TIME}    Get Time    epoch
    ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${resumo_sc}']]//td[9]//input
    WHILE    ${element_found} == False
        ${current_time}    Get Time    epoch
        ${elapsed_time}    Evaluate    ${current_time} - ${START_TIME}
        Run Keyword If    ${elapsed_time} > ${TIMEOUT}    Exit For Loop
        Execute JavaScript    window.location.reload()
        Sleep    5 sec
        ${element_found} =    Run Keyword And Return Status    Element Should Be Visible    (//span[contains(.,'Selecione')])[3]
    END
    Click Element    //div[@id='ctl00_pesquisaDataGrid_dtgPesquisa_divScroll']//table//tr[td/a[text()='${resumo_sc}']]//td[9]//input
