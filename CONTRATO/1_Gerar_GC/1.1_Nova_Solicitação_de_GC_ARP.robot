*** Settings ***
Documentation    Cenário: Criar uma nova Solicitação de Geração de contrato Oriunda de uma ARP
Resource        ../../Resources/Resource_login.robot
Resource        ../../Resources/Resource_Contrato.robot


*** Variables ***

*** Keywords ***





*** Test Cases ***
CT01 - Criar uma Nova Solicitação de GC
    Dado que acesso o sistema
    E faço login com usuário "gestor.contrato.120101"
    E Acesso a lista de Geração de Contratos
    Então incluo uma nova Solicitação de GC