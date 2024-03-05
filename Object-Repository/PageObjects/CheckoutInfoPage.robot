*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Resource.robot

*** Variables ***
${FIRSTNAME}    id=first-name
${LASTNAME}    id=last-name
${POSTCODE}    id=postal-code
${CONTINUE_BUTTON}    id=continue
${titleInfoPg}      class=title

*** Keywords ***
User Fill Information And Continue
    Element Text Should Be  ${titleInfoPg}     Checkout: Your Information
    Input Text    ${FIRSTNAME}      ${FIRSTNAME_INPUT}
    Input Text    ${LASTNAME}       ${LASTNAME_INPUT}
    Input Text    ${POSTCODE}       ${POSTALCODE_INPUT}
    Click Button    ${CONTINUE_BUTTON}