*** Settings ***

Resource         base.robot

Test Setup       New Session
Test Teardown    End Session

*** Test Cases ***

Should See Page Title
    Title Should Be    Training Wheels Protocol
