*** Settings ***
Documentation    Cenário: Dar Baixa de um Bem Móvel - Fluxo Feliz
Library         SeleniumLibrary
Library         DateTime
Resource        ../../Resources/Resource_login.robot
Resource        ../../Resources/Resource_Patrimonio.robot

*** Test Cases ***

CT01 - Incluir Nova Baixa de um Bem Móvel
    Dado que acesso o sistema
    E faço login com usuário "gestorpatrimoniomovel.120101"
    E Acesso a Lista de Baixas da Minha Unidade
    Então incluo uma Nova baixa


CT02 - Incluir Bem para Baixa
    Dado que acesso o sistema
    E faço login com usuário "gestorpatrimoniomovel.120101"
    E Acesso a Lista de Baixas da Minha Unidade
    E acesso a Baixa da Lista
    Então incluo um Bem para Baixa


CT03 - Concluir Baixa de Bem Móvel
    Dado que acesso o sistema
    E faço login com usuário "gestorpatrimoniomovel.120101"
    E Acesso a Lista de Baixas da Minha Unidade
    Então concluo a Baixa