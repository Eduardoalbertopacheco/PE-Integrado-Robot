*** Settings ***
Documentation    Cenário: Criar uma nova Solicitação de Geração de contrato Oriunda de uma ARP
Resource        ../../Resources/Resource_login.robot
Resource        ../../Resources/Resource_Contrato.robot

*** Test Cases ***
CT01 - Criar uma Nova Solicitação de GC
    Dado que acesso o sistema
    E faço login com usuário "gestor.contrato.120101"
    E Acesso a lista de Geração de Contratos
    E acesso a tela de 'Incluir Novo GC'
    Então incluo uma nova Solicitação de GC SIM ARP


CT02 - Incluir Itens no contrato

    Dado que acesso o sistema
    E faço login com usuário "gestor.contrato.120101"
    E Acesso a lista de Geração de Contratos
    E acesso a GC ARP da lista
    E acesso a aba 'Itens'
    E acesso a tela de selecionar Itens GC ARP
    Então incluo os itens na GC ARP

Encaminhar GC ARP
    Dado que acesso o sistema
    E faço login com usuário "gestor.contrato.120101"
    E Acesso a lista de Geração de Contratos
    E acesso a GC ARP da lista
    Então Encaminho a GC

CT03 - Deliberar GC ARP com Autoridade Central
    Configurar Variáveis de GC
    Dado que acesso o sistema
    E faço login com usuário "autoridadecentral"
    E Acesso a lista de Geração de Contratos
    E acesso a GC ARP da lista
    Então Delibero a GC