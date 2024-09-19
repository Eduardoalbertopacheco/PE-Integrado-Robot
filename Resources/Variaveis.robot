*** Settings ***
Library    String

*** Variables ***

${RESUMO_SC}              Nome
${OBJETO_PREGAO}          None
${OBJETO_COMPRA}          None
${OBJETO_ATA}             None
${OBJETO_IRP}             None
${OBJETO_CONCORRENCIA}    None

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


Configurar Variáveis de IRP
    ${nome_arquivo}=    Set Variable    ${SUITE_SOURCE}
    ${arquivo}=    Split String    ${nome_arquivo}    ${/}
    ${arquivo}=    Set Variable    ${arquivo}[-1] 
    ${OBJETO_IRP}=    Replace String    ${arquivo}    .robot    ${EMPTY}
    Set Global Variable    ${OBJETO_IRP}


Configurar Variáveis de ARP
    ${nome_arquivo}=    Set Variable    ${SUITE_SOURCE}
    ${arquivo}=    Split String    ${nome_arquivo}    ${/}
    ${arquivo}=    Set Variable    ${arquivo}[-1] 
    ${OBJETO_ATA}=    Replace String    ${arquivo}    .robot    ${EMPTY}
    Set Global Variable    ${OBJETO_ATA}



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



Configurar variável Conc_aberto_fechado_item
    Set Global Variable    ${OBJETO_PREGAO}    Conc_aberto_fechado_item_01

Configurar variável Conc_aberto_fechado_lote
    Set Global Variable    ${OBJETO_PREGAO}    Conc_aberto_fechado_lote_01

 Configurar variável Conc_fechado_aberto_lote
    Set Global Variable    ${OBJETO_PREGAO}    Conc_fechado_aberto_lote_01

Configurar variável Conc_fechado_aberto_item
    Set Global Variable    ${OBJETO_PREGAO}    Conc_fechado_aberto_item_01

Configurar variável Conc_aberto_lote_01
    Set Global Variable    ${OBJETO_PREGAO}    Conc_aberto_lote_01

Configurar variável Conc_aberto_item_01
    Set Global Variable    ${OBJETO_PREGAO}    Conc_aberto_item_01           




Configurar variável Compra_direta_disp_item
    Set Global Variable    ${OBJETO_COMPRA}    Compra_direta_disp_item

Configurar variável Compra_direta_disp_lote
    Set Global Variable    ${OBJETO_COMPRA}    Compra_direta_disp_lote

Configurar Variável de Adesão
    Set Global Variable    ${OBJETO_ATA}    Compra_direta_disp_item    



Usar SC_Item_Compra_Disp_Emerg
    Set Global Variable    ${RESUMO_SC}    SC_Item_Compra_Disp_Emerg

Usar SC_Item_Compra_Disp_OPD
    Set Global Variable    ${RESUMO_SC}    SC_Item_Compra_Disp_OPD

Usar SC_Item_Compra_Disp
    Set Global Variable    ${RESUMO_SC}    SC_Item_Compra_Disp

Usar SC_Item_Compra_Inex
    Set Global Variable    ${RESUMO_SC}    SC_Item_Compra_Inex



Usar SC_Item_Concorrencia_aberto
    Set Global Variable    ${RESUMO_SC}    SC_Item_Concorrencia_aberto

Usar SC_Item_Concorrencia_aberto_fechado
    Set Global Variable    ${RESUMO_SC}    SC_Item_Concorrencia_aberto_fechado

Usar SC_Lote_Concorrencia_aberto_fechado
    Set Global Variable    ${RESUMO_SC}    SC_Lote_Concorrencia_aberto_fechado

Usar SC_Item_Concorrencia_fechado_aberto
    Set Global Variable    ${RESUMO_SC}    SC_Item_Concorrencia_fechado_aberto

Usar SC_Lote_Concorrencia_fechado_aberto
    Set Global Variable    ${RESUMO_SC}    SC_Lote_Concorrencia_fechado_aberto

SC_Lote_Concorrencia_aberto
    Set Global Variable    ${RESUMO_SC}    SC_Lote_Concorrencia_aberto



Usar SC_Lote_Compra_Disp_Emerg
    Set Global Variable    ${RESUMO_SC}    SC_Lote_Compra_Disp_Emerg

Usar SC_Lote_Compra_Disp
    Set Global Variable    ${RESUMO_SC}    SC_Lote_Compra_Disp

Usar SC_Lote_Compra_Inex
    Set Global Variable    ${RESUMO_SC}    SC_Lote_Compra_Inex

Usar SC_Lote_Concorrencia
    Set Global Variable    ${RESUMO_SC}    SC_Lote_Concorrencia_aberto

Usar SC_Lote_Pregao_OPD
    Set Global Variable    ${RESUMO_SC}    SC_Lote_Pregao_OPD

Usar SC_Lote_Pregao_aberto
    Set Global Variable    ${RESUMO_SC}    SC_Lote_Pregao_aberto

Usar SC_Item_Pregao_aberto
    Set Global Variable    ${RESUMO_SC}    SC_Item_Pregao_aberto

Usar SC_Lote_Pregao_aberto_fechado
    Set Global Variable    ${RESUMO_SC}    SC_Lote_Pregao_aberto_fechado

Usar SC_Lote_Pregao_fechado_aberto
    Set Global Variable    ${RESUMO_SC}    SC_Lote_Pregao_fechado_aberto

Usar SC_Item_Pregao_aberto_fechado
    Set Global Variable    ${RESUMO_SC}    SC_Item_Pregao_aberto_fechado

usar SC_Item_Pregao_fechado_aberto
    Set Global Variable    ${RESUMO_SC}    SC_Item_Pregao_fechado_aberto



