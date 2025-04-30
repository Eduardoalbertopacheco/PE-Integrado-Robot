*** Settings ***
Documentation    Cadastro de uma SC oriunda de uma IRP por Item - Fluxo Feliz

Resource         ../Resources/Resource_ARP.robot
Resource         ../Resources/Resource_IRP.robot
Resource         ../Resources/Resource_login.robot

*** Keywords ***

*** Test Cases ***

CT01 - Gerar SC por Item de Uma IRP
    [Tags]    criar_sc
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a lista de IRPs
    E clico na IRP da Lista
    Então Gero a SC da IRP