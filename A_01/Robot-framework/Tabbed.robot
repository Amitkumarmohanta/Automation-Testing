*** Settings ***
Library  SeleniumLibrary

*** Variables ***

*** Test Cases ***
TabbedWindowsTest
    open browser        https://demo.automationtesting.in/Windows.html      chrome
    maximize browser window
    click element       Xpath://a[@href='http://www.selenium.dev']//button[@class='btn btn-info'][normalize-space()='click']
    switch window       title=Selenium
    click element       //span[normalize-space()='Downloads']
    sleep     2



    close browser

*** Keywords ***