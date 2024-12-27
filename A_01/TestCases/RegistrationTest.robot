*** Settings ***
Library  SeleniumLibrary
Resource    ../Resources/RegistrationKeywords.robot

*** Variables ***
#${browser}  chrome
${browser}  headlessfirefox
${url}      https://demo.guru99.com/test/newtours/

*** Test Cases ***
Registration Test
    Open my Browser     ${url}  ${browser}
    Click Register Link
    Enter FirstName     David
    Enter LastName      John
    Enter Phone         1234567890
    Enter Email         davidJohn@gmail.com
    Enter Address1      Toronto
#    Enter Address2      Canada
    Enter City          Toronto
    Enter State         Brampton
    Enter Postal Code   L3S 1E7
    Select Country      CANADA
    Enter User Name     johnxyz
    Enter Password      johnxyz
    Enter Confirmed Password    johnxyz
    Click Submit
    Verify Successful Registration
    close my browsers


# robot RegistrationTest.robot

