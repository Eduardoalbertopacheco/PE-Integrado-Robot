
*** Settings ***
Documentation    Cenário: Criar um termo de Apostilamento de Reajuste de um contrato Legado - Fluxo Feliz
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
   E Seleciono para Termo Apostilamento Reajuste
   Então preencho a aba 'Dados Gerais' do Termo de Reajuste


CT02 - Alterar Itens

   Dado que acesso o sistema
   E faço login com usuário "gestorcontrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E acesso o termo de Reajuste da lista
   E acesso a aba 'Itens' do termo
   Então faça as alterações dos Itens