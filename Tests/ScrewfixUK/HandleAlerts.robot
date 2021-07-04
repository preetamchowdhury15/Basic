*** Settings ***
Library  SeleniumLibrary


*** Test Cases ***
Handling Alerts

    Open Browser  https://screwfix:qb0Jz9XyykUD@mcstaging.screwfix.fr/  Chrome
    Sleep  4s
    #Handle Alert  DISMISS
    #Alert Should Be Present  text=Sign in  action=ACCEPT
    Input Text Into Alert  screwfix  action=ACCEPT





    #Select Frame  //*[@id="pop-frame09248737046044169"]
    #Input Text Into Alert  screwfix  action=ACCEPT