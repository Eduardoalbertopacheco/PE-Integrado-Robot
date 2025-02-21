*** Settings ***
Documentation    Ações e Elementos da Página de Login
Library    SeleniumLibrary


*** Variables ***

${URL}     https://www.homologpeintegrado.pe.gov.br/
# ${URL}     https://www.homolog05.peintegrado.pe.gov.br/Default.aspx
# ${URL}     https://www.homolog03.peintegrado.pe.gov.br/default.aspx
# ${URL}       https://www.hotfix.peintegrado.pe.gov.br/core/default.aspx
# ${URL}     http://www.treinapeintegrado.pe.gov.br/default.aspx

${HOMOLOTREI}    http://www.treinapeintegrado.pe.gov.br/core/default.aspx?

*** Keywords ***

Dado que acesso o sistema

    SeleniumLibrary.Open Browser    ${URL}    browser=chrome
    Maximize Browser Window
    Capture Page Screenshot

Dado que acesso o sistema no PE Treinamento
    SeleniumLibrary.Open Browser    ${HOMOLOTREI}    browser=chrome
    Maximize Browser Window
    Capture Page Screenshot


E faço login com usuário "${usuario}"

    [Arguments]    ${senha1}=PE@654321    ${senha2}=PE@123456
    Wait Until Element Is Visible    css=input[placeholder='Login']    10
    Input Text        css=input[placeholder='Login']    ${usuario}
    Input Text        css=input[placeholder='Senha']    ${senha1}
    Capture Page Screenshot
    Click Element     css=input[type='submit']


    # Verifica se o login foi bem-sucedido
    Sleep    1
    ${login_sucesso}    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=//frame[contains(@name,'main')]    15
    IF    not ${login_sucesso}
        Log    Senha incorreta, tentando novamente com outra senha
        Input Text        css=input[placeholder='Senha']    ${senha2}
        Capture Page Screenshot
        Click Element     css=input[type='submit']
        Wait Until Element Is Visible    xpath=//frame[contains(@name,'main')]    15
    END

    Capture Page Screenshot

