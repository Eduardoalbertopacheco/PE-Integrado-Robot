
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