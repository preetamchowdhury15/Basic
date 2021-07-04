*** Settings ***
Library  SeleniumLibrary

*** Variables ***


*** Test Cases ***
Test Case to Validate Browser Elements
    Open Browser  https://www.google.com  Chrome  alias=Browser1
    Click Element  //*[@id="L2AGLb"]/div

    ${attribute}=  Get Element Attribute  //input[@title='Search']  id
    ${count}=  Get Element Count  //input[@title='Search']
    ${width}  ${height}=  Get Element Size  //input[@title='Search']

    Get WebElement  //input[@title='Search']
    Get WebElements  //input[@title='Search']
    Capture Element Screenshot  //input[@title='Search']
    Assign Id To Element  //input[@title='Search']  PreetamChowdhury
    Page Should Contain Element  PreetamChowdhury
    Click Element  //input[@title='Search']
    Element Should be Focused  //input[@title='Search']
    Element Should be Visible  //input[@title='Search']
    Input Text  //input[@title='Search']  Preetam Chowdhury
    Clear Element Text  //input[@title='Search']
    Cover Element  //input[@title='Search']
    Element Attribute Value Should Be  name:btnK  Value  Google Search
    Element Should Be Enabled  name:btnK
    Element Should Not Be Visible  name:preetam
    Element Should Contain  //div[@class='uU7dJb']  United
    Element Should Not Contain  //div[@class='FPdoLc lJ9FBc']//input[@name='btnK']  Preetam
    Element Text Should Be  //div[@class='uU7dJb']  United Kingdom
    Element Text Should Not Be  //div[@class='FPdoLc lJ9FBc']//input[@name='btnK']  Google  Searches
    Double Click Element  //div[@class='FPdoLc lJ9FBc']//input[@name='btnK']
    Click Element At Coordinates  //div[@class='FPdoLc lJ9FBc']//input[@name='btnK']  15  10

    Close Browser





