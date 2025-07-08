*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${HOME_URL}        https://ecommerce-playground.lambdatest.io/

*** Keywords ***
Go To Home Page
    Open Browser    ${HOME_URL}    chrome
    Maximize Browser Window

