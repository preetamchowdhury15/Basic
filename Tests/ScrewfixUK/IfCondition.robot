*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${url1}  https://www.amazon.co.uk/
${url2}  www.bbc.com
${browser1}  gc
${browser2}  ff


*** Test Cases ***
IF Condition Validation
    Login to Account if signed out
    Logout from the Account if Signed in


*** Keywords ***
Login to Account if signed out
    Open Browser  ${url1}  ${browser1}
    Wait Until Page Contains Element  //*[@id="sp-cc-accept"]  timeout=05s
    Click Element  //*[@id="sp-cc-accept"]
    ${text_in_header}=  Get Text  //div[@class='nav-line-1-container']
    Run Keyword If  "${text_in_header}"=="Hello, Sign in"  Keyword1
    ...  ELSE  Keyword2

Keyword1
    Click Element  //span[@class='nav-line-2 ']
    Input Text  //input[@id='ap_email']  preethmusic@live.in
    Click Element  //*[@id="continue"]
    Input Text  //input[@id='ap_password']  Preeth!234
    Click Element  //input[@id='signInSubmit']

Keyword2
    Close Browser

Logout from the Account if Signed in
    Wait Until Page Contains Element  //div[@class='nav-line-1-container']  timeout=05s
    ${text_in_header}=  Get Text  //div[@class='nav-line-1-container']
    Run Keyword If  "${text_in_header}"=="Hello, Preetam"  Keyword3
    ...  ELSE  Keyword2

Keyword3
    Mouse Over  //*[@id="nav-link-accountList"]
    Wait Until Page Contains Element  //span[normalize-space()='Sign Out']  timeout=05s
    Click Element  //span[normalize-space()='Sign Out']
    Wait Until Page Contains Element  //h1[normalize-space()='Sign-In']  timeout=05s
    Page Should Contain  Sign-In
    Close Browser
