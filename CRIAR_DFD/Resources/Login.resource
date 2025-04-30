*** Settings ***
Documentation        Ações e elementos da página de Login 

Library          SeleniumLibrary

*** Keywords ***

E faço login com usuário "${usuario}"       

    Input Text           css=input[placeholder="Login"]        ${usuario}
    Input Text           css=input[placeholder="Senha"]        PE@123456

    Click Element        css=input[type='submit'] 

    Sleep    3 
