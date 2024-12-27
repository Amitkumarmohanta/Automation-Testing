*** Settings ***
Library  SeleniumLibrary

*** Variables ***

*** Test Cases ***
Handle Frames
    open browser        https://www.selenium.dev/selenium/docs/api/java/index      chrome
    maximize browser window

    select frame        Locator[id,name,xpath]
    click link      org.openqa.selenium
    unselect frame
    sleep   2

    select frame        Locator[id,name,xpath]
    click link      org.openqa.selenium
    unselect frame
    sleep   2

    select frame        Locator[id,name,xpath]
    click link      org.openqa.selenium
    unselect frame

    close browser

*** Keywords ***