*** Settings ***
Library  SeleniumLibrary

*** Variables ***



*** Test Cases ***
This test is to validate the following window handles

    Open Browser  https://www.salesforce.com/uk/?ir=1  Chrome
    Wait Until Page Contains Element  //*[@id="onetrust-accept-btn-handler"]  timeout=05s
    Click Element  //*[@id="onetrust-accept-btn-handler"]
    Click Element  //span[normalize-space()='Try For Free']
    Sleep  3s
    #Click Element  //h3[contains(text(),'Mobile Phones – Smartphones | Carphone Warehouse')]

    @{WindowHandles}=  Get Window Handles
    Sleep  3s

    @{WindowIdentifier}=  Get Window Identifiers
    Sleep  3s

    @{WindowNames}=  Get Window Names
    Sleep  3s

    @{WindowTitle}=  Get Window Titles
    Sleep  3s

    Set Window Position  100  200
    ${x}  ${y}=  Get Window Position
    Log  ${x}
    Log  ${y}
    Sleep  4s

    Set Window Size  800  600
    ${width}  ${height}=  Get Window Size
    Log  ${width}
    Log  ${height}
    Sleep  3s

    Switch Window  ${WindowHandles}[1]
    Log  ${WindowHandles}[1]
    Sleep  3s

    Close Window
    Sleep  2s

    Switch Window  ${WindowHandles}[0]
    Close Window






