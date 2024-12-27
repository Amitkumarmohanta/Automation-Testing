*** Settings ***
Library  SeleniumLibrary

*** Variables ***

*** Test Cases ***
MyTestCase
    open browser        https://demowebshop.tricentis.com/register      chrome
    maximize browser window

    open browser        https://testautomationpractice.blogspot.com/      chrome
    maximize browser window

    #close browser
    close all browsers
*** Keywords ***
