*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/Resource_login.robot
Resource    ../../Resources/Resource_Almoxarifado.robot

*** Keywords ***

E pesquiso pela Transferência
    Select Frame    //iframe[@name='frmConteudo']

    ${NUM_TRANSF}    Get File    ${EXECDIR}/test/numero_transferencia.txt
    Log    O valor lido é: ${NUM_TRANSF}

    Wait Until Element Is Visible    //input[@name='ctl00$oPesquisaAvancada$dtgPesquisaAvancadaControle$ctl01$edtCampo_2']    30
    Input Text        //input[@name='ctl00$oPesquisaAvancada$dtgPesquisaAvancadaControle$ctl01$edtCampo_2']    ${NUM_TRANSF}
    Sleep    2
    Wait Until Element Is Visible    //a[contains(.,'Pesquisar')]    15
    Click Element    //a[contains(.,'Pesquisar')]
    Sleep    2
    Capture Page Screenshot



E clico na Transferência da lista
    ${NUM_TRANSF}    Get File    ${EXECDIR}/test/numero_transferencia.txt
    Wait Until Element Is Visible    //a[@class='link-action'][contains(.,'${NUM_TRANSF}')]    15
    Sleep    1
    Click Element    //a[@class='link-action'][contains(.,'${NUM_TRANSF}')]
    Sleep    2




*** Test Cases ***

CT01 - Criar Nova Requisição
    [Tags]    Incluir
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Transferências
    Então incluo uma nova Transferências


CT02 - Incluir Itens para Transfência
    [Tags]    Incluir_itens
    Dado que acesso o sistema
    E faço login com usuário "teste_almoxarifado"
    E acesso a lista de Transferências
    E pesquiso pela Transferência
    E clico na Transferência da lista


    