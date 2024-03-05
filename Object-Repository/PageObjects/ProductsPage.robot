*** Settings ***
Library  SeleniumLibrary
Library    Collections

*** Variables ***
${ADD_TO_CART_ITEM1}    id=add-to-cart-sauce-labs-backpack
${ADD_TO_CART_ITEM2}    id=add-to-cart-sauce-labs-bike-light
${SHOPPING_CART}        class=shopping_cart_link

${Originallist}  ['Sauce Labs Backpack', 'Sauce Labs Bike Light', 'Sauce Labs Bolt T-Shirt', 'Sauce Labs Fleece Jacket', 'Sauce Labs Onesie', 'Test.allTheThings() T-Shirt (Red)']
${Reverselist}  ['Test.allTheThings() T-Shirt (Red)', 'Sauce Labs Onesie', 'Sauce Labs Fleece Jacket', 'Sauce Labs Bolt T-Shirt', 'Sauce Labs Bike Light', 'Sauce Labs Backpack']
${PriceHighLowList}  ['Sauce Labs Fleece Jacket', 'Sauce Labs Backpack', 'Sauce Labs Bolt T-Shirt', 'Test.allTheThings() T-Shirt (Red)', 'Sauce Labs Bike Light', 'Sauce Labs Onesie']
${PriceLowHighList}  ['Sauce Labs Onesie', 'Sauce Labs Bike Light', 'Sauce Labs Bolt T-Shirt', 'Test.allTheThings() T-Shirt (Red)', 'Sauce Labs Backpack', 'Sauce Labs Fleece Jacket']

@{INV_ITEM_NAME}    xpath=//div[@class='inventory_item_name ']

*** Keywords ***
The User Adds Products To The Cart
    Title Should be     Swag Labs
    Click Button    ${ADD_TO_CART_ITEM1}
    Click Button    ${ADD_TO_CART_ITEM2}
    Click Element    ${SHOPPING_CART}

User Adds Items Below Into Shoping Cart
        [Arguments]    @{item_list}
        FOR    ${item_name}    IN    @{item_list}
            ${ADD_REMOVE_CART_LOCATOR}   Set Variable   //div[contains(@class, 'inventory_item_name')][text()='${item_name}']/../../..//button[contains(text(),'Add to cart')]
            Click Button  ${ADD_REMOVE_CART_LOCATOR}
        END

User Removes Items Below From Shoping Cart
        [Arguments]    @{item_list}
        FOR    ${item_name}    IN    @{item_list}
            ${ADD_REMOVE_CART_LOCATOR}   Set Variable   //div[contains(@class, 'inventory_item_name')][text()='${item_name}']/../../..//button[contains(text(),'Remove')]
            Click Button  ${ADD_REMOVE_CART_LOCATOR}
        END

User Select The Sort Type
       [Arguments]    @{sort_type}
        FOR    ${sort_name}    IN    @{sort_type}
            ${SELECT_SORT_TYPE}   Set Variable   xpath=//select[contains(@class, 'product_sort_container')]//option[text()='${sort_name}']
            Click Element  ${SELECT_SORT_TYPE}
        END

User Verify The Sort List
        [Arguments]    @{sort_Text}
        @{ItemNameList}    Create List
        @{ItemName}=   Get WebElements  @{INV_ITEM_NAME}
        FOR  ${each}    IN   @{ItemName}
            ${GetInventoryText}=    Get Text    ${each}
            Append To List  ${ItemNameList}   ${GetInventoryText}
        END
        log to console     ${ItemNameList}
        Should Be Equal As Strings    ${ItemNameList}   @{sort_Text}