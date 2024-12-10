*** Settings ***
Documentation    Cenário: Criar um contrato Legado não relaizado no PE-Itegrado
Resource        ../../Resources/Resource_login.robot
Resource        ../../Resources/Resource_Contrato.robot


*** Test Cases ***
CT01 - Criar um novo contrato Legado PE ARP

   Configurar Variáveis de Contrato
   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso a tela de criar contrato
   Então crio um novo contrato PE ARP


CT02 - Configurar Partes do contrato

   Configurar Variáveis de Contrato
   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato da Lista
   Então configuro a aba Partes do contrato PE não ARP


CT03 - Definir Índice dos Itens

   Configurar Variáveis de Contrato
   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato da Lista
   E acesso a tela de 'Definir Índice'
   Então defino os índices dos itens


CT04 - Incluir Gestores e Fiscais

   Configurar Variáveis de Contrato
   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato da Lista
   Então Incluo os Gestortes de Fiscais ao Contrato


CT05 - Incluir Documentos Obrigatórios

   Configurar Variáveis de Contrato
   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato da Lista
   Então incluos os docs obrigatórios


CT06 - Encaminhar Contrato

   Configurar Variáveis de Contrato
   Dado que acesso o sistema
   E faço login com usuário "analista.contrato.120101"
   E Acesso a lista de contratos
   E acesso o Contrato da Lista
   Então Encaminho o Contrato