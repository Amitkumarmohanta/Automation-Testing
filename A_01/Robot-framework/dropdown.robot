*** Settings ***
Library     SeleniumLibrary
*** Variables ***
${browser}      chrome
${url}      https://testautomationpractice.blogspot.com/

*** Test Cases ***
HandleDropdown
    Open Browser    ${url}      ${browser}
    maximize browser window

    select from list by label       id:country      India
    sleep   2
    select from list by value       id:country      canada
    sleep   2
    select from list by index       id:country      7
    sleep   2
    # select list box
    select from list by label       id:colors       Blue
    select from list by label       id:colors       Green
    sleep  2
    Unselect from list by label        id:colors       Green
    sleep   2
    close browser

*** Keywords ***
