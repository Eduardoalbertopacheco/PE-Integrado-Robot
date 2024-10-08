*** Settings ***

Library          SeleniumLibrary
Resource       ../../../Resources/Resource_login.robot
Resource        ../../../Resources/Resource_ARP.robot

*** Test Cases ***

CT01 - Solicitar Consumo de Ata de Compra Direta
    [Tags]    solicitar_adesao
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata Externa da Lista
    E solicito Consumo/Adesão
    E seleciono o grupo de compras
    Então confirmo a solicitação de Consumo/Adesão
    # E vejo a Auditoria da ARP


CT02 - Selecionar itens para consumo
    [Tags]    selecionar_itens
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a lista de todas as solicitações de Consumo
    E clico no Consumo/Adesão da lista
    E seleciono itens da ARP para Adesão
    E vejo a Auditoria da ARP


CT03 - Alterar valor de referência dos itens
    [Tags]    alterar_valor_referencia
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a lista de todas as solicitações de Consumo
    E clico no Consumo/Adesão da lista
    Então altero o valor de referência dos itens
    E vejo a Auditoria da ARP


CT03 - Incluir e assinar documento
    [Tags]    assinar_documento
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a lista de todas as solicitações de Consumo
    E clico no Consumo/Adesão da lista
    Então incluo e Assino os Documentos no Consumo
    E vejo a Auditoria da ARP


 CT04 - Encaminhar Adesao
    [Tags]    encaminhar_adesao
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a lista de todas as solicitações de Consumo
    E clico no Consumo/Adesão da lista
    Então encaminho a Solicitação de Adesão
    E vejo a Auditoria da ARP


CT05 - Deliberar com Orçamento
    [Tags]    Deliberar_adesao
    Dado que acesso o sistema
    E faço login com usuário "orcamento.110402"
    E acesso a lista de todas as solicitações de Consumo
    E clico no Consumo/Adesão da lista
    Então Delibero a Solicitação de Adesão
    E vejo a Auditoria da ARP


CT06 - Deliberar com Ordenador
    [Tags]    Deliberar_adesao_ordenador
    Dado que acesso o sistema
    E faço login com usuário "ordenador.110402"
    E acesso a lista de todas as solicitações de Consumo
    E clico no Consumo/Adesão da lista
    Então Delibero a Solicitação de Adesão
    E vejo a Auditoria da ARP


CT07 - Concluir análise com Gestor de Ata
    [Tags]    Concluir_analise
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de todas as solicitações de Consumo
    E clico no Consumo/Adesão da lista
    Então concluo a análise da Ata Externa


CT08 - Deliberar e Assianr Documento com Gestor de Ata
    [Tags]    Deliberar_adesao_gestor_ata
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de todas as solicitações de Consumo
    E clico no Consumo/Adesão da lista
    Então Delibero a Adesão e Assino o Documento
    E vejo a Auditoria da ARP


CT09 - Deliberar com Autoridade Competente
    [Tags]    Deliberar_autoridade_central
    Dado que acesso o sistema
    E faço login com usuário "autoridade.110402"
    E acesso a lista de todas as solicitações de Consumo
    E clico no Consumo/Adesão da lista
    Então Delibero a Adesão e Assino o Documento
    E vejo a Auditoria da ARP
    

