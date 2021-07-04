*** Settings ***
Documentation  Screwfix UK Simple order submit
Library  SeleniumLibrary
Resource  ../../Resources/CommonSFXUK.robot
Resource  ../../Resources/UserDefinedKeywords.robot
Resource  ../../Resources/ArguementInSFXUK.robot

Test Setup  CommonSFXUK.Launch Screwfix UK and accept cookies
Test Teardown  CommonSFXUK.Quit Browser
*** Variables ***


*** Test Cases ***
Place an Order
    [Documentation]  This test will launch screwfix and place an order
    [Tags]  Functional

    #Launch Screwfix UK and accept cookies
    UserDefinedKeywords.Login
    ArguementInSFXUK.Search for product and validate  91024
    ArguementInSFXUK.Search for product and validate2  2820
    #UserDefinedKeywords.Continue to payment and select delivery options
    #UserDefinedKeywords.Choose Payment type as Card
    #UserDefinedKeywords.Select Existing card and continue checkout
    #Quit Browser



Place an Order2
 #   UserDefinedKeywords.Login
    #ArguementInSFXUK.Search for product and validate  2820
  #  ArguementInSFXUK.Search for product and validate2  2820