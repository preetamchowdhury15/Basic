*** Settings ***
Library  SeleniumLibrary
Variables  ./WebElements.py

*** Variables ***
${email}  testman1sfxeu@gmail.com
${password}  Password!234
&{sku_code}  abc=91024  bcd=2820
&{product_description}  prod1=Bath waste with plastic plug.  prod2=Lightweight, classic frame with soft, flexible temples for comfort. Sleek wraparound style for excellent coverage and optimum field of vision.


#2820  23160


*** Keywords ***
Login
    Wait Until Page Contains Element  id:header_link_sign_in  timeout=05s
    Click Element  ${HomepageLoginButton}  #check webelement python file for xpaths.
    Input Text  ${HomepageLoginText}  ${email}
    Input Text  ${HomepagePasswordText}  ${password}
    Click Element  ${HomepageSigninButton}
    Click Element  ${HomepageContinueShoppinhButton}

Search for product and add to basket
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

Continue to payment and select delivery options
    Wait Until Page Contains Element  //*[@id="topCheckoutButton"]  timeout=05s
    Click Element  id:topCheckoutButton  #Continue payment button
    Wait Until Page Contains Element  //*[@id="addrTiles"]  timeout=05s
    #Click Element  class:btn btn--addr fill text-left
    Click Element  //*[contains(@class,'lg-8 md-12 sm-24 cols')][1]//*[contains(@class,'btn--addr')]  #Select address one button
    Wait Until Page Contains Element  //*[@id="date_tile_0"]  timeout=05s
    Click Element  //*[@id="date_tile_0"]  #Select 1st day available for delivery
    Wait Until Page Contains Element  //*[@id="deliveryServiceTile_1"]  timeout=05s
    Click Element  //*[@id="deliveryServiceTile_1"]  #before 6.30pm delivery


Choose Payment type as Card
    Sleep  4s
    Wait Until Page Contains Element  //*[@class='fm-item--radio payWithCard']|//label[contains(., 'Pay with Card')]  timeout=05s
    Click Element  //*[@class='fm-item--radio payWithCard']|//label[contains(., 'Pay with Card')]  #Pay with Card



Enter New card Details
    Wait Until Page Contains Element  //*[@title='Select Visa card']|//*[@id='visa']  timeout=05s
    Click Element  //*[@title='Select Visa card']|//*[@id='visa']  #Select Visa Card
    Wait Until Page Contains Element  //*[@id="enter-card-details"]  05s
    Select Frame  //*[@id="enter-card-details"]  #Payments Frame
    Wait Until Page Contains Element  //*[@id="new-card-name"]  05s
    Input Text  id:new-card-name  testman1
    Input Text  id:new-card-number  4444333322221111
    Select Element  //*[@id="new-card-month"]/option[13]
    Select Element  //*[@id="new-card-year"]/option[4]
    Input Text  id:cvvNumber  999

Select Existing card and continue checkout
    Wait Until Page Contains Element  //*[@class='btn id-order-card id-saved-order-card btn--saved-card fill']|//*[@id='addCard']  07s
    Click Element  //*[@class='btn id-order-card id-saved-order-card btn--saved-card fill']|//*[@id='addCard']
    Sleep  04s
    Input Text  //*[@id='cvvNumber']|//*[@name='cardCode']  999
    Click Element  //*[@id="paymentForm"]/div[20]/div/div/div/button
    Wait Until Page Contains Element  //*[@id="button-row"]/div/div/div[2]/button  05s
    Click Element  //*[@id="button-row"]/div/div/div[2]/button
    Sleep  08s

    #Page Should Contain  ORDER RECEIVED