*** Settings ***
Library  SeleniumLibrary
Resource    ../Resources/LoginKeywords.robot

*** Variables ***
#${browser}  chrome
${browser}  headlesschrome
${url}      https://demo.guru99.com/test/newtours/
${user}     tutorial
${pwd}      tutorial

*** Test Cases ***
Login Test
    Open my Browser     ${url}       ${browser}
    Enter UserName      ${user}
    Enter Password      ${pwd}
    Click Submit
    sleep   3
    Verify Successful login
    Close my browser


# robot LoginTest.robot


# Lecture 24 ==> Parallel Test execution in Robot Framework
# How to run Test Suites ---> robot TestCases\   OR robot TestCases\Reg*.robot OR  robot TestCases\*.robot
# How to run Tests Parallely using robotframework-robot ---> pabot --processes 2 TestCases\*.robot
# How to Save Results in Results Folder  --->  pabot --processes 2 --outputdir Results TestCases\*.robot
# How to run Tests using Single Windows Bat File
        # Go to project name -> Right click -> create new file named -> run.bat
        # Right click on run.bat file -> Run cmd script
