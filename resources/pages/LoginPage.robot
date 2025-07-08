*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_URL}        https://ecommerce-playground.lambdatest.io/index.php?route=account/login
${EMAIL_FIELD}      id=input-email
${PASSWORD_FIELD}   id=input-password
${LOGIN_BUTTON}     xpath=//input[@type='submit']

*** Keywords ***
Go To Login Page
    Open Browser    ${LOGIN_URL}    chrome
    Maximize Browser Window


Input Email
    [Arguments]    ${email}
    Input Text    ${EMAIL_FIELD}    ${email}

Input Password
    [Arguments]    ${password}
    Input Text    ${PASSWORD_FIELD}    ${password}

Click Login Button
    Page Should Contain Button   ${LOGIN_BUTTON}
    Click Button    ${LOGIN_BUTTON}
