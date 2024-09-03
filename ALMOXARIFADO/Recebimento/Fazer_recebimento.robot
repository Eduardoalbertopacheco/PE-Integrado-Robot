*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/Resource_login.robot
Resource    ../../Resources/Resource_Almoxarifado.robot

*** Keywords ***
E clico no registro em Recebimento da lista
    Select Frame    //iframe[@name='frmConteudo']
    Wait Until Element Is Visible    //table[@id='ctl00_ContentPrincipal_dtgPesquisa']//tr[td[text()='${NOME_ALMOX}'] and td[8]//img[contains(@title,'Em recebimento')]]//td[1]//a   20
    Click Element    //table[@id='ctl00_ContentPrincipal_dtgPesquisa']//tr[td[text()='${NOME_ALMOX}'] and td[8]//img[contains(@title,'Em recebimento')]]//td[1]//a
    Capture Page Screenshot


*** Test Cases ***

Cenário 01 - Fazer um Novo recebimento do Almoxarifado
    [Tags]    Incluir
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Recebimento
    Então incluo um novo Recebimento


Cenário 02 - Incluir itens para recebimento
    [Tags]    Incluir_itens
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Recebimento
    E clico no recebimento da lista
    Então incluo os Itens para recebimento

Cenário 03 - Encaminhar Recebimento
    [Tags]    Encaminhar
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Recebimento
    E clico no recebimento da lista
    Então faço o encaminhamento do Recebimento

Cenário 04 - Aprovar Recebimento provisório
    [Tags]    Encaminhar
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Recebimento
    E clico no registro em Recebimento da lista


