*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${CART_URL}         https://ecommerce-playground.lambdatest.io/index.php?route=checkout/cart
${CHECKOUT_URL}     https://ecommerce-playground.lambdatest.io/index.php?route=checkout/checkout
${ADD_TO_CART_BTN}  css=#entry_216843 > button
${CART_PRODUCT_ROW}    xpath=//div[@class="table-responsive"]//a


*** Keywords ***
Add Product To Cart
    Wait Until Element Is Visible    ${ADD_TO_CART_BTN}    timeout=10
    Click Button    ${ADD_TO_CART_BTN}

Go To Cart Page
    Go To    ${CHECKOUT_URL}
    Wait Until Page Contains Element    ${CART_PRODUCT_ROW}    timeout=15

Product Should Be In Cart
    [Arguments]    ${product_name}
    ${found}=    Set Variable    ${False}
    ${rows}=    Get WebElements    ${CART_PRODUCT_ROW}
    
    FOR    ${row}    IN    @{rows}
        ${name}=    Get Text    ${row}
        ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${row}
        IF    ${is_visible} and '${product_name}' in '${name}'
            ${found}=    Set Variable    ${True}
            Log    Product ${product_name} found in cart
            Exit For Loop
        END
    END
    
    IF    not ${found}
        Capture Page Screenshot    cart_debug.png
        Fail    Product '${product_name}' not found in cart
    END

