*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${launch SFX UK JT}  https://int2.dev.screwfix.com/
${Launch Chrome }  gc


*** Keywords ***
Launch Screwfix UK and accept cookies
    Open Browser  ${launch SFX UK JT}  ${Launch Chrome }
    Wait Until Page Contains Element  //*[@class="truste_box_overlay"]  timeout=05s
    Select Frame  //*[@title='TrustArc Cookie Consent Manager']  #Cookies Frame
    Wait Until Page Contains Element  //a[contains(text(),'Accept Cookies')]  timeout=05s
    Click Element  class:call  #Accept Cookies Button

Quit Browser
    Close Browser
