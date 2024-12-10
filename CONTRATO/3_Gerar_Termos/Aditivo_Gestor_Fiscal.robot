
*** Settings ***
Documentation    Cenário: Criar um termo Aditivo Gestor/Fiscal de um contrato Legado - Fluxo Feliz
Resource        ../../Resources/Resource_login.robot
Resource        ../../Resources/Resource_Contrato.robot

*** Test Cases ***
CT01 - Criar Termo de Aditivo Gestor/Fiscal

   Dado que acesso o sistema
   E faço login com usuário "je.gestor.contrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E clico em 'Gerar Termo'
   E Seleciono para Termo Aditivo Gestor/Fiscal
   Então preencho a aba 'Dados Gerais' do Termo Aditivo Gestor/Fiscal


CT02 - Alterar Gestores e Fiscais
   Dado que acesso o sistema
   E faço login com usuário "je.gestor.contrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E acesso o termo Gestor/Fiscal da Lista
   E acesso a aba 'Gestores/Fiscais' do termo
   Então altero os Gestores e Fiscais do Termo


CT03 - Encaminhar Termo Aditivo Gestor/Fiscal
   Dado que acesso o sistema
   E faço login com usuário "je.gestor.contrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E acesso o termo Gestor/Fiscal da Lista
   Então encaminho o Termo do Contrato


CT04 - Concluir Aceite do Novo Gestor do Termo

   Dado que acesso o sistema
   E faço login com usuário "je.gestor.contrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E acesso o termo Gestor/Fiscal da Lista
   E acesso a aba 'Gestores/Fiscais' do termo
   Então concluo o aceite para novo Gestor do Termo


CT05 - Concluir Aceite do Novo Fiscal do Termo

   Dado que acesso o sistema
   E faço login com usuário "fiscal.contrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E acesso o termo Gestor/Fiscal da Lista
   E acesso a aba 'Gestores/Fiscais' do termo
   Então concluo o aceite para novo Fiscal do Termo


CT06 - Concluir aceite dos antigos Gestor e Fiscal do contrato

   Dado que acesso o sistema
   E faço login com usuário "02659415129t"
   E Acesso a lista de contratos
   E acesso o Contrato Legado da Lista
   E acesso a aba 'Contratos/Termos'
   E acesso o termo Gestor/Fiscal da Lista
   E acesso a aba 'Gestores/Fiscais' do termo
   Então concluo o aceite dos Gestor/Fiscal do Termo

   E acesso o termo Gestor/Fiscal da Lista
   E acesso a aba 'Gestores/Fiscais' do termo
   Então concluo o aceite dos Gestor/Fiscal do Termo

   # Termo Vigente


