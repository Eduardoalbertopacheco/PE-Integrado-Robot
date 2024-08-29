*** Settings ***
Library    String

*** Variables ***
${RESUMO_SC}=       None
${OBJETO_PREGAO}    None

# ${RESUMO_SC}        SC_Item_Pregao
# ${OBJETO_PREGAO}    Pregão-Aberto - Lote - 27/08
${OBJETO_COMPRA}    Compra Direta - Lote - INEX 28/08
${OBJETO_ATA}       Pregão-Aberto - Lote - OPD 26/08
${OBJETO_IRP}       Teste IRP

*** Keywords ***

Configurar Variáveis de SC
    ${filename_full_path}=    Set Variable    ${SUITE_SOURCE}
    ${filename}=    Split String    ${filename_full_path}    ${/}
    ${filename}=    Set Variable    ${filename}[-1] 
    ${RESUMO_SC}=    Replace String    ${filename}    .robot    ${EMPTY}
    Set Global Variable    ${RESUMO_SC}


Configurar Variáveis de Pregão
    ${filename_full_path}=    Set Variable    ${SUITE_SOURCE}
    ${filename}=    Split String    ${filename_full_path}    ${/}
    ${filename}=    Set Variable    ${filename}[-1] 
    ${OBJETO_PREGAO}=    Replace String    ${filename}    .robot    ${EMPTY}
    Set Global Variable    ${OBJETO_PREGAO}
