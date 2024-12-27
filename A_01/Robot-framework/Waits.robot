*** Settings ***
Library     SeleniumLibrary
Library   SeleniumLibrary
*** Variables ***
${browser}      chrome
${url}      https://demowebshop.tricentis.com/register

*** Test Cases ***
RegTest
    Open Browser    ${url}      ${browser}
    maximize browser window
    #Set Selenium Speed  3s   # take pause for 3 seconds for every line of code
    #Set Selenium Timeout  10s  # it will work for wait until page contains
    #wait until page contains        Register   # it will wait for the page until not found but default time for wait 5s
    set selenium implicit wait      5s
    #sleep   3

    select radio button     Gender     M
    input text      name:FirstName      Amit
    input text      name:LastName       Kumar
    input text      name:Email          amit@gmail.com
    input text      name:Password       1234
    input text      name:ConfirmPassword          1234
    close browser
