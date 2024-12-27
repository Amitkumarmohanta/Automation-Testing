*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${browser}      chrome
${url}      https://testautomationpractice.blogspot.com/
*** Test Cases ***
RadiobuttonTest
    Open Browser     ${url}     ${browser}
    maximize browser window
    #Select radio button
    select radio button     gender      male
    sleep    2
    #Select check box
    select checkbox     id:sunday
    select checkbox     id:monday
    sleep  2
    #Unselect checkbox
    Unselect checkbox       id:monday
    sleep   2
    close browser




*** Keywords ***
