*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${email}  testman1sfxeu@gmail.com
${password}  Password!234
&{product_description}  prod1=Bath waste with plastic plug.  prod2=Lightweight, classic frame with soft, flexible temples for comfort. Sleek wraparound style for excellent coverage and optimum field of vision.


#2820  23160


*** Keywords ***
Login
    Wait Until Page Contains Element  id:header_link_sign_in  timeout=05s
    Click Element  id:header_link_sign_in
    Input Text  id:email-existing  ${email}
    Input Text  id:password-field  ${password}
    Click Element  id:sign-in-btn
    Click Element  //*[@title="Continue shopping"]

Search for product and validate
    [Arguments]  ${skucode1}
    Click Element  id:mainSearch-input
    Input Text  id:mainSearch-input  ${skucode1}
    Click Element  id:search_submit_button
    Wait Until Page Contains Element  //*[@id="product_long_description_container"]
    Page Should Contain  ${product_description.prod1}


Search for product and validate2
    [Arguments]  ${skucode2}
    Click Element  id:mainSearch-input
    Input Text  id:mainSearch-input  ${skucode2}
    Click Element  id:search_submit_button
    Wait Until Page Contains Element  //*[@id="product_long_description_container"]
    Page Should Contain  ${product_description.prod2}


    #Click Element  id:mainSearch-input
    #Input Text  id:mainSearch-input  ${skucode2}
    #Click Element  id:search_submit_button
    #Page Should Contain  ${product_description.prod2}
    #Sleep  04s
    #Wait Until Page Contains Element  //*[@id="product_long_description_container"]
    #Page Should Contain  ${product_description}
    #Click Element  id:product_add_to_trolley_image
    #Wait Until Page Contains Element  //*[@class="wrp wrp__modal atb__top"]  timeout=05s
    #Click Element  id:checkout_now_btn