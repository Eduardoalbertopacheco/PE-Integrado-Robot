
*** Settings ***
Documentation    Cenário: Criar um Termo de Reequilóbrio de um Contrato Legado
Resource        ../../Resources/Resource_login.robot
Resource        ../../Resources/Resource_Contrato.robot

*** Test Cases ***
CT01 - Criar Termo de Reequilíbrio

   Dado que acesso o sistema
   E faço login com usuário "gestorcontrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E clico em 'Gerar Termo'
   E Seleciono para Termo de Reequilíbrio
   Então preencho a aba 'Dados Gerais' do Termo de Reequilíbrio


CT02 - Alterar Valores unitários dois Itens

   Dado que acesso o sistema
   E faço login com usuário "gestorcontrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E acesso o termo de Reequilíbrio da Lista
   E acesso a aba 'Itens' do termo
   E acesso a tela de Percentual de reequilíbrio
   Então faça as alterações dos valores unitários dos Itens


CT03 - Anexar Documento Obrigatório para Encaminhar Termo

   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E acesso o termo de Reequilíbrio da Lista
   E acesso a aba 'Anexos'
   Então incluo o anexo 'Petição'


CT04 - Encaminhar Termo de Reequilíbrio

   Dado que acesso o sistema
   E faço login com usuário "gestorcontrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E acesso o termo de Reequilíbrio da Lista
   Então encaminho o Termo do Contrato


CT05 - Concluir Análise com o Analista de Contrato

   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E acesso o termo de Reequilíbrio da Lista
   E acesso a aba 'Anexos'
   E incluo o Anexo 'Termo Aditivo' para Concluir Análise
   Então concluo a Análise com o Analista


CT06 - Solicitar Aprovação Orçamentária

   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E seleciono o termo de Reequilíbrio da Lista
   Então solicito aprovação do Termo


CT07 - Anexar e Aprovar Termo com Orçamento

   Dado que acesso o sistema
   E faço login com usuário "orcamento.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E acesso o termo de Reequilíbrio da Lista
   E acesso a aba 'Anexos'
   E incluo o Anexo 'DDO'
   E seleciono o termo de Reequilíbrio da Lista
   Então aprovo o termo com o Ordenador

  