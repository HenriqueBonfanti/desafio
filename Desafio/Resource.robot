*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}                        http://automationpractice.com/index.php?controller=authentication&back=my-account
${BROWSER}                    chrome

${LINK_SIGIN}                 xpath://a[@title="Log in to your customer account"]
${EMAIL_CREATE}               //input[@name="email_create"]
${BUTTON_SUBMITCREATE}        //button[@name="SubmitCreate"]
${BUTTON_SUBMITACCOUNT}       //button[@name="submitAccount"]

${FIELD_CUSTOMER_FIRSTNAME}   //input[@name="customer_firstname"]
${FIELD_CUSTOMER_LASTNAME}    //input[@name="customer_lastname"]
${FIELD_EMAIL}                //input[@name="email"]
${FIELD_PASSWD}               //input[@name="passwd"]
${FIELD_ADDRESS1}             //input[@name="address1"]
${FIELD_CITY}                 //input[@name="city"]
${FIELD_ID_STATE}             //select[@name="id_state"]
${FIELD_POSTCODE}             //input[@name="postcode"]
${FIELD_PHONE}                //input[@name="phone"]

${ALERT_DANGER}               xpath=//*[@class="alert alert-danger"]
${ALERT_PHONE}                You must register at least one phone number.
${ALERT_LASTNAME}             lastname is required.
${ALERT_FIRSTNAME}            firstname is required.
${ALERT_EMAIL}                email is required.
${ALERT_PASSWD}               passwd is required.
${ALERT_ADDRESS1}             address1 is required.
${ALERT_CITY}                 city is required.
${ALERT_PZIPCODE}             The Zip/Postal code you've entered is invalid. It must follow this format: 00000
${ALERT_STATE}                This country requires you to choose a State.

${MYACCOUNT_VERIFY}           xpath=//*[@class="myaccount-link-list"]
${MYACCOUNT_TEXT}             Welcome to your account. Here you can manage all of your personal information and orders.

*** Keywords ***
Fechar página
    close all browsers

Que o usuário está na página de registro
    open browser         ${URL}     ${BROWSER}
    maximize browser window
    click link           ${LINK_SIGIN}
    input text           ${EMAIL_CREATE}   desafioteste17@teste.com
    click button         ${BUTTON_SUBMITCREATE}

O usuário limpa o campo Email
    wait until page contains element  ${FIELD_CUSTOMER_FIRSTNAME}
    clear element text                ${FIELD_EMAIL}

O usuário clica no botão Register
    click button                      ${BUTTON_SUBMITACCOUNT}

O sistema deve exibir o alerta com os campos obrigatórios
    wait until page contains element  ${ALERT_DANGER}
    page should contain               ${ALERT_PHONE}
    page should contain               ${ALERT_LASTNAME}
    page should contain               ${ALERT_FIRSTNAME}
    page should contain               ${ALERT_EMAIL}
    page should contain               ${ALERT_PASSWD}
    page should contain               ${ALERT_ADDRESS1}
    page should contain               ${ALERT_CITY}
    page should contain               ${ALERT_PZIPCODE}
    page should contain               ${ALERT_STATE}

O usuário preenche todos os campos obrigatórios
    wait until page contains element  ${FIELD_CUSTOMER_FIRSTNAME}
    input text                        ${FIELD_CUSTOMER_FIRSTNAME}  Nome usuário
    input text                        ${FIELD_CUSTOMER_LASTNAME}   Sobrenome usuário
    input text                        ${FIELD_PASSWD}              senha
    input text                        ${FIELD_ADDRESS1}            Endereco
    input text                        ${FIELD_CITY}                Criciuma
    select from list by label         ${FIELD_ID_STATE}            California
    input text                        ${FIELD_POSTCODE}            88888
    input text                        ${FIELD_PHONE}               999999999

O sistema deve mostrar a tela de My Account
    wait until page contains element  ${MYACCOUNT_VERIFY}
    page should contain               ${MYACCOUNT_TEXT}