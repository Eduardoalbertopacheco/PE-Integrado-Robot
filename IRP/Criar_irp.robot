*** Settings ***
Documentation    Cadastro de IRP - Fluxo feliz
Library          SeleniumLibrary
Resource         ../ARP/Ressource_ARP.robot
Resource         ./Resource_IRP.robot


*** Test Cases ***

Cenário 01 - Criar IRP - Aba Dados Gerais
    [Tags]    criar_irp
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de IRPs
    E clico em Incluir Ata
    E Prencho os Campos da Aba Dados Gerais
    E configuro as datas de vigencia da IRP
    Então salvo a IRP
    E vejo a Auditoria da IRP

Cenário 02 - Incluir Itens na IRP
    [Tags]    Incluir_itens_IRP
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de IRPs
    E clico na IRP da Lista
    Então incluo os Itens na IRP
    E vejo a Auditoria da IRP

Cenário 03 - Agendar IRP
    [Tags]    Agendar_IRP
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de IRPs
    E clico na IRP da Lista
    Então faço o Agendamento da IRP

Cenário 04 - Manifestar interesse com Gestor de Compras
    [Tags]    Manifestar_Interesse
    Dado que acesso o sistema
    E faço login com usuário "gestorcompra.120101"
    E acesso a lista de IRPs
    E clico na IRP da Lista
    Então faço a manifestação de interesse
    E vejo a Auditoria da IRP

Cenário 05 - Aprovar Manifestação de Interesse
    [Tags]    Aprovar_Manifestação
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de IRPs
    E clico na IRP da Lista
    Então aprovo a Manifestação de Interesse
    E vejo a Auditoria da IRP


Cenário 06 - Encerrar Etapa
    [Tags]    Encerrar_Etapa
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de IRPs
    E clico na IRP da Lista
    Então Encerro a IRP
    E vejo a Auditoria da IRP


Cenárrio 07 - Finalizar IRP
    [Tags]    Finalizar_IRP
    Dado que acesso o sistema
    E faço login com usuário "edu.gestorata.110402"
    E acesso a lista de IRPs
    E clico na IRP da Lista
    Então Finalizo a IRP
    E vejo a Auditoria da IRP
