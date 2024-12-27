*** Settings ***

*** Test Cases ***
TC1 User Registration Test
    [Tags]  regression
    log to console      This is user registration test
    log to console      user registration test is over

TC2 Login Test
    [Tags]  sanity
    log to console      This is login test
    log to console      Login test is over

TC3 Change User settings
    [Tags]  regression
    log to console      This is changing user settings test
    log to console      Change user setting test is over

TC4 Logout Test
    [Tags]  sanity
    log to console      This is logout test
    log to console      logout test is over

# Commands to run code in terminal
# robot --include=sanity TagAndGroup.robot
# robot -i sanity -i regression TagAndGroup.robot
# robot -e regression TagAndGroup.robot
# robot -i regression -e sanity TagAndGroup.robot

# robot TagAndGroup.robot