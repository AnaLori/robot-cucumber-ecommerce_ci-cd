*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SEARCH_FIELD}    css=input[type="text"][name="search"]
${SEARCH_BUTTON}   xpath=//*[@id="search"]/div[2]/button

*** Keywords ***
Search For Product
    [Arguments]    ${product}
    Input Text     ${SEARCH_FIELD}    ${product}
    Click Button   ${SEARCH_BUTTON}
    Wait Until Page Contains Element    css=img[alt="${product}"]    timeout=10s

Open Product By Name
    [Arguments]    ${product}
    Wait Until Element Is Visible    xpath=//div[@class="caption"]//a[contains(text(),'${product}')]    timeout=10s
    Click Element                    xpath=//div[@class="caption"]//a[contains(text(),'${product}')]
