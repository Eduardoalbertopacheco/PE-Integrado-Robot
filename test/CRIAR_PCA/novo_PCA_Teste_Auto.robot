*** Settings ***
Documentation        Fluxo Feliz - DFD    

Library          SeleniumLibrary
Resource        ../DFD/Base.resource
Resource        ../DFD/Resources/Logado.resource
Resource        ../PCA/PCA.resource


*** Test Cases ***
Deve Criar um PCA
    
    Dado que acesso o sistema
    E faço login com usuário "mi.gestorcompra.110402"
    E acesso a Tela de Lista de PCA
    E clico em Elaborar PCA
    Então crio o PCA

Deve Incluir um DFD
    [Tags]    edit
    Dado que acesso o sistema
    E faço login com usuário "mi.gestorcompra.110402"
    E acesso a Tela de Lista de PCA
    E clico em editar PCA
    Então edita o PCA

Deve encaminhar para Unidade Gestora
    [Tags]    encaminhar
    Dado que acesso o sistema
    E faço login com usuário "mi.gestorcompra.110402"
    E acesso a Tela de Lista de PCA
    E clico em editar PCA
    Então encaminha o PCA

Deve deliberar para Unidade Competente 
    [Tags]    deliberar
    Dado que acesso o sistema
    E faço login com usuário "autoridade.110402"
    E acesso a Tela de Lista de PCA
    E clico em editar PCA
    Então delibera o PCA

Unidade Competente delibera 
    [Tags]    fim
    Dado que acesso o sistema
    E faço login com usuário "edu.autoridadecompetentecpf.110402"
    E acesso a Tela de Lista de PCA
    E clico em editar PCA
    E verifica a Auditoria
    Então delibera o PCA 
