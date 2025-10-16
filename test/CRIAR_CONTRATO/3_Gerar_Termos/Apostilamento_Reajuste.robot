
*** Settings ***
Documentation    Cenário: Criar um termo de Apostilamento de Reajuste de um contrato Legado - Fluxo Feliz
Resource        ../../Resources/Resource_login.robot
Resource        ../../Resources/Resource_Contrato.robot

*** Test Cases ***
CT01 - Criar Termo Aditivo de Reajuste

   Dado que acesso o sistema
   E faço login com usuário "gestorcontrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E clico em 'Gerar Termo'
   E Seleciono para Termo Apostilamento Reajuste
   Então preencho a aba 'Dados Gerais' do Termo de Reajuste


CT02 - Reajustar Valores dos Itens

   Dado que acesso o sistema
   E faço login com usuário "gestorcontrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E acesso o termo de Reajuste da lista
   E acesso a aba 'Itens' do termo
   E acesso a tela de Percentual de reequilíbrio
   Então faça as alterações dos valores unitários dos Itens


CT03 - Anexar Documento Obrigatório para Encaminhar Termo

   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E acesso o termo de Reajuste da lista
   E acesso a aba 'Anexos'
   Então incluo o anexo 'Ofício'


CT04 - Encaminhar Termo de Reajuste

   Dado que acesso o sistema
   E faço login com usuário "gestorcontrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E acesso o termo de Reajuste da lista
   Então encaminho o Termo do Contrato


CT05 - Concluir Análise com o Analista de Contrato

   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E acesso o termo de Reajuste da lista
   E acesso a aba 'Anexos'
   E incluo o Anexo 'Termo Apostilamento' para Concluir Análise
   Então concluo a Análise do Termo com o Analista


CT06 - Solicitar Aprovação Orçamentária

   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E seleciono o termo de Reajuste da Lista
   Então solicito aprovação do Termo


CT07 - Anexar Documento Obrigatório para aprovar Termo

   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E acesso o termo de Reajuste da lista
   E acesso a aba 'Anexos'
   E incluo o Anexo 'Tipo'


CT08 - Aprovar Termo com Orçamento

   Dado que acesso o sistema
   E faço login com usuário "orcamento.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E seleciono o termo de Reajuste da Lista
   Então aprovo o termo com o Orçamento


CT09 - Solicitar Aprovação do Ordenador

   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E seleciono o termo de Reajuste da Lista
   Então solicito aprovação do Termo


CT10 - Aprovar Termo com Ordenador

   Dado que acesso o sistema
   E faço login com usuário "ordenador.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E seleciono o termo de Reajuste da Lista
   Então aprovo o termo com o Ordenador


CT11 - Solicitar Aprovação do Jurídico

   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E seleciono o termo de Reajuste da Lista
   Então Solicito a Análise Jurídica do Termo


CT12 - Concluir Análise Jurídica

   Dado que acesso o sistema
   E faço login com usuário "juridico.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E seleciono o termo de Reajuste da Lista
   Então concluo a Análise Jurídica do Termo Reajuste
   

CT13 - Solicitar Assinatura do Termo para a Contratante

   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E acesso a aba 'Documentos do Processo'
   E anexo o documento 'Termo Apostilamento 'para assinatura
   E acesso a aba 'Contratos/Termos'
   E acesso o termo de Reajuste da Lista
   Então solicito assinatura


CT14 - Assinar Termo com a Contratante
   Dado que acesso o sistema
   E faço login com usuário "autoridade.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Docs. assinatura'
   Então assino o Documento com a Contratante Principal
   
   # Termo Vigente

   