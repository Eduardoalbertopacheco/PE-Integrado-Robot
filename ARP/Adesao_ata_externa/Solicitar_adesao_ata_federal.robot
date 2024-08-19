*** Settings ***

Library          SeleniumLibrary
Resource        ../Ressource_ARP.robot

*** Test Cases ***
Cenário 01 - Solicitar Adesão de Ata Externa Federal
    [Tags]    solicitar_adesao
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata Externa da Lista
    E solicito Consumo/Adesão
    E seleciono o grupo de compras
    Então confirmo a solicitação de adesão


Cenário 02 - Selecionar itens para adesão
    [Tags]    selecionar_itens
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a lista de todas as Solicitaçõe de Adesão
    E clico na Adesão da lista
    E seleciono itens da ARP para Adesão
    E vejo a Auditoria da ARP


Cenário 03 - Alterar valor de referência dos itens
    [Tags]    alterar_valor_referencia
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a lista de todas as Solicitaçõe de Adesão
    E clico na Adesão da lista
    Então altero o valor de referência dos itens
    E vejo a Auditoria da ARP


Cenário 03 - Incluir e assinar documento
    [Tags]    assinar_documento
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a lista de todas as Solicitaçõe de Adesão
    E clico na Adesão da lista
    Então incluo e Assino os Documentos na Adesão
    E vejo a Auditoria da ARP


 Cenário 04 - Encaminhar Adesao
    [Tags]    encaminhar_adesao
    Dado que acesso o sistema
    E faço login com usuário "solicitante.110402"
    E acesso a lista de todas as Solicitaçõe de Adesão
    E clico na Adesão da lista
    Então encaminho a Solicitação de Adesão
    E vejo a Auditoria da ARP


Cenário 05 - Deliberar com Orçamento
    [Tags]    Deliberar_adesao
    Dado que acesso o sistema
    E faço login com usuário "orcamento.110402"
    E acesso a lista de todas as Solicitaçõe de Adesão
    E clico na Adesão da lista
    Então Delibero a Solicitação de Adesão
    E vejo a Auditoria da ARP

Cenário 06 - Deliberar com Ordenador
    [Tags]    Deliberar_adesao_ordenador
    Dado que acesso o sistema
    E faço login com usuário "ordenador.110402"
    E acesso a lista de todas as Solicitaçõe de Adesão
    E clico na Adesão da lista
    Então Delibero a Solicitação de Adesão
    E vejo a Auditoria da ARP

Cenário 07 - Concluir análise com Gestor Central
    [Tags]    Concluir_analise
    Dado que acesso o sistema
    E faço login com usuário "Gestoratacentral2.120101"
    E acesso a lista de todas as Solicitaçõe de Adesão
    E clico na Adesão da lista
    Então concluo a análise da Ata Externa

Cenário 08 - Deliberar e Assianr Documento com Gestor Central
    [Tags]    Deliberar_adesao_gestor_central
    Dado que acesso o sistema
    E faço login com usuário "Gestoratacentral2.120101"
    E acesso a lista de todas as Solicitaçõe de Adesão
    E clico na Adesão da lista
    Então Delibero a Adesão e Assino o Documento com Gestor de Ata Central
    E vejo a Auditoria da ARP

Cenário 09 - Encaminhar para autorização
    [Tags]    Encaminhar_adesao_autorizacao
    Dado que acesso o sistema
    E faço login com usuário "Gestoratacentral2.120101"
    E acesso a lista de todas as Solicitaçõe de Adesão
    E clico na Adesão da lista
    Então encaminho a Adesão para autorização


Cenário 10 - Deliberar com Autoridade Central
    [Tags]    Deliberar_autoridade_central
    Dado que acesso o sistema
    E faço login com usuário "autoridadecentral"
    E acesso a lista de todas as Solicitaçõe de Adesão
    E clico na Adesão da lista
    Então Delibero a Adesão e Assino o Documento com Autoridade Central
    E vejo a Auditoria da ARP
    

