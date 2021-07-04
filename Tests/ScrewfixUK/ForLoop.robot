*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${url1}  https://www.google.com
${url2}  https://datatables.net/examples/index
${browser1}  gc
${browser2}  gc
${Agree Google T&C Button}  //*[@id="L2AGLb"]/div

*** Test Cases ***
FOR LOOP Condition Validation
    Launch Google and Accept Terms & Conditions
    Enter Search work into Google
    For Loop to Find elements

FOR LOOP Condition Validation2
    For Loop to Find Elements2

*** Keywords ***
Launch Google and Accept Terms & Conditions
    Open Browser  ${url1}  ${browser1}
    Click Element  ${Agree Google T&C Button}

Enter Search work into Google
    Click Element  //input[@title='Search']
    Input Text  //input[@title='Search']  Clock
    Wait Until Page Contains Element  //div[@class='lJ9FBc']//input[@name='btnK']
    Click Element  //div[@class='lJ9FBc']//input[@name='btnK']

For Loop to Find elements
    ${elements on page}=  Get Webelements  //*[@id="rso"]/div
    FOR  ${elements}  IN  ${elements on page}
    ${text}=  Get Text  ${elements}
    END

For Loop to Find Elements2
        Open Browser  ${url2}  ${browser2}

        ${elements on page}=  Get Webelements  //div[@class='content']//div[1]//ul[1]
        FOR  ${elements}  IN  ${elements on page}
        ${text}=  Get Text  ${elements}
        END

