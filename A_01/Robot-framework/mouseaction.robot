
*** Settings ***
Library  SeleniumLibrary

*** Variables ***

*** Test Cases ***
mouseoperations
     #(right click Action)
    open browser        https://swisnl.github.io/jQuery-contextMenu/demo.html      chrome
    maximize browser window
    open context menu       xpath://span[@class='context-menu-one btn btn-neutral']
    sleep   2
    #double click action
    GO TO   https://testautomationpractice.blogspot.com/
    maximize browser window
    double click element        xpath://button[normalize-space()='Copy Text']
    sleep   2

    #drag & drop
    go to       http://www.dhtmlgoodies.com/scripts/drag-drop-custom/demo-drag-drop-3.html
    maximize browser window
    drag and drop       id:box6     id:box106
    drag and drop       id:box1     id:box101
    drag and drop       id:box2     id:box102
    sleep   2

    close browser

*** Keywords ***
