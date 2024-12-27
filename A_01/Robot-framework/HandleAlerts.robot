*** Settings ***
Library  SeleniumLibrary

*** Variables ***

*** Test Cases ***
HandleAlert
    open browser        https://testautomationpractice.blogspot.com/      chrome
    maximize browser window

    click element       xpath://button[@id='confirmBtn']
    sleep   2
    #Handle Alert    accept    #click OK button
    #handle alert    dismiss   #click Cancel button
    #handle alert    leave

    Alert should be present     Press a button!
    #Alert should not be present        Press a button!

    close browser

*** Keywords ***