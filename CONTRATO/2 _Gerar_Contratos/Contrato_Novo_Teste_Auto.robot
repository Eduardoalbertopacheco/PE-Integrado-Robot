*** Settings ***
Documentation        Fluxo Feliz - Contrato   
Library          SeleniumLibrary
Resource        ../../Resources/Resource_login.robot
Resource        ../../Resources/Resource_Contrato.robot

*** Test Cases ***
CT01 - Criar um novo contrato Novo

   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso a tela de criar contrato
   Então crio um Contrato Novo


CT02 - Configurar Partes do contrato

   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o contrato novo da Lista
   E acesso a aba 'Partes'
   Então configuro a aba Partes do contrato


CT03 - Definir Índice dos Itens

   # Configurar Variáveis de Contrato
   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o contrato novo da Lista
   E acesso a aba 'Itens'
   E acesso a tela de 'Definir Índice'
   Então defino os índices dos itens


CT04 - Incluir Gestores e Fiscais

   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o contrato novo da Lista
   E acesso a aba 'Gestores/Fiscais'
   Então Incluo os Gestortes de Fiscais ao Contrato


CT05 - Incluir Documentos Obrigatórios

   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o contrato novo da Lista
   E acesso a aba 'Documentos do Processo'
   Então incluo os documentos obrigatórios


CT06 - Encaminhar Contrato

   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o contrato novo da Lista
   Então Encaminho o Contrato


CT07 - Aprovar Aceite dos Gestores/Fiscais

   Dado que acesso o sistema
   E faço login com usuário "02659415129t"
   E Acesso a lista de contratos
   E acesso o contrato novo da Lista
   E acesso a aba 'Gestores/Fiscais'
   Então faço os aceites


CT08 - Solicitar Análise Jurídica

   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o contrato novo da Lista
   E acesso a aba 'Contratos/Termos'
   Então Solicito a Análise Jurídica


CT09 - Concluir Análise Jurídica

   Dado que acesso o sistema
   E faço login com usuário "juridico.120101"
   E Acesso a lista de contratos
   E acesso o contrato novo da Lista
   E acesso a aba 'Contratos/Termos'
   Então concluo a Análise Jurídica


CT09 - Solicitar Assinatura

   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o contrato novo da Lista
   E acesso a aba 'Documentos do Processo'
   E incluo o Documento do Tipo 'Empenho'
   E anexo o documento para assinatura
   E acesso a aba 'Dados Gerais'
   Então solicito assinatura


CT10 - Assinar Contrato Com a Contratada

   Dado que acesso o sistema
   E faço login com usuário "29219904403.256"
   E acesso a Lista de 'Meus Contratos'
   E acesso o contrato novo da Lista
   E acesso a aba 'Docs. assinatura'
   Então assino o contrato


CT11 - Assinar Contrato Com a Contratante
   
   Dado que acesso o sistema
   E faço login com usuário "autoridade.120101"
   E Acesso a lista de contratos
   E acesso o contrato novo da Lista
   E acesso a aba 'Docs. assinatura'
   Então assino o contrato


    

