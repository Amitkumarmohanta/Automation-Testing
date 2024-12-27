#browser related *** keywords ***
#GO TO
#GO BACK
#GET LOCATION


*** Settings ***
Library  SeleniumLibrary

*** Variables ***

*** Test Cases ***
navigationkey
    open browser        https://www.google.com/      chrome
    maximize browser window
    ${Loc}=      get location
    log to console      ${Loc}
    sleep       2

    Go To       https://www.facebook.com/
    ${Loc2}=      get location
    log to console      ${Loc2}
    sleep   2

    Go Back
    ${Loc3}      get location
    log to console      ${Loc3}
    sleep       2

    close browser

*** Keywords ***
