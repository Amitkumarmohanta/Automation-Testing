*** Settings ***
Library  SeleniumLibrary
Variables   ../PageObjects/Locators.py

*** Keywords ***
Open my Browser
    [Arguments]  ${url}     ${browser}
    open browser    ${url}      ${browser}
    Maximize Browser Window

Enter UserName
    [Arguments]  ${username}
    Input text  ${txt_loginUserName}   ${username}

Enter Password
    [Arguments]  ${password}
    Input text  ${txt_loginPassword}    ${password}

Click Submit
    click button    ${btn_signIn}

Verify Successful login
    title should be      Login: Mercury Tours

Close my browser
    close all browsers