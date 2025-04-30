*** Settings ***
Documentation    Cenário: Criar uma Geração de Contrato Não Oriunda de uma ARP e Realiazado no PE
Resource        ../../Resources/Resource_login.robot
Resource        ../../Resources/Resource_Contrato.robot

*** Test Cases ***
CT01 - Criar Uma Nova GC Não ARP e Não PE

    Configurar Variáveis de GC
    Dado que acesso o sistema
    E faço login com usuário "gestor.contrato.120101"
    E Acesso a lista de Geração de Contratos
    E acesso a tela de 'Incluir Novo GC'
    Então incluo um Novo GC Não ARP e SIM PE