*** Settings ****


Resource    ${EXECDIR}/resources/base.robot
Resource    ../resources/pages/signup.robot

*** Test Cases ***
Deve cadastrar um novo usuário


    ${user}   Create Dictionary
       ...    name=Maria Maria
       ...    email=mariamaria@gmail.com
       ...    password=sheila1234   

    Remove User By Email        ${user}[email]
    
    Start Session
    Go to signup    
    Register user        ${user}
    Notice should be     Boas vindas ao Mark85, o seu gerenciador de tarefas.


Usuário duplicado

    [tags]    dup

        ${user}   Create Dictionary
       ...    name=Sheila Aguiar
       ...    email=sheilaaguiar@gmail.com
       ...    password=sheila1234   


    Remove User By Email    ${user}[email]
    Start Session
    Go to signup
    Register user    ${user}
    Register user    ${user}
    Notice should be        Oops! Já existe um cadastro com e-mail informado. 

# Nome deve ser obrigatório
# ???
# Email deve ser obrigatório
# ???
# Senha deve ser obrigatória
# ???


    





