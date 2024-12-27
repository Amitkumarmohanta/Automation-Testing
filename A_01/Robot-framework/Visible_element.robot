#working with Web Element
#Text box/input box
#-- visibility status
#-- Enabled Status
#-- provide value
#--clearing value
#--verified title of the page

*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${browser}     chrome
${url}        https://demo.nopcommerce.com/

*** Test Cases ***
TestingInputbox
    Open Browser        ${browser}      ${url}
    maximize browser window
    title should be     nopCommerce demo store
    click link      xpath:/html/body/div[6]/div[1]/div[1]/div[2]/div[1]/ul/li[2]/a  #login
    ${"emai_text"}      set variable        id:Email

    element should be visible        ${"emai_text"}
    element should be enabled       ${"emai_text"}
    input text      ${"emai_text"}      amitmohanta688@gmail.com
    sleep  3
    clear element text      ${"emai_text"}
    sleep  2
    close browser


*** Keywords ***
