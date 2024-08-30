*** Settings ***
Library    String

*** Variables ***

${RESUMO_SC}        SC_I
${OBJETO_PREGAO}    None
${OBJETO_COMPRA}    None
${OBJETO_ATA}       Pregão-Aberto - Lote - OPD 26/08
${OBJETO_IRP}       Teste IRP


*** Keywords ***
Configurar Variáveis de SC
    ${nome_arquivo}=    Set Variable    ${SUITE_SOURCE}
    ${arquivo}=    Split String    ${nome_arquivo}    ${/}
    ${arquivo}=    Set Variable    ${arquivo}[-1] 
    ${RESUMO_SC}=    Replace String    ${arquivo}    .robot    ${EMPTY}
    Set Global Variable    ${RESUMO_SC}


Configurar Variáveis de Pregão
    ${nome_arquivo}=    Set Variable    ${SUITE_SOURCE}
    ${arquivo}=    Split String    ${nome_arquivo}    ${/}
    ${arquivo}=    Set Variable    ${arquivo}[-1] 
    ${OBJETO_PREGAO}=    Replace String    ${arquivo}    .robot    ${EMPTY}
    Set Global Variable    ${OBJETO_PREGAO}


Configurar Variáveis Compra Direta
    ${nome_arquivo}=    Set Variable    ${SUITE_SOURCE}
    ${arquivo}=    Split String    ${nome_arquivo}    ${/}
    ${arquivo}=    Set Variable    ${arquivo}[-1] 
    ${OBJETO_COMPRA}=    Replace String    ${arquivo}    .robot    ${EMPTY}
    Set Global Variable    ${OBJETO_COMPRA}


Configurar variável fechado_aberto_item
    Set Global Variable    ${OBJETO_PREGAO}    	Pregao_fechado_aberto_item_01

Configurar variável fechado_aberto_lote
    Set Global Variable    ${OBJETO_PREGAO}    	Pregao_fechado_aberto_lote_01

Configurar variável aberto_fechado_lote
    Set Global Variable    ${OBJETO_PREGAO}    	Pregao_aberto_fechado_lote_01

Configurar variável aberto_fechado_item
    Set Global Variable    ${OBJETO_PREGAO}    	Pregao_aberto_fechado_item_01

Configurar variável aberto_lote
    Set Global Variable    ${OBJETO_PREGAO}    	Pregao_aberto_lote_01

Configurar variável aberto_item
    Set Global Variable    ${OBJETO_PREGAO}    	Pregao_aberto_item_01

Configurar variável aberto_lote_OPD
    Set Global Variable    ${OBJETO_PREGAO}    	Pregao_aberto_lote_OPD_01

Usar SC_Item_Compra_Disp_Emerg
    Set Global Variable    ${RESUMO_SC}    SC_Item_Compra_Disp_Emerg

Usar SC_Item_Compra_Disp_OPD
    Set Global Variable    ${RESUMO_SC}    SC_Item_Compra_Disp_OPD

Usar SC_Item_Compra_Disp
    Set Global Variable    ${RESUMO_SC}    SC_Item_Compra_Disp

Usar SC_Item_Compra_Inex
    Set Global Variable    ${RESUMO_SC}    SC_Item_Compra_Inex

Usar SC_Item_Concorrencia
    Set Global Variable    ${RESUMO_SC}    SC_Item_Concorrencia

Usar SC_Item_Pregao
    Set Global Variable    ${RESUMO_SC}    SC_Item_Pregao

Usar SC_Lote_Compra_Disp_Emerg
    Set Global Variable    ${RESUMO_SC}    SC_Lote_Compra_Disp_Emerg

Usar SC_Lote_Compra_Disp
    Set Global Variable    ${RESUMO_SC}    SC_Lote_Compra_Disp

Usar SC_Lote_Compra_Inex
    Set Global Variable    ${RESUMO_SC}    SC_Lote_Compra_Inex

Usar SC_Lote_Concorrencia
    Set Global Variable    ${RESUMO_SC}    SC_Lote_Concorrencia

Usar SC_Lote_Pregao_OPD
    Set Global Variable    ${RESUMO_SC}    SC_Lote_Pregao_OPD

Usar SC_Lote_Pregao
    Set Global Variable    ${RESUMO_SC}    SC_Lote_Pregao