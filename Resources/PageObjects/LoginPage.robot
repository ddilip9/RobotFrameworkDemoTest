*** Settings ***
Library  SeleniumLibrary
Resource   ../../Configs/TestConfig.robot

*** Variables ***
${USERNAME_TEXT_INPUT}        id=user-name
${PASSWORD_TEXT_INPUT}        id=password
${LOGIN_BTN}                  id=login-button

*** Keywords ***
The User Login To The Application With Credentials
    Input Text    ${USERNAME_TEXT_INPUT}    ${USERNAME}
    Input Text    ${PASSWORD_TEXT_INPUT}    ${PASSWORD}
    Click Button  ${LOGIN_BTN}

