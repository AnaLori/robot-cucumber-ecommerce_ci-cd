*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_URL}        https://ecommerce-playground.lambdatest.io/index.php?route=account/login
${EMAIL_FIELD}      id=input-email
${PASSWORD_FIELD}   id=input-password
${LOGIN_BUTTON}     xpath=//input[@type='submit']

*** Keywords ***
Go To Login Page
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-gpu
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --headless
    Create WebDriver    Chrome    chrome_options=${options}
    Go To    ${LOGIN_URL}
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
