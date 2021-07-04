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
    [Documentation]  This test will launch screwfix and search for a product and add into the basket.
    [Tags]  Functional

    #Launch Screwfix UK and accept cookies
    UserDefinedKeywords.Login
    UserDefinedKeywords.Search for product and add to basket


