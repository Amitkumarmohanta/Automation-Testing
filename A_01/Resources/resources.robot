*** Settings ***
Library     SeleniumLibrary

*** Keywords ***
Launch Browser
    [Arguments]       ${appurl}    ${appbrowser}
    Open Browser     ${appurl}    ${appbrowser}
    Maximize Browser Window
    ${title}=       get title
    [Return]        ${title}
