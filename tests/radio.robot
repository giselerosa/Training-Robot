*** Settings ***

Resource         base.robot

Test Setup       New Session
Test Teardown    End Session

*** Test Cases ***

Selecting radio buttons with ID
    Go To                            ${url}/radios
    Select Radio Button              movies           cap
    Radio Button Should Be Set To    movies           cap


Selecting radio buttons with value
    Go To                            ${url}/radios
    Select Radio Button              movies           guardians
    Radio Button Should Be Set To    movies           guardians



