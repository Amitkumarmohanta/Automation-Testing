#User define keywords  without arguments
#*** Settings ***
#Library  SeleniumLibrary
#
#*** Variables ***
#${url}      https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
#${browser}  chrome
#
#*** Test Cases ***
#TC1
#    Launch Browser
#    Wait Until Element Is Visible    name:username    timeout=10s
#    Input Text                       name:username    Admin
#    Wait Until Element Is Visible    name:password    timeout=10s
#    Input Text                       name:password    admin123
#    Close Browser
#
#*** Keywords ***
#Launch Browser
#    Open Browser    ${url}    ${browser}
#    Maximize Browser Window


#User define keywords  with arguments
#*** Settings ***
#Library  SeleniumLibrary
#
#*** Variables ***
#${url}      https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
#${browser}  chrome
#
#*** Test Cases ***
#TC1
#    Launch Browser       ${url}    ${browser}
#    Wait Until Element Is Visible    name:username    timeout=10s
#    Input Text                       name:username    Admin
#    Wait Until Element Is Visible    name:password    timeout=10s
#    Input Text                       name:password    admin123
#    Close Browser
#
#*** Keywords ***
#Launch Browser
#    [Arguments]       ${appurl}    ${appbrowser}
#    Open Browser     ${appurl}    ${appbrowser}
#    Maximize Browser Window
#

#With arguments and return value

*** Settings ***
Library  SeleniumLibrary
Resource     ../Resources/resources.robot

*** Variables ***
${url}      https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${browser}  chrome

*** Test Cases ***
TC1
    ${Pagetitle}=      Launch Browser       ${url}    ${browser}
    log to console       ${Pagetitle}
    log     ${Pagetitle}    #   print in report as log report
    Wait Until Element Is Visible    name:username    timeout=10s
    Input Text                       name:username    Admin
    Wait Until Element Is Visible    name:password    timeout=10s
    Input Text                       name:password    admin123
    Close Browser








#   robot userkeywords.robot