*** Settings ***
Library  SeleniumLibrary
Library  DataDriver  ../../TestData/Data.xlsx

Test Setup   Open my Browser
Test Teardown  Close Browser
Test Template  Add Remove Items From Excel

*** Variables ***
${ENV_URL}  https://www.saucedemo.com/
${browser}  Chrome
${USERNAME}     standard_user
${PASSWORD}     secret_sauce
${ProductTitle}  xpath=//*[@id="header_container"]/div[2]/span

*** Test Cases ***
Add Remove Items From Excel  ${additem}  ${removeitem}     Default Data

*** Keywords ***
Open my Browser
    SeleniumLibrary.Open Browser    ${ENV_URL}   ${browser}

Add Remove Items From Excel
    [Documentation]  The Test data for this Test case is drived from Data.xlsx to handle large volume of Test data
    [Arguments]   ${additem}  ${removeitem}
    input text  id=user-name    standard_user
    input text  id=password     secret_sauce
    Click Button  id=login-button

    Wait Until Element Is Visible  ${ProductTitle}

    ${ADD_CART}   Set Variable   //div[contains(@class, 'inventory_item_name')][text()='${additem}']/../../..//button[contains(text(),'Add to cart')]
    Wait Until Element Is Visible  ${ADD_CART}
    Click Button  ${ADD_CART}

    ${REMOVE_CART}   Set Variable   //div[contains(@class, 'inventory_item_name')][text()='${removeitem}']/../../..//button[contains(text(),'Remove')]
    Wait Until Element Is Visible  ${REMOVE_CART}
    Click Button  ${REMOVE_CART}