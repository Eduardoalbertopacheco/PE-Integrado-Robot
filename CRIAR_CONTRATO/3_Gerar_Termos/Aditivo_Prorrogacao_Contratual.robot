
*** Settings ***
Documentation    Cenário: Criar um termo Aditivo de Prorrogação Contratual de um contrato Legado - Fluxo Feliz
Resource        ../../Resources/Resource_login.robot
Resource        ../../Resources/Resource_Contrato.robot

*** Test Cases ***
CT01 - Criar Termo de Reequilíbrio

   Dado que acesso o sistema
   E faço login com usuário "02659415129t"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E clico em 'Gerar Termo'
   Seleciono para Termo de 'Prorrogação Contratual'
   Então preencho a aba 'Dados Gerais' do Termo de Prorrogação


CT02 - Anexar e Encaminhar Termo de Prorrogação
    Dado que acesso o sistema
    E faço login com usuário "02659415129t"
    E Acesso a lista de contratos
    E acesso o Contrato Legado da Lista
    E acesso a aba 'Contratos/Termos'
    E acesso o termo de Prorrogação da Lista
    E acesso a aba 'Anexos'
    Então incluo o anexo 'Decl. de essenc.' no termo de Prorrogação
    E acesso o termo de Prorrogação da Lista
    Então encaminho o Termo do Contrato


CT03 - Concluir Análise com a Contratada

    Dado que acesso o sistema
    E faço login com usuário "29219904403.256"
    E acesso a Lista de 'Meus Contratos'
    E acesso o Contrato Legado da Lista
    E acesso a aba 'Contratos/Termos'
    E seleciono o termo de Prorrogação da lista
    Então analiso o termo de Prorrogação


CT04 - Confirmar Termo com o Gestor

    Dado que acesso o sistema
    E faço login com usuário "02659415129t"
    E Acesso a lista de contratos
    E acesso o Contrato Legado da Lista
    E acesso a aba 'Contratos/Termos'
    E acesso o termo de Prorrogação da lista
    Então confirmo o termo de Prorrogação com o Gestor


CT05 - Anexar Documentos obrigatórios para Concluir Análise

    Dado que acesso o sistema
    E faço login com usuário "analista.contrato.120101"
    E Acesso a lista de contratos
    E acesso o Contrato Legado da Lista
    E acesso a aba 'Contratos/Termos'
    E acesso o termo de Prorrogação da lista
    E acesso a aba 'Anexos'
    Então incluo os documentos obrigatórios do termo

    
CT06 - Concluir análise do termo

    Dado que acesso o sistema
    E faço login com usuário "analista.contrato.120101"
    E Acesso a lista de contratos
    E acesso o Contrato Legado da Lista
    E acesso a aba 'Contratos/Termos'
    E acesso o termo de Prorrogação da lista
    Então concluo a análise do Termo


CT07 - Solicitar Aprovação para o Ordenador

    Dado que acesso o sistema
    E faço login com usuário "analista.contrato.120101"
    E Acesso a lista de contratos
    E acesso o Contrato Legado da Lista
    E acesso a aba 'Contratos/Termos'
    E seleciono o termo de Prorrogação da lista
    Então solicito aprovação do Termo


CT08 - Aprovar Termo com Ordenardor

    Dado que acesso o sistema
    E faço login com usuário "ordenador.120101"
    E Acesso a lista de contratos
    E acesso o Contrato Legado da Lista
    E acesso a aba 'Contratos/Termos'
    E seleciono o termo de Prorrogação da lista
    Então aprovo o termo com o Ordenador


CT09 - Solicitar análise jurídica

    Dado que acesso o sistema
    E faço login com usuário "analista.contrato.120101"
    E Acesso a lista de contratos
    E acesso o Contrato Legado da Lista
    E acesso a aba 'Contratos/Termos'
    E seleciono o termo de Prorrogação da lista
    Então Solicito a Análise Jurídica do Termo


CT10 - Concluir análise jurídica do termo

    Dado que acesso o sistema
    E faço login com usuário "juridico.120101"
    E Acesso a lista de contratos
    E acesso o Contrato Legado da Lista
    E acesso a aba 'Contratos/Termos'
    E seleciono o termo de Prorrogação da lista
    Então concluo a Análise Jurídica do Termo


CT11 - Incluir Documento Empenho para Solicitar assinatura

   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E acesso o termo de Prorrogação da lista
   E acesso a aba 'Anexos'
   E incluo o Documento do Tipo 'Empenho' no Termo


CT12 - Incluir Anexo e Solicitar assinatura para Contratada

    Dado que acesso o sistema
    E faço login com usuário "analista.contrato.120101"
    E Acesso a lista de contratos
    E acesso o Contrato Legado da Lista
    E acesso a aba 'Contratos/Termos'
    E acesso a aba 'Documentos do Processo'
    E anexo o documento 'termo aditivo' para assinatura
    E acesso a aba 'Contratos/Termos'
    E acesso o termo de Prorrogação da lista
    Então solicito assinatura do termo


CT13 - Assinar Termo com a Contratada Principal

   Dado que acesso o sistema
   E faço login com usuário "29219904403.256"
   E acesso a Lista de 'Meus Contratos'
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Docs. assinatura'
   Então assino o Documento Termo Aditivo com a Contratada/Contratante


CT14 - Assinar Termo com a Contratante Principal

   Dado que acesso o sistema
   E faço login com usuário "autoridade.120101"
   E acesso a Lista de Contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Docs. assinatura'
   Então assino o Documento Termo Aditivo com a Contratada/Contratante

   # Termo Vigente/Aguardando Início Vigencia
    