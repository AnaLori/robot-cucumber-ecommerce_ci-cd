*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open Browser To URL
    [Arguments]    ${url}
    Open Browser    ${url}    chrome
    Maximize Browser Window

Close Browser If Open
    Run Keyword And Ignore Error    Close Browser
