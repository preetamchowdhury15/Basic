*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${url1}  www.yahoo.com
${url2}  www.bbc.com
${browser1}  gc
${browser2}  gc


*** Test Cases ***
This test is to validate Aliases and Switch Browser.
    Open Browser  https://www.amazon.co.uk/  Chrome  alias=Browser1
    Open Browser  http://bbc.com  Chrome  alias=Browser2

    &{alias}  Get Browser Aliases
    #Log  ${alias.Browser1}

    @{browser_ID}  Get Browser Ids
    #Log  ${browser_ID}[0]

    Switch Browser  1

    Input Text  //input[@id='twotabsearchtextbox']  mobile phones
    Click Element  //input[@id='nav-search-submit-button']
    Log  ${browser_ID}[0]
    #Sleep  3s


    Switch Browser  ${alias.Browser2}

    Click Element  //span[@class='ssrcss-qgttmg-AccountText eki2hvo4']
    Click Element  //span[normalize-space()='Register now']
    #Sleep  2s
    Log  ${alias.Browser2}
    Close All Browsers


    #@{browser_ids}=	Get Browser Ids




