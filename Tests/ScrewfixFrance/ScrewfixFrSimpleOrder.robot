*** Settings ***
Documentation  Screwfix UK launch and login
Library  SeleniumLibrary

*** Variables ***


*** Test Cases ***
Place an Order
    [Documentation]  This test will launch screwfix and place an order
    [Tags]  Functional

    Launch and accept cookies
    #Login
    #Search for product and add to basket
    #Continue to payment and select delivery options
    #Enter payment type and checkout

*** Keywords ***

Launch and accept cookies
    Open Browser  https://screwfix:qb0Jz9XyykUD@mcstaging.screwfix.fr  gc
    #Wait Until Page Contains Element  //*[@class="truste_box_overlay"]  timeout=05s
    #Select Frame  //*[@title='TrustArc Cookie Consent Manager']  #Cookies Frame
    #Wait Until Page Contains Element  //a[contains(text(),'Accept Cookies')]  timeout=05s
    #Click Element  class:call  #Accept Cookies Button

    #Close Browser

Login
    Wait Until Page Contains Element  id:header_link_sign_in  timeout=05s
    Click Element  id:header_link_sign_in
    Input Text  id:email-existing  testman1sfxeu@gmail.com
    Input Text  id:password-field  Password!234
    Click Element  id:sign-in-btn
    Click Element  //*[@title="Continue shopping"]

Search for product and add to basket
    Click Element  id:mainSearch-input
    Input Text  id:mainSearch-input  91024
    Click Element  id:search_submit_button
    #Wait Until Page Contains  BATH WASTE WITH PLUG & 16" CHAIN  timeout=10s
    #Page Should Contain  BATH WASTE WITH PLUG & 16" CHAIN
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
    Wait Until Page Contains Element  //*[@class='fm-item--radio payWithCard']|//label[contains(., 'Pay with Card')]  timeout=05s

Enter payment type and checkout
    #Wait Until Page Contains Element  //*[@class='fm-item--radio payWithCard']|//label[contains(., 'Pay with Card')]  timeout=05s
    Click Element  //*[@class='fm-item--radio payWithCard']|//label[contains(., 'Pay with Card')]  #Pay with Card
    Wait Until Page Contains Element  //*[@title='Select Visa card']|//*[@id='visa']  timeout=05s
    Click Element  //*[@title='Select Visa card']|//*[@id='visa']  #Select Visa Card










