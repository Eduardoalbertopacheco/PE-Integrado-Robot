*** Settings ***
Documentation    Fluxo de Consumo ATA OPD - Fluxo Feliz

Library          SeleniumLibrary
Resource       ../../../Resources/Resource_login.robot
Resource        ../../../Resources/Resource_ARP.robot

*** Test Cases ***

CT01 - Solicitar Consumo de Ata OPD de Compra Direta

    Dado que acesso o sistema
    E faço login com usuário "solicitante.070001"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata Externa da Lista
    E solicito Consumo/Adesão
    E seleciono o grupo de compras - TJ
    Então confirmo a solicitação de Consumo/Adesão
    # E vejo a Auditoria da ARP


CT02 - Selecionar itens para Consumo

    Dado que acesso o sistema
    E faço login com usuário "solicitante.070001"
    E acesso a lista de todas as solicitações de Consumo
    E clico no Consumo/Adesão da lista
    E seleciono itens da ARP para Adesão
    E vejo a Auditoria da ARP


CT03 - Alterar valor de referência dos itens
    
    Dado que acesso o sistema
    E faço login com usuário "solicitante.070001"
    E acesso a lista de todas as solicitações de Consumo
    E clico no Consumo/Adesão da lista
    Então altero o valor de referência dos itens
    # E vejo a Auditoria da ARP


CT04 - Incluir e Assinar Documentos
   
    Dado que acesso o sistema
    E faço login com usuário "solicitante.070001"
    E acesso a lista de todas as solicitações de Consumo
    E clico no Consumo/Adesão da lista
    Então incluo e Assino os Documentos no Consumo
    E vejo a Auditoria da ARP


 CT05 - Encaminhar Solicitação de Consumo
   
    Dado que acesso o sistema
    E faço login com usuário "solicitante.070001"
    E acesso a lista de todas as solicitações de Consumo
    E clico no Consumo/Adesão da lista
    Então encaminho a Solicitação de Adesão
    E vejo a Auditoria da ARP


CT06 - Deliberar com Orçamento
    
    Dado que acesso o sistema
    E faço login com usuário "orcamento.070001"
    E acesso a lista de todas as solicitações de Consumo
    E clico no Consumo/Adesão da lista
    Então Delibero a Solicitação de Adesão
    E vejo a Auditoria da ARP
    

CT07 - Deliberar com Ordenador
    
    Dado que acesso o sistema
    E faço login com usuário "ordenador.070001"
    E acesso a lista de todas as solicitações de Consumo
    E clico no Consumo/Adesão da lista
    Então Delibero a Solicitação de Adesão
    E vejo a Auditoria da ARP


CT08 - Concluir análise com Gestor de Ata
    
    Dado que acesso o sistema
    E faço login com usuário "gestorata.070001"
    E acesso a lista de todas as solicitações de Consumo
    E clico no Consumo/Adesão da lista
    Então concluo a análise da Ata Externa


CT09 - Deliberar e Assianr Documento com Gestor de Ata
    
    Dado que acesso o sistema
    E faço login com usuário "gestorata.070001"
    E acesso a lista de todas as solicitações de Consumo
    E clico no Consumo/Adesão da lista
    Então Delibero a Adesão e Assino o Documento
    E vejo a Auditoria da ARP


CT10 - Deliberar com Autoridade Competente
    
    Dado que acesso o sistema
    E faço login com usuário "autoridade.070001"
    E acesso a lista de todas as solicitações de Consumo
    E clico no Consumo/Adesão da lista
    Então Delibero a Adesão e Assino o Documento
    E vejo a Auditoria da ARP