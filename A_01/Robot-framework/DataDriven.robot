#Specify test data in the script
#Read test data from excel files(.xlsx)
#Read test data from CSV files(.csv)

*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/login_resource.robot
Suite Setup  Open my browser
Suite Teardown  Close browser
Test Template  Invalid login

*** Test Cases ***
Right user wrong pwd
    [Template]    Invalid login
#    admin@yourstore.com    ${EMPTY}
    Admin       admin1
    sleep  2
Wrong user right pwd
     [Template]    Invalid login
#    admin@yourstore.com    ${EMPTY}
    Admin1       admin123
    sleep   2
right user right pwd   #error
    [Template]    Valid login
    Admin       admin123
    sleep   2
*** Keywords ***

Invalid login
    [Arguments]     ${username}     ${password}
    Input username     ${username}
    Input password     ${password}
    Click login button
    Error message should be visible

Valid login  #error
    [Arguments]     ${username}     ${password}
    Input username     ${username}
    Input password     ${password}
    Click login button
    sleep  2
    Dashboard page should be visible
    Logout

#robot DataDriven.robot