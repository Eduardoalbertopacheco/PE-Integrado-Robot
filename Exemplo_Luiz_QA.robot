
*** Settings ***
Documentation    Ações e Elementos da Página de Login
Resource        ./test/Resources/Resource_login.robot
Library    Browser
Library    OperatingSystem
Library    Screenshot
Library    DateTime
Library    String

*** Variables ***
${URL01}     https://www.homologpeintegrado.pe.gov.br/

*** Test Cases ***
CT01 - Login no Sistema
    Create Directory Screenshot
    Dado que acesso o sistema
    E faço login com usuário "gestor.contrato.120101"


*** Keywords ***
Dado que acesso o sistema
    SeleniumLibrary.Open Browser    ${URL01}    browser=chrome
    Maximize Browser Window
    Capture Page Screenshot

E faço login com usuário "${usuario}"
    [Arguments]    ${senha1}=PE@654321    ${senha2}=PE@123456
    Wait Until Element Is Visible    css=input[placeholder='Login']    10
    Input Text    css=input[placeholder='Login']    ${usuario}
    Input Text    css=input[placeholder='Senha']    ${senha1}
    Capture Page Screenshot
    Click Element    css=input[type='submit']

    # Verifica se o login foi bem-sucedido
    Sleep    1
    ${login_sucesso}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=//frame[contains(@name,'main')]    15
    IF    not ${login_sucesso}
        Log    Senha incorreta, tentando novamente com outra senha
        Input Text    css=input[placeholder='Senha']    ${senha2}
        Capture Page Screenshot
        Click Element    css=input[type='submit']
        Wait Until Element Is Visible    xpath=//frame[contains(@name,'main')]    15
    END

    Capture Page Screenshot

    # Fecha o popup de alerta
    Sleep    1
    Run Keyword And Ignore Error    Handle Alert    ACCEPT
    Sleep    1

# ============================
# Keywords auxiliares de evidência
# ============================

Create Directory Screenshot
    ${date}=    Get Current Date
    ${DATA_ATUAL}=    Convert Date    ${date}    result_format=%d_%m_%Y
    ${HORA_ATUAL}=    Convert Date    ${date}    result_format=%H_%M_%S
    ${NOME_CASO_TESTE}=    Pegar o nome do test-case
    Set Global Variable    ${DATA_ATUAL}
    ${pathDirectoryScreenshot}=    Replace String
    ...    ${EXECDIR}\\Evidencias\\${SUITE NAME}\\${DATA_ATUAL}\\${NOME_CASO_TESTE}\\${HORA_ATUAL}
    ...    ${SPACE}    _
    OperatingSystem.Create Directory    ${pathDirectoryScreenshot}
    OperatingSystem.Empty Directory     ${pathDirectoryScreenshot}
    Screenshot.Set Screenshot Directory    ${pathDirectoryScreenshot}
    SeleniumLibrary.Set Screenshot Directory    ${pathDirectoryScreenshot}
    Set Global Variable    ${pathDirectoryScreenshot}

Pegar o nome do test-case
    ${NOME_CASO_TESTE}=    Get Variable Value    ${TEST NAME}
    ${NOME_CASO_TESTE}=    Replace String    ${NOME_CASO_TESTE}    ${SPACE}    _
    ${NOME_CASO_TESTE}=    Replace String    ${NOME_CASO_TESTE}    (    _
    ${NOME_CASO_TESTE}=    Replace String    ${NOME_CASO_TESTE}    )    _
    ${NOME_CASO_TESTE}=    Replace String    ${NOME_CASO_TESTE}    \"    _
    ${NOME_CASO_TESTE}=    Replace String    ${NOME_CASO_TESTE}    :    _
    ${NOME_CASO_TESTE}=    Replace String    ${NOME_CASO_TESTE}    \'    _
    RETURN    ${NOME_CASO_TESTE}













# *** Settings ***
# Library    OperatingSystem
# Library    SeleniumLibrary
# Library    Screenshot
# Library    DateTime
# Library    Mainframe3270


# *** Keywords ***
# Create Directory Screenshot
#     ${date}=    Get Current Date
#     ${DATA_ATUAL}=    Convert Date    ${date}    result_format=%d_%m_%Y
#     ${HORA_ATUAL}=    Convert Date    ${date}    result_format=%H_%M_%S
#     ${NOME_CASO_TESTE}=    Pegar o nome do test-case
#     Set Global Variable    ${DATA_ATUAL}
#     ${pathDirectoryScreenshot}=    Replace String
#     ...    ${EXECDIR}\\Evidencias\\${SUITE NAME}\\${DATA_ATUAL}\\${NOME_CASO_TESTE}\\${HORA_ATUAL}
#     ...    ${SPACE}    _
#     OperatingSystem.Create Directory    ${pathDirectoryScreenshot}
#     OperatingSystem.Empty Directory     ${pathDirectoryScreenshot}
#     Screenshot.Set Screenshot Directory    ${pathDirectoryScreenshot}
#     SeleniumLibrary.Set Screenshot Directory    ${pathDirectoryScreenshot}
#     Mainframe3270.Set Screenshot Folder    ${pathDirectoryScreenshot}
#     Set Global Variable    ${pathDirectoryScreenshot}


# Pegar o nome do test-case
#     ${NOME_CASO_TESTE}=    Get Variable Value    ${TEST NAME}
#     ${NOME_CASO_TESTE}=    Replace String    ${NOME_CASO_TESTE}    ${SPACE}    _
#     ${NOME_CASO_TESTE}=    Replace String    ${NOME_CASO_TESTE}    (    _
#     ${NOME_CASO_TESTE}=    Replace String    ${NOME_CASO_TESTE}    )    _
#     ${NOME_CASO_TESTE}=    Replace String    ${NOME_CASO_TESTE}    \"    _
#     ${NOME_CASO_TESTE}=    Replace String    ${NOME_CASO_TESTE}    :    _
#     ${NOME_CASO_TESTE}=    Replace String    ${NOME_CASO_TESTE}    \'    _
#     RETURN    ${NOME_CASO_TESTE}


