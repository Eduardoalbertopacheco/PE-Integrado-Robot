
*** Settings ***
Documentation    Cenário: Criar um termo Aditivo de Acréssimo e Supressão de um contrato Legado - Fluxo Feliz
Resource        ../../Resources/Resource_login.robot
Resource        ../../Resources/Resource_Contrato.robot

*** Test Cases ***

CT01 - Criar Termo de Acress/Supressão

   Dado que acesso o sistema
   E faço login com usuário "gestorcontrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E clico em 'Gerar Termo'
   E Seleciono para Termo Aditivo Acress/Supressão
   Então preencho a aba 'Dados Gerais' do Termo de Acrésssimo/Supressão


CT02 - Alterar Itens

   Dado que acesso o sistema
   E faço login com usuário "gestorcontrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E acesso o termo Acress/Supressão da Lista
   E acesso a aba 'Itens' do termo
   Então faça as alterações dos Itens


CT03 - Anexar Documento Obrigatório para Encaminhat termo

   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E acesso o termo Acress/Supressão da Lista
   E acesso a aba 'Anexos'
   Então incluo o anexo 'Declaração de essencialidade'

   
CT04 - Encaminhar Termo de Acress/Supressão

   Dado que acesso o sistema
   E faço login com usuário "gestorcontrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E acesso o termo Acress/Supressão da Lista
   Então encaminho o Termo do Contrato


CT05 - Analisar Termo com a Contratada

   Dado que acesso o sistema
   E faço login com usuário "29219904403.256"
   E acesso a Lista de 'Meus Contratos'
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E seleciono o termo Acress/Supressão da Lista
   Então analiso o termo Acress/Supressão


CT06 - Confirmar com o Gestor

   Dado que acesso o sistema
   E faço login com usuário "gestor.contrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E acesso o termo Acress/Supressão da Lista
   Então confirmo com o Gestor


CT07 - Anexar Docs Obrigatórios para Concluir Análise

   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E acesso o termo Acress/Supressão da Lista
   E acesso a aba 'Anexos'
   Então incluo os Anexos para Concluir Análise


CT08 - Concluir Análise com Analista de Contratos

   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E acesso o termo Acress/Supressão da Lista
   Então confirmo com o Gestor


CT09 - Solicitar Aprovação do Ordenador

   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E seleciono o termo Acress/Supressão da Lista
   Então solicito aprovação do Termo


CT10 - Aprovar com Ordenador

   Dado que acesso o sistema
   E faço login com usuário "ordenador.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E seleciono o termo Acress/Supressão da Lista
   Então aprovo o termo com o Ordenador


CT10 - Solicitar Análise Jurídica

   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E seleciono o termo Acress/Supressão da Lista
   Então Solicito a Análise Jurídica do Termo


CT11 - Concluir Análise Jurídica

   Dado que acesso o sistema
   E faço login com usuário "juridico.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E seleciono o termo Acress/Supressão da Lista
   Então concluo a Análise Jurídica do Termo


CT12 - Incluir Documento para Solicitar assinatura

   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E acesso o termo Acress/Supressão da Lista
   E acesso a aba 'Anexos'
   E incluo o Documento do Tipo 'Empenho' no Termo


CT13 - Solicitar Assinatura para Contratada Principal

   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Documentos do Processo'
   E anexo o documento para assinatura
   E acesso a aba 'Contratos/Termos'
   E acesso o termo Acress/Supressão da Lista
   Então solicito assinatura do termo


CT14 - Assinar Termo com a Contratada Principal

   Dado que acesso o sistema
   E faço login com usuário "29219904403.256"
   E acesso a Lista de 'Meus Contratos'
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Docs. assinatura'
   Então assino o Documento com a Contratada Principal
   




