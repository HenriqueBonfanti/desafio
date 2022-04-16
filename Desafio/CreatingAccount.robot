*** Settings ***
Resource        Resource.robot
Resource        Tradutor.robot

Suite Teardown  Fechar página

*** Test Cases ***
#Funcionalidade: Criacão de conta

Cenário: Validando campos obrigatórios
    Dado que o usuário está na página de registro
    Quando o usuário limpa o campo Email
    E o usuário clica no botão Register
    Então o sistema deve exibir o alerta com os campos obrigatórios

Cenário: Criando conta
    Dado que o usuário está na página de registro
    Quando o usuário preenche todos os campos obrigatórios
    E o usuário clica no botão Register
    Então o sistema deve mostrar a tela de My Account