*** Settings ***
Library    RequestsLibrary
Library    OperatingSystem

*** Variables ***
# ${BASE_URL}    http://172.20.10.3:5000
${BASE_URL}    http://localhost:5000

*** Test Cases ***
Test cir_round Operation With 1
    ${response}=    Call cir_round Endpoint    1
    Should Be Equal As Integers    ${response.status_code}    200
    ${response_body}=    Get Response Body    ${response}
    Should Be Equal As Numbers    ${response_body}    6.28

Test cir_round Operation With -10
    ${response}=    Call cir_round Endpoint    -10 
    Should Be Equal As Integers    ${response.status_code}    200
    ${response_body}=    Get Response Body    ${response}
    Should Be Equal As Numbers    ${response_body}    0.00

Test cir_round Operation With 1.5
    ${response}=    Call cir_round Endpoint    1.5
    Should Be Equal As Integers    ${response.status_code}    200
    ${response_body}=    Get Response Body    ${response}
    Should Be Equal As Numbers    ${response_body}    9.42


*** Keywords ***
Call cir_round Endpoint
    [Arguments]    ${x}  
    ${url}=    Catenate    ${BASE_URL}/cir_round/${x}
    ${response}=    GET    ${url}
    RETURN    ${response}

Get Response Body
    [Arguments]    ${response}
    ${response_body}=    Set Variable    ${response.text}
    RETURN    ${response_body}