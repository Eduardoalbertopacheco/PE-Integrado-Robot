*** Settings ***
Documentation    Cenário: Dar Baixa de um Bem Móvel - Fluxo Feliz
Library         SeleniumLibrary
Library         DateTime
Resource        ../Resources/Resource_login.robot
Resource        ../Resources/Resource_Patrimonio.robot

*** Keywords ***
Então concluo a Baixa
    Select Frame    //iframe[@name='frmConteudo']

    # Selecionar a Baixa
    Wait Until Element Is Visible    //tr[td//a[text() = '120101.2.000030.2024']]//td[10]//input
    Click Element    //tr[td//a[text() = '120101.2.000030.2024']]//td[10]//input

    Wait Until Element Is Visible    //a[contains(.,'Concluir')]
    Click Element    //a[contains(.,'Concluir')]
    Sleep    3
    Capture Page Screenshot


*** Test Cases ***

CT01 - Baixa de um Bem Móvel
    Dado que acesso o sistema
    E faço login com usuário "gestorpatrimoniomovel.120101"
    E Acesso a Lista de Baixas da Minha Unidade
    Então incluo uma Nova baixa


CT02 - Incluir Bem para Baixa
    Dado que acesso o sistema
    E faço login com usuário "gestorpatrimoniomovel.120101"
    E Acesso a Lista de Baixas da Minha Unidade
    E acesso a Baixa da Lista
    Então incluo um Bem para Baixa

CT03 - Concluir Baixa
    Dado que acesso o sistema
    E faço login com usuário "gestorpatrimoniomovel.120101"
    E Acesso a Lista de Baixas da Minha Unidade
    Então concluo a Baixa