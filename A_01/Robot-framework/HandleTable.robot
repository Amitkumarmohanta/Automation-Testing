Count Number of Rows in a Table
Count Number of Columns in a Table
Get data from Table
Validations on Table

*** Settings ***
Library  SeleniumLibrary
*** Variables ***
*** Test Cases ***
HandleTable
    open browser    https://testautomationpractice.blogspot.com/   chrome
    Maximize Browser Window
    sleep   2
#    ${rows}     get element count   xpath://table[@name='BookTable']/tbody/tr
#    log to console  ${rows}
#
#    ${cols}     get element count   xpath://table[@name='BookTable']/tbody/tr[1]/th
#    log to console  ${cols}
#
#    ${data}     get text    xpath://table[@name='BookTable']/tbody/tr[4]/td[2]
#    log to console  ${data}
#
#    ${getAllText}       get text    xpath://table[@name='BookTable']/tbody
#    log to console  ${getAllText}

    #For Validation
    table row should contain    xpath://table[@name='BookTable']    4   Learn JS
    table column should contain    xpath://table[@name='BookTable']    2   Author
    table cell should contain   xpath://table[@name='BookTable']    5   2   Mukesh
    table header should contain   xpath://table[@name='BookTable']  Author

*** Keywords ***

#   robot HandleTable.robot