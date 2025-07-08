*** Settings ***
Resource    ../features/steps.robot

*** Test Cases ***
Login Successfully
    Im In Login Page
    Fill In The Email And Password    anatestedesafio@gmail.com    senhaenjoeiteste
    Click On The Submit Button
    Validate The Title After Login
    Validate The Search Products Field After Login

Search For Canon
    Im In Home Page
    I Search For The Product    Canon EOS 5D
    Search Results Must Be Shown

Add Product To Cart
    Im In Home Page
    I Search For The Product    iPod Nano
    Open The Product    iPod Nano
    I Add The Product To The Cart
    I Should See The Product In The Cart Page    iPod Nano

Invalid Login
    Im In Login Page
    Fill In The Email And Password    anatestedesafio@gmail.com    sen7777joeit
    Click On The Submit Button
    Invalid Credentials Message Must Be Shown

