*** Settings ***
Library  SeleniumLibrary
Resource   ../Resources/login_resource.robot
Library  DataDriver  ../Test Data/logindata.xlsx   sheet_name=Sheet1
Suite Setup  Open my browser
Suite Teardown   Close browser

