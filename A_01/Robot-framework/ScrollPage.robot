#SCROLLING PAGE
#Scrolling page till it reach *** Test Cases pixel number
#scrolling page till find the element on the page
#scrolling page till the buttom


*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
ScrollingTest
         Open Browser  https://testautomationpractice.blogspot.com/    chrome
         Maximize Browser Window
         Sleep  2
#         Execute Javascript    window.scrollTo(0,1000)
#         Scroll Element Into View     Xpath://*[@id="HTML1"]/div[1]/table
         Execute Javascript   window.scrollTo(0,document.body.scrollHeight)
         sleep  2

         Execute Javascript   window.scrollTo(0,-document.body.scrollHeight)
         Sleep  2
         Close Browser