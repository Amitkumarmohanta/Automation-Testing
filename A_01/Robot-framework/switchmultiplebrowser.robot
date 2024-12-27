*** Settings ***
Library  SeleniumLibrary

*** Variables ***

*** Test Cases ***
TabbedWindowsTest
    open browser        https://demo.automationtesting.in/Windows.html      chrome
    maximize browser window

    sleep  2
    open browser        https://www.facebook.com/     chrome
    maximize browser window
    sleep   2

    switch browser  1
    ${title_1}      get title
    log to console      ${title_1}
    sleep  2

    switch browser  2
    ${title_2}      get title
    log to console      ${title_2}


    close browser

*** Keywords ***