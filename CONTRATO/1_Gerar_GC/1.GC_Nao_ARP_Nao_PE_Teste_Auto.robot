
*** Settings ***
Documentation    Cenário: Criar uma nova Solicitação de Geração de contrato Não Oriunda de uma ARP e Não Realizado no PE
Resource        ../../Resources/Resource_login.robot
Resource        ../../Resources/Resource_Contrato.robot

*** Test Cases ***
CT01 - Criar uma Nova Solicitação de GC

    Configurar Variáveis de GC
    Dado que acesso o sistema
    E faço login com usuário "gestor.contrato.120101"
    E Acesso a lista de Geração de Contratos
    E acesso a tela de 'Incluir Novo GC'
    Então incluo um Novo GC Não ARP e Não PE


CT02 - Incluir Itens no contrato

    Configurar Variáveis de GC
    Dado que acesso o sistema
    E faço login com usuário "gestor.contrato.120101"
    E Acesso a lista de Geração de Contratos
    E acesso a GC da lista
    E acesso a aba 'Itens'
    Então incluo os itens no Contrato Não ARP e Não PE


CT03 - Encaminhar GC

    Configurar Variáveis de GC
    Dado que acesso o sistema
    E faço login com usuário "gestor.contrato.120101"
    E Acesso a lista de Geração de Contratos
    E acesso a GC da lista
    Então Encaminho a GC


CT03 - Deliberar GC Com Autoridade Central
    Configurar Variáveis de GC
    Dado que acesso o sistema
    E faço login com usuário "autoridadecentral"
    E Acesso a lista de Geração de Contratos
    E acesso a GC da lista
    Então Delibero a GC




