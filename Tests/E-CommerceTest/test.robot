*** Settings ***
Library  SeleniumLibrary
Library    Collections
Resource  ../../Resources/Resource.robot
Resource  ../../Object-Repository/PageObjects/LoginPage.robot
Resource  ../../Object-Repository/PageObjects/ProductsPage.robot
Resource  ../../Object-Repository/PageObjects/YourCartPage.robot
Resource  ../../Object-Repository/PageObjects/CheckoutOverviewPage.robot
Resource  ../../Object-Repository/PageObjects/CheckoutInfoPage.robot
Resource  ../../Object-Repository/PageObjects/CheckoutCompletePage.robot

Test Setup   Open App In Browser
Test Teardown  Close Browser

*** Variables ***


*** Test Cases ***
Scenario 1: Verify Cart Checkout
    [Documentation]  This test case is to login into portal, add products to cart, fill information and checkout
    [Tags]  Sanity
    Given The User Login To The Application With Credentials
    When The User Adds Products To The Cart
    And User Proceed With Checkout
    Then User Fill Information And Continue
    And User Verify Checkout Overview and Complete
    Then User Should See Checkout Complete Message

Scenario 2: Verify Add all product and remove product
    [Documentation]  This test case is to login into portal, add products to cart, and remove products from cart
    [Tags]  Smoke
    Given The User Login To The Application With Credentials
    And User Adds Items Below Into Shoping Cart
    ...    Sauce Labs Backpack  Sauce Labs Bike Light   Sauce Labs Bolt T-Shirt    Sauce Labs Fleece Jacket     Sauce Labs Onesie     Test.allTheThings() T-Shirt (Red)
    Then User Removes Items Below From Shoping Cart
    ...    Sauce Labs Backpack  Sauce Labs Bike Light   Sauce Labs Bolt T-Shirt    Sauce Labs Fleece Jacket     Sauce Labs Onesie     Test.allTheThings() T-Shirt (Red)


Scenario3: Verify Product Sorting/Filtering
    [Documentation]  This test case is to verify sorting of products
    [Tags]  Regression
    Given The User Login To The Application With Credentials
    And User Select The Sort Type
    ...     Price (high to low)
    Then User Verify The Sort List
    ...     ${PriceHighLowList}
    And User Select The Sort Type
    ...     Name (Z to A)
    Then User Verify The Sort List
    ...     ${Reverselist}