*** Settings ***

Resource         base.robot

Test Setup       New Session
Test Teardown    End Session

*** Test Cases ***

Check the value by entering the line number
    Go To                           ${url}/tables
    Table Row Should Contain        id:actors   2   @vindiesel

Find the line by the key text and validate the other values
    Go To           ${url}/tables
    ${target}=      Get WebElement      xpath:.//tr[contains(., '@chadwickboseman')] 
    Log             ${target.text}
    Should Contain  ${target.text}      $ 700.000
    Should Contain  ${target.text}      Pantera Negra
