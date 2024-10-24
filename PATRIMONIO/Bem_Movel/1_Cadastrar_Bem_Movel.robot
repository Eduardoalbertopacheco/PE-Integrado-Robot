*** Settings ***
Documentation    Cenário: Cadastrar um Bem Móvel - Fluxo Feliz
Library         SeleniumLibrary
Library         DateTime
Resource        ../../Resources/Resource_login.robot
Resource        ../../Resources/Resource_Patrimonio.robot

*** Keywords ***


*** Test Cases ***

CT01 - Cadastrar Bem Móvel
    Dado que acesso o sistema
    E faço login com usuário "gestorpatrimoniomovel.120101"
    E acesso a lista de Bens Móvies
    Então incluo um novo bém móvel


CT02 - Configurar Dados Contábeis
    Dado que acesso o sistema
    E faço login com usuário "gestorpatrimoniomovel.120101"
    E acesso a lista de Bens Móvies
    E acesso o bem móvel da lista
    Então salvo os dadoas da aba Dados Contábeis


CT03 - Tombar bem móvel
    Dado que acesso o sistema
    E faço login com usuário "gestorpatrimoniomovel.120101"
    E acesso a lista de Bens Móvies
    E seleciono o Bem Móvel da lista
    Então faço o tombamento do Bem Móvel


CT04 - Gerar Termo de Resposabilidade
    Dado que acesso o sistema
    E faço login com usuário "gestorpatrimoniomovel.120101"
    E acesso a lista de Bens Móvies
    E seleciono o Bem Móvel da lista
    Então gero o termo de responsabilidade


CT05 - Encaminhar Termo de Resposabilidade
    Dado que acesso o sistema
    E faço login com usuário "gestorpatrimoniomovel.120101"
    E acesso a lista de Bens Móvies
    Então encaminho o termo de resposabilidade


CT06 - Aprovar Termo de Resposabilidade
    Dado que acesso o sistema
    E faço login com usuário "gestorpatrimoniomovel.120101"
    E acesso minhas tarefas
    Então aprovo o Termo de Resposabilidade

