*** Settings ***
Library    RequestsLibrary
Library    OperatingSystem

*** Variables ***
# ${BASE_URL}    http://172.20.10.3:5000
${BASE_URL}    http://localhost:5000

*** Test Cases ***
Test Pita Operation With 3 4 5
    ${response}=    Call Pita Endpoint    3    4    5
    Should Be Equal As Integers    ${response.status_code}    200
    ${response_body}=    Get Response Body    ${response}
    Should Be Equal As Strings    ${response_body}    Yes

Test Pita Operation With 3 4 6
    ${response}=    Call Pita Endpoint    3    4    6 
    Should Be Equal As Integers    ${response.status_code}    200
    ${response_body}=    Get Response Body    ${response}
    Should Be Equal As Strings    ${response_body}    No

*** Keywords ***
Call Pita Endpoint
    [Arguments]    ${a}    ${b}    ${c}
    ${url}=    Catenate    ${BASE_URL}/pita/${a}/${b}/${c}
    ${response}=    GET    ${url}
    RETURN    ${response}

Get Response Body
    [Arguments]    ${response}
    ${response_body}=    Set Variable    ${response.text}
    RETURN    ${response_body}