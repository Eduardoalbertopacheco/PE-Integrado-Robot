*** Settings ***
Documentation    Cenário: Criar um contrato Legado não relaizado no PE-Itegrado
Resource        ../../Resources/Resource_login.robot
Resource        ../../Resources/Resource_Contrato.robot

*** Test Cases ***
CT01 - Criar um novo contrato Legado não PE
   Configurar Variáveis de Contrato
   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso a tela de criar contrato
   Então crio um novo contrato não PE


CT02 - Configurar Partes do contrato
   Configurar Variáveis de Contrato
   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato da Lista
   E acesso a aba 'Partes'
   Então configuro a aba Partes do contrato


CT03 - Incluir Itens no contrato
   Configurar Variáveis de Contrato
   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato da Lista
   E acesso a aba 'Itens'
   Então incluo os itens no Contrato


CT04 - Incluir Gestores e Fiscais
   Configurar Variáveis de Contrato
   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato da Lista
   E acesso a aba 'Gestores/Fiscais'
   Então Incluo os Gestortes de Fiscais ao Contrato


CT05 - Incluir Documentos Obrigatórios
   Configurar Variáveis de Contrato
   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato da Lista
   E acesso a aba 'Documentos do Processo'
   Então incluo os documentos obrigatórios


CT06 - Encaminhar Contrato
   Configurar Variáveis de Contrato
   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato da Lista
   Então Encaminho o Contrato