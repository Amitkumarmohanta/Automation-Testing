#Count Number of links on web page
#Extract all links from page

*** Settings ***
Library  SeleniumLibrary
*** Variables ***
*** Test Cases ***
GetAllLinksText
    open browser    https://testautomationpractice.blogspot.com/   chrome
    Maximize Browser Window
    ${count}    get element count   xpath://a
    log to console  ${count}

    @{items}    create list
    FOR  ${i}   IN RANGE      1   ${count}+1
        ${linkText}  get text    xpath:(//a)[${i}]
        log to console   ${linkText}
    END

*** Keywords ***
