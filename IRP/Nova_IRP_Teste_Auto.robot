*** Settings ***
Documentation    Cadastro de IRP - Fluxo feliz
Library          SeleniumLibrary
Resource         ../Resources/Resource_ARP.robot
Resource         ../Resources/Resource_IRP.robot
Resource         ../Resources/Resource_login.robot


*** Test Cases ***

CT01 - Criar IRP - Aba Dados Gerais
    Configurar Variáveis de IRP

    [Tags]    criar_irp
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de IRPs
    E clico em Incluir Ata
    E Prencho os Campos da Aba Dados Gerais
    E configuro as datas de vigencia da IRP
    Então salvo a IRP
    E vejo a Auditoria da IRP

CT02 - Incluir Itens na IRP
    Configurar Variáveis de IRP

    [Tags]    Incluir_itens_IRP
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de IRPs
    E clico na IRP da Lista
    Então incluo os Itens na IRP
    E vejo a Auditoria da IRP

CT03 - Agendar IRP
    Configurar Variáveis de IRP

    [Tags]    Agendar_IRP
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de IRPs
    E clico na IRP da Lista
    Então faço o Agendamento da IRP

CT04 - Manifestar interesse com Gestor de Compras
    Configurar Variáveis de IRP

    [Tags]    Manifestar_Interesse
    Dado que acesso o sistema
    E faço login com usuário "gestorcompra.120101"
    E acesso a lista de IRPs
    E clico na IRP da Lista
    Então faço a manifestação de interesse
    E vejo a Auditoria da IRP

CT05 - Aprovar Manifestação de Interesse
    Configurar Variáveis de IRP

    [Tags]    Aprovar_Manifestação
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de IRPs
    E clico na IRP da Lista
    Então aprovo a Manifestação de Interesse
    E vejo a Auditoria da IRP


CT06 - Encerrar Etapa
    Configurar Variáveis de IRP

    [Tags]    Encerrar_Etapa
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de IRPs
    E clico na IRP da Lista
    Então Encerro a IRP
    E vejo a Auditoria da IRP


Cenárrio 07 - Finalizar IRP
    Configurar Variáveis de IRP
    
    [Tags]    Finalizar_IRP
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de IRPs
    E clico na IRP da Lista
    Então Finalizo a IRP
    E vejo a Auditoria da IRP
