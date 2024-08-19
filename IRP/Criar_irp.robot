*** Settings ***

Library    SeleniumLibrary

Resource    ../ARP/Ressource_ARP.robot

*** Keywords ***

*** Test Cases ***

Cenário 01 - Criar IRP
    [Tags]    criar_irp
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de IRPs
    E clico em Incluir Ata

