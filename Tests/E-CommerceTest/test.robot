*** Settings ***
Library  SeleniumLibrary
Library    Collections
Resource  ../../Configs/TestConfig.robot
Resource  ../../Resources/PageObjects/LandingPage.robot
Resource  ../../Resources/PageObjects/LoginPage.robot
Resource  ../../Resources/PageObjects/ProductsPage.robot
Resource  ../../Resources/PageObjects/YourCartPage.robot
Resource  ../../Resources/PageObjects/CheckoutOverviewPage.robot
Resource  ../../Resources/PageObjects/CheckoutInfoPage.robot
Resource  ../../Resources/PageObjects/CheckoutCompletePage.robot



*** Variables ***


*** Test Cases ***
Scenario 1: Verify Cart Checkout
    Given The User Opens The Demo Page
    When The User Login To The Application With Credentials
    Then The User Adds Products To The Cart
    And User Proceed With Checkout
    Then User Fill Information And Continue
    And User Verify Checkout Overview and Complete
    Then User Should See Checkout Complete Message

Scenario 2: Verify Add all product and remove product
    Given The User Opens The Demo Page
    When The User Login To The Application With Credentials
    And User Adds Items Below Into Shoping Cart
    ...    Sauce Labs Backpack  Sauce Labs Bike Light   Sauce Labs Bolt T-Shirt    Sauce Labs Fleece Jacket     Sauce Labs Onesie     Test.allTheThings() T-Shirt (Red)
    Then User Removes Items Below From Shoping Cart
    ...    Sauce Labs Backpack  Sauce Labs Bike Light   Sauce Labs Bolt T-Shirt    Sauce Labs Fleece Jacket     Sauce Labs Onesie     Test.allTheThings() T-Shirt (Red)


Scenario3: Verify Product Sorting/Filtering
    Given The User Opens The Demo Page
    When The User Login To The Application With Credentials
    And User Select The Sort Type
    ...     Price (high to low)
    Then User Verify The Sort List
    ...     ${PriceHighLowList}
    And User Select The Sort Type
    ...     Name (Z to A)
    Then User Verify The Sort List
    ...     ${Reverselist}
