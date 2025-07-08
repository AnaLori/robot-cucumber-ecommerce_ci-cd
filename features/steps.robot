*** Settings ***
Resource    ../resources/pages/LoginPage.robot
Resource    ../resources/pages/HomePage.robot
Resource    ../resources/pages/SearchPage.robot
Resource    ../resources/pages/CartPage.robot
Resource    ../resources/keywords.robot
Variables   ../variables/variables.robot
Library     SeleniumLibrary
Library     Collections

*** Keywords ***
Im In Login Page
    Go To Login Page

Fill In The Email And Password
    [Arguments]    ${email}    ${password}
    Input Email    ${email}
    LoginPage.Input Password    ${password}

Click On The Submit Button
    Click Login Button

Validate The Title After Login
    Title Should Be    My Account

Validate The Search Products Field After Login
    Page Should Contain Element    css=input[type="text"][name="search"]

Im In Home Page
    Go To Home Page

I Search For The Product
    [Arguments]    ${product}
    Search For Product    ${product}

Search Results Must Be Shown
    Wait Until Page Contains Element    css=div.product-thumb
    Page Should Contain Element    css=div.product-thumb

Open The Product
    [Arguments]    ${product}
    Open Product By Name    ${product}

I Add The Product To The Cart
    Add Product To Cart

I Should See The Product In The Cart Page
    [Arguments]    ${product}
    Go To Cart Page
    Wait Until Page Contains Element    ${CART_PRODUCT_ROW}    timeout=15
    Product Should Be In Cart    ${product}

Invalid Credentials Message Must Be Shown
    Wait Until Page Contains    Warning: No match for E-Mail Address and/or Password.
    Page Should Contain    Warning: No match for E-Mail Address and/or Password.
