
*** Settings ***
Documentation    Cenário: Criar um novo termo de recisão do contrato
Resource        ../../Resources/Resource_login.robot
Resource        ../../Resources/Resource_Contrato.robot

*** Test Cases ***
CT01 - Criar Novo Termo de Recisão

   Dado que acesso o sistema
   E faço login com usuário "02659415129t"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E clico em 'Gerar Termo'
   E Seleciono o tipo para 'Resisão'
   Então preencho a aba 'Dados Gerais' do Termo de Recisão


CT02 - Inclui anexo obrigatório para Confirmar Termo

   Dado que acesso o sistema
   E faço login com usuário "02659415129t"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E acesso o termo de Recisão da Lista
   E acesso a aba 'Anexos'
   Então incluo o anexo obrigatório no Termo de Recisão


CT03 - Confirmar Termo de Recisão

   Dado que acesso o sistema
   E faço login com usuário "02659415129t"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E acesso o termo de Recisão da Lista
   Então confirmo a recisão do termo do contrato


CT04 - Incluir Anexo e Concluir Analise do Termo

   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E acesso o termo de Recisão da Lista
   E acesso a aba 'Anexos'
   Então incluo o anexo obrigatório no Termo de Recisão
   E acesso a aba 'Dados Gerais' do Termo Recisão
   Então concluo a análise do Termo


CT05 - Solicitar Análise Jurídica do Termo

   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E seleciono o Termo de Recisão da Lista
   Então Solicito a Análise Jurídica do Termo

CT06 - Concluir Análise Jurídica

   Dado que acesso o sistema
   E faço login com usuário "juridico.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E seleciono o Termo de Recisão da Lista
   Então concluo a Análise Jurídica do Termo


CT07 - Anexar e Solicitar Autorização do Termo de Recisão

   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Documentos do Processo'
   E anexo o Termo de Recisão para Assinatura
   E acesso a aba 'Contratos/Termos'
   E acesso o Termo de Recisão da Lista
   Então solicito Autorização do Termo

CT08 - Deliberar com Autoridade

   Dado que acesso o sistema
   E faço login com usuário "autoridade.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E acesso o Termo de Recisão da Lista
   Então Delibero o Termo de Recisão


CT09 - Assinar Termo com a Contratada

   Dado que acesso o sistema
   E faço login com usuário "29219904403.256"
   E acesso a Lista de 'Meus Contratos'
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Docs. assinatura'
   Então assino Termo Recisão com a Contratada/Contratante


CT10 - Assinar Termo com a Contratante

   Dado que acesso o sistema
   E faço login com usuário "autoridade.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Docs. assinatura'
   Então assino Termo Recisão com a Contratada/Contratante

   # Termo fica aguardando rescisão