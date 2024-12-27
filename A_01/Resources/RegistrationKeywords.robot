*** Settings ***
Library  SeleniumLibrary
Variables   ../PageObjects/Locators.py

*** Keywords ***
Open my Browser
    [Arguments]     ${url}     ${browser}
    open browser    ${url}      ${browser}
    Maximize Browser Window

Click Register Link
    click link      ${link_Reg}

Enter FirstName
    [Arguments]  ${firstname}
    Input text  ${txt_firstName}   ${firstname}

Enter LastName
    [Arguments]  ${lastname}
    Input text  ${txt_lastName}   ${lastname}

Enter Phone
    [Arguments]  ${phone}
    Input text  ${txt_phone}   ${phone}

Enter Email
    [Arguments]  ${email}
    Input text  ${txt_email}   ${email}

Enter Address1
    [Arguments]  ${add1}
    Input text  ${txt_add1}   ${add1}

#Enter Address2
#    [Arguments]  ${add2}
#    Input text  ${txt_add2}   ${add2}

Enter City
    [Arguments]  ${city}
    Input text  ${txt_city}   ${city}

Enter State
    [Arguments]  ${state}
    Input text  ${txt_state}   ${state}

Enter Postal Code
    [Arguments]  ${postalCode}
    Input text  ${txt_postCode}   ${postalCode}

Select Country
    [Arguments]  ${country}
    Select from list by label  ${drp_country}   ${country}

Enter User Name
    [Arguments]  ${username}
    Input text  ${txt_userName}   ${username}

Enter Password
    [Arguments]  ${password}
    Input text  ${txt_Password}   ${password}

Enter Confirmed Password
    [Arguments]  ${confirmPassword}
    Input text  ${txt_confirmedPassword}   ${confirmPassword}

Click Submit
    click button       ${btn_submit}

Verify Successful Registration
    page should contain     Thank you for registering.

close my browsers
    close all browsers



