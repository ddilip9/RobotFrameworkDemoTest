*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${CHECKOUT_BUTTON}    id=checkout
${titleCartPg}      class=title

*** Keywords ***
User Proceed With Checkout
    Element Text Should Be  ${titleCartPg}  Your Cart
    Click Button    ${CHECKOUT_BUTTON}