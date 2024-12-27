
*** Settings ***
Library  SeleniumLibrary

*** Variables ***
#${Login url}    https://admin-demo.nopcommerce.com/login?ReturnUrl=%2Fadmin%2F
${Login url}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${browser}      chrome

*** Keywords ***
Open my browser
    open browser     ${Login url}     ${browser}
    Maximize Browser Window
    sleep  5

#Handle human verification
#    [Documentation] Handle CAPTCHA or human verification steps
#    Wait Until Page Contains Element    css:#captcha-box    timeout=10s
#    Log To Console    Human verification detected, please solve manually.
#    Pause Execution

Close browser
    close all browsers

Open login page
    go to  ${Login url}

Input username
    [Arguments]    ${username}
#    input text      xpath://input[@id='Email']     ${username}
    input text      name:username     ${username}

Input password
    [Arguments]  ${password}
#    input text      xpath://input[@id='Password']    ${password}
    input text      name:password    ${password}
Click login button
#    click element       xpath://button[@class='button-1 login-button']
    click element       //button[normalize-space()='Login']
    sleep  5
Click logout link
#    click link       xpath://a[normalize-space()='Logout']
    click link                 xpath://a[normalize-space()='Logout']

# For Validation
Error message should be visible
#    wait untill page should contain      Login was unsuccessful
     page should contain   Invalid credentials

Dashboard page should be visible
#    page should contain      Dashboard
     wait until page should contain      Dashboard

Logout
    click element       xpath://a[normalize-space()='Logout']