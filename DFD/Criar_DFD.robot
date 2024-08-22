*** Settings ***
Documentation        Fluxo Feliz - DFD    

Library          SeleniumLibrary
Resource        ../DFD/Base.resource
Resource        ../DFD/Resources/Logado.resource
Resource        ../DFD/Resources/DFD.resource


*** Test Cases ***
Deve Criar um DFD 
    
    Dado que acesso o sistema
    E faço login com usuário "mi.gestorcompra.110402"    
    E acesso a Tela de Lista de DFDs
    E seleciona o filtro para todos documentos
    E clica em criar DFD
    Então cria DFD 


    Sleep    5

