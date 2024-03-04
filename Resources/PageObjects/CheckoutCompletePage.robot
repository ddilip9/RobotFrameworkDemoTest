*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BACK_HOME_BUTTON}    id=back-to-products
${headerCompletePg}    class=complete-header
${titleCompletePg}      class=title

*** Keywords ***
User Should See Checkout Complete Message
    Element Text Should Be  ${titleCompletePg}     Checkout: Complete!
    Element Text Should Be  ${headerCompletePg}     Thank you for your order!
    Click Button    ${BACK_HOME_BUTTON}