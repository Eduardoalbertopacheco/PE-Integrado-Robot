*** Settings ***
Documentation    Fluxo Feliz - Cadastro de Ata de Registro de Preço até a ativação
Library          SeleniumLibrary
Library          DateTime
Library          Browser
Resource       ../../../Resources/Resource_login.robot
Resource        ../../../Resources/Resource_ARP.robot


*** Test Cases ***

CT01 - Gerar ARP do Pregão

    Configurar Variáveis de Contrato
    Dado que acesso o sistema
    E faço login com usuário "gestorata.120101"
    E acesso a lista de Licitações
    E seleciono o filtro Licitações Homologadas
    E clico no Licitação da lista para gerar ARP
    E acesso a tela de Gerar ARP
    Então gero a ARP


CT02 - Configurar Ata

   Configurar variável aberto_item
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata de Pregão da lista
    E configuro a Aba Dados Gerais
    Então salvo os dados


CT03 - Inluir Documento

   Configurar variável aberto_item
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata de Pregão da lista
    Então incluo o Documento na ARP
    E vejo a Auditoria da ARP


CT04 - Assinar Documento

   Configurar variável aberto_item
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata de Pregão da lista
    Então assino o documento na ARP
    E vejo a Auditoria da ARP


CT05 - Ativar ARP

   Configurar variável aberto_item
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de Atas de Registro de preços
    E seleciono a Ata de Pregão da Lista
    Então ativo a ARP


CT06 - Configurar Gestão da Ata

    Configurar Variáveis de Contrato
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de Atas de Registro de preços
    E clico na Ata de Compra Direta da Lista
    E clico em Gestão da ata
    Então configuro a gestão da Ata
    E vejo a Auditoria da ARP
