*** Settings ***
Library  SeleniumLibrary
Resource   ../../Configs/TestConfig.robot


*** Keywords ***
The User Opens The Demo Page
        Open Browser    ${ENV_URL}  ${browser}
        Maximize Browser Window