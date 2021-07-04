*** Settings ***


*** Variables ***


*** Test Cases ***
Argument Demo Keyword Test
    Arguement Demo Keyword  Preetam  Chowdhury

#Argument Demo Keyword Test2
#    Arguement Demo Keyword  Varnigaa  Gopalan


*** Keywords ***
Arguement Demo Keyword
    [Arguments]  ${arg1}  ${arg2}
    log  ${arg1}
    log  ${arg2}
