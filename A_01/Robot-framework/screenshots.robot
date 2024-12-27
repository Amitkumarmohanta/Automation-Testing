
*** Settings ***
Library  SeleniumLibrary

*** Variables ***

*** Test Cases ***
screenshots
    open browser        https://www.google.com/      chrome
    maximize browser window
    input text      xpath://textarea[@id='APjFqb']      Pintu Bando
    sleep   2

    capture element screenshot      xpath://textarea[@id='APjFqb']      element.png
    capture page screenshot         page.png
    sleep       2
    close browser

*** Keywords ***
