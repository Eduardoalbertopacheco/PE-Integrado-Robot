*** Settings ***
Library          SeleniumLibrary
Resource        ../../../Resources/Resource_login.robot
Resource        ../../../Resources/Resource_ARP.robot


*** Test Cases ***
CT01 - Solicitar Adesão de Ata Externa Estadual


    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata Externa da Lista
    E solicito Consumo/Adesão
    E seleciono o grupo de compras
    Então confirmo a solicitação de Consumo/Adesão


CT02 - Selecionar itens para adesão

    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a lista de todas as Solicitaçõe de Adesão
    E clico no Consumo/Adesão da lista
    E seleciono itens da ARP para Adesão
    E vejo a Auditoria da ARP


CT03 - Alterar valor de referência dos itens

    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a lista de todas as Solicitaçõe de Adesão
    E clico no Consumo/Adesão da lista
    Então altero o valor de referência dos itens
    E vejo a Auditoria da ARP


CT03 - Incluir e assinar documento

    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a lista de todas as Solicitaçõe de Adesão
    E clico no Consumo/Adesão da lista
    Então incluo e Assino os Documentos na Adesão
    E vejo a Auditoria da ARP


 CT04 - Encaminhar Adesao

    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a lista de todas as Solicitaçõe de Adesão
    E clico no Consumo/Adesão da lista
    Então encaminho a Solicitação de Adesão
    E vejo a Auditoria da ARP


CT05 - Deliberar com Orçamento

    Dado que acesso o sistema
    E faço login com usuário "orcamento.110402"
    E acesso a lista de todas as Solicitaçõe de Adesão
    E clico no Consumo/Adesão da lista
    Então Delibero a Solicitação de Adesão
    E vejo a Auditoria da ARP

CT06 - Deliberar com Ordenador

    Dado que acesso o sistema
    E faço login com usuário "ordenador.110402"
    E acesso a lista de todas as Solicitaçõe de Adesão
    E clico no Consumo/Adesão da lista
    Então Delibero a Solicitação de Adesão
    E vejo a Auditoria da ARP

CT07 - Concluir análise com Gestor Central

    Dado que acesso o sistema
    E faço login com usuário "Gestoratacentral2.120101"
    E acesso a lista de todas as Solicitaçõe de Adesão
    E clico no Consumo/Adesão da lista
    Então concluo a análise da Ata Externa

CT08 - Deliberar e Assianr Documento com Gestor Central

    Dado que acesso o sistema
    E faço login com usuário "Gestoratacentral2.120101"
    E acesso a lista de todas as Solicitaçõe de Adesão
    E clico no Consumo/Adesão da lista
    Então Delibero a Adesão e Assino o Documento com Gestor de Ata Central
    E vejo a Auditoria da ARP

CT09 - Encaminhar para autorização

    Dado que acesso o sistema
    E faço login com usuário "Gestoratacentral2.120101"
    E acesso a lista de todas as Solicitaçõe de Adesão
    E clico no Consumo/Adesão da lista
    Então encaminho a Adesão para autorização


CT10 - Deliberar com Autoridade Central

    Dado que acesso o sistema
    E faço login com usuário "autoridadecentral"
    E acesso a lista de todas as Solicitaçõe de Adesão
    E clico no Consumo/Adesão da lista
    Então Delibero a Adesão e Assino o Documento
    E vejo a Auditoria da ARP
    

