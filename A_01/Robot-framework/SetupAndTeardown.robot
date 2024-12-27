#Test Setup - will run before every Test Case
#Test Teardown - will run after every Test Case
#Suite Setup - will run before every Test Suite
#Suite Teardown - will run after every Test Suite

*** Settings ***
Suite Setup  log to console     Opening browser
Suite Teardown  log to console      Closing browser

Test Setup  log to console      Login to application
Test Teardown  log to console       Logout from application

*** Test Cases ***
TC1 Prepaid Recharge
    log to console      This is prepaid recharge test case
TC2 Postpaid Recharge
    log to console      This is postpaid recharge test case
TC3 search
    log to console      This is Search test case
TC4 Advanced Search
    log to console      This is advanced search test case


# robot SetupAndTeardown.robot