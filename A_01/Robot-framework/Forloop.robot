*** Settings ***
*** Variables ***
*** Test Cases ***

forloop1

     FOR   ${i}   IN RANGE   1   10
     Log to console      ${i}
     END

    #For loop 2
    FOR   ${i}  IN      1  2  3  4  5
    log to console  ${i}
    END

#    Forloop 3

    @{item}    create list  1   2   3   4   5   6
    FOR    ${i}  IN    @{item}
    log to console    ${i}
    END

    #Forloop4
    FOR   ${i}   IN      Ram  Sham  Hari  Pintu  banda
    log to console  ${i}
    END

    #Forloop 5
    @{item}    create list  Ram  Sham  Hari  Pintu banda
    FOR    ${i}  IN    @{item}
    log to console    ${i}
    END

     #forloop 6
ForLoopTest2
    @{item}    create list  "Ram"  "Sham"  "Hari"  "Pintu" "banda"
    FOR    ${i}   IN    @{item}
    exit for loop if     ${i}== "Hari"
    log to console    ${i}
    END



*** Keywords ***
# robot Forloop.robot