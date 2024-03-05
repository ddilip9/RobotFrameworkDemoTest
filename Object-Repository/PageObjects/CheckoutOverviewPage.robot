*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${FINISH_BUTTON}    id=finish
${titleOverviewPg}      class=title

*** Keywords ***
User Verify Checkout Overview and Complete
    Element Text Should Be  ${titleOverviewPg}     Checkout: Overview
    Click Button    ${FINISH_BUTTON}