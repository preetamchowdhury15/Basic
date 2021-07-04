*** Settings ***
Documentation  Screwfix UK Simple order submit
Library  SeleniumLibrary
Resource  ../../Resources/CommonSFXUK.robot
Resource  ../../Resources/UserDefinedKeywords.robot
Resource  ../../Resources/ArguementInSFXUK.robot

Test Setup  CommonSFXUK.Launch Screwfix UK and accept cookies
Test Teardown  CommonSFXUK.Quit Browser
Library  SeleniumLibrary
Variables  ./WebElements.py

*** Variables ***
${email}  testman1sfxeu@gmail.com
${password}  Password!234
&{sku_code}  abc=91024  bcd=2820
&{product_description}  prod1=Bath waste with plastic plug.  prod2=Lightweight, classic frame with soft, flexible temples for comfort. Sleek wraparound style for excellent coverage and optimum field of vision.


*** Test Cases ***
Place an Order 2nd test
    [Documentation]  This test will launch screwfix and search for a product and add into the basket.
    [Tags]  Functional

    #Launch Screwfix UK and accept cookies
    Login2
    Search for product and add to basket2


*** Keywords ***

Login2
    Wait Until Page Contains Element  id:header_link_sign_in  timeout=05s
    Click Element  ${HomepageLoginButton}  #check webelement python file for xpaths.
    Input Text  ${HomepageLoginText}  ${email}
    Input Text  ${HomepagePasswordText}  ${password}
    Click Element  ${HomepageSigninButton}
    Click Element  ${HomepageContinueShoppinhButton}

Search for product and add to basket2
    Click Element  id:mainSearch-input
    Input Text  id:mainSearch-input  ${sku_code.abc}
    Click Element  id:search_submit_button
    Wait Until Page Contains Element  //*[@id="product_long_description_container"]
    Page Should Contain  ${product_description.prod1}
    #Click Element  id:mainSearch-input
    #Input Text  id:mainSearch-input  ${sku_code.bcd}
    #Click Element  id:search_submit_button
    #Page Should Contain  ${product_description.prod2}
    #Sleep  04s
    #Wait Until Page Contains Element  //*[@id="product_long_description_container"]
    #Page Should Contain  ${product_description.prod1}
    Click Element  id:product_add_to_trolley_image
    Wait Until Page Contains Element  //*[@class="wrp wrp__modal atb__top"]  timeout=05s
    Click Element  id:checkout_now_btn

