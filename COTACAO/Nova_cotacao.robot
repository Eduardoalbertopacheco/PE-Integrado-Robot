*** Settings ***
Documentation    Cenário: Criar uma nova cotação - Fluxo Feliz
Library          SeleniumLibrary
Resource        ../Resources/Resource_login.robot
Resource        ../Resources/Resource_Cotacao.robot

*** Test Cases ***

CT01 - Criar uma nova cotação

    Dado que acesso o sistema
    E faço login com usuário "cotador.110402"
    E acesso a lista de cotações
    E clico em Inclir Cotação
    Quando preencho todos os dados da Aba Dados Gerais
    Então verifico que os dados foram salvos
    E vejo a Auditoria da Cotação


CT02 - Incluir SC na Cotação

    Dado que acesso o sistema
    E faço login com usuário "cotador.110402"
    E acesso a lista de cotações
    E seleciono o filtro todas a cotações
    E clico na cotação da lista
    Então incluo a SC na Cotação

CT03 - Agendar Cotação

    Dado que acesso o sistema
    E faço login com usuário "cotador.110402"
    E acesso a lista de cotações
    E seleciono o filtro todas a cotações
    E seleciono a cotação da lista
    Então agendo a cotação



