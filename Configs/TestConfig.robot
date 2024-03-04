*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${ENV_URL}  https://www.saucedemo.com/

# Browser config
${browser}  Chrome

# Standard User
${USERNAME}     standard_user
${PASSWORD}     secret_sauce

#Checkout Info
${FIRSTNAME_INPUT}      Tony
${LASTNAME_INPUT}        Stark
${POSTALCODE_INPUT}      3113