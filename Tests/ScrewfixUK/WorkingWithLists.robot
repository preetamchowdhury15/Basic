*** Settings ***
Library  SeleniumLibrary

*** Variables ***



*** Test Cases ***
Validate the following Window Lists

    Open Browser  https://www.sugarcrm.com/au/cx/high-definition/?utm_source=google&utm_medium=search&utm_campaign=Brand_Core_APAC_SGP_SDI&utm_term=sugarcrm&utm_content=hd-cx&gclid=Cj0KCQjw8vqGBhC_ARIsADMSd1BozT1vixCTWR4E1Rb1G27o4PVHMg0DesvWIIqKIyEvhMHdbeYGpCEaAhmJEALw_wcB&gclsrc=aw.ds  Chrome
    Sleep  2s
    #Click Element  //button[normalize-space()='Accept All Cookies']


    Scroll Element Into View  //div[contains(text(),'MAGIC QUADRANT VISIONARY')]
    Scroll Element Into View  //div[contains(@class,'col-lg-6 aos-init aos-animate')]//div[@id='resourceForm']//div[contains(@class,'card h-100')]//div[contains(@class,'card-body')]//form[@id='user-form-template-230']//div//select[contains(@name,'employees_c')]

    ${AllItems}=  Get List Items  //div[contains(@class,'col-lg-6 aos-init aos-animate')]//div[@id='resourceForm']//div[contains(@class,'card h-100')]//div[contains(@class,'card-body')]//form[@id='user-form-template-230']//div//select[contains(@name,'employees_c')]
    ${ListLabel}=  Get Selected List Label  //div[contains(@class,'col-lg-6 aos-init aos-animate')]//div[@id='resourceForm']//div[contains(@class,'card h-100')]//div[contains(@class,'card-body')]//form[@id='user-form-template-230']//div//select[contains(@name,'employees_c')]
    ${ListValue}=  Get Selected List Value  //div[contains(@class,'col-lg-6 aos-init aos-animate')]//div[@id='resourceForm']//div[contains(@class,'card h-100')]//div[contains(@class,'card-body')]//form[@id='user-form-template-230']//div//select[contains(@name,'employees_c')]

    List Selection Should be  //div[contains(@class,'col-lg-6 aos-init aos-animate')]//div[@id='resourceForm']//div[contains(@class,'card h-100')]//div[contains(@class,'card-body')]//form[@id='user-form-template-230']//div//select[contains(@name,'employees_c')]  Company Size*

    Select From List By Index  //div[contains(@class,'col-lg-6 aos-init aos-animate')]//div[@id='resourceForm']//div[contains(@class,'card h-100')]//div[contains(@class,'card-body')]//form[@id='user-form-template-230']//div//select[contains(@name,'employees_c')]  5
    ${label1}=  Get Selected List Label  //div[contains(@class,'col-lg-6 aos-init aos-animate')]//div[@id='resourceForm']//div[contains(@class,'card h-100')]//div[contains(@class,'card-body')]//form[@id='user-form-template-230']//div//select[contains(@name,'employees_c')]

    Select From List By Label  //div[contains(@class,'col-lg-6 aos-init aos-animate')]//div[@id='resourceForm']//div[contains(@class,'card h-100')]//div[contains(@class,'card-body')]//form[@id='user-form-template-230']//div//select[contains(@name,'employees_c')]  10,000+ employees
    ${label2}=  Get Selected List Label  //div[contains(@class,'col-lg-6 aos-init aos-animate')]//div[@id='resourceForm']//div[contains(@class,'card h-100')]//div[contains(@class,'card-body')]//form[@id='user-form-template-230']//div//select[contains(@name,'employees_c')]

    Select From List By Value  //div[contains(@class,'col-lg-6 aos-init aos-animate')]//div[@id='resourceForm']//div[contains(@class,'card h-100')]//div[contains(@class,'card-body')]//form[@id='user-form-template-230']//div//select[contains(@name,'employees_c')]  level7
    ${label3}=  Get Selected List Label  //div[contains(@class,'col-lg-6 aos-init aos-animate')]//div[@id='resourceForm']//div[contains(@class,'card h-100')]//div[contains(@class,'card-body')]//form[@id='user-form-template-230']//div//select[contains(@name,'employees_c')]


Validate the following Window Multiselect Lists

    #Go to  https://www.w3schools.com/
    #Wait Until Page Contains Element  //*[@id="accept-choices"]  timeout=05s
    #Click Element  //*[@id="accept-choices"]
    Go to  https://www.w3schools.com/tags/tryit.asp?filename=tryhtml_select_multiple
    Wait Until Page Contains Element  //*[@id="accept-choices"]  timeout=15s
    Click Element  //*[@id="accept-choices"]
    Select Frame  //*[@id="iframeResult"]
    Select All From List  //*[@id="cars"]
    Sleep  2s

    @{ListLabels}=  Get Selected List Labels  //*[@id="cars"]
    Unselect From List By Value  //*[@id="cars"]  audi
    Unselect From List By Index  //*[@id="cars"]  1
    Unselect From List By Label  //*[@id="cars"]  Volvo

    @{ListValues}=  Get Selected List Values  //*[@id="cars"]
    Unselect All From List  //*[@id="cars"]
    List Should Have No Selections  //*[@id="cars"]

    Close Browser


