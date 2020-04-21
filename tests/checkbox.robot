*** Settings ***

Resource                base.robot
Test Setup              New Session
Test Teardown           End Session

*** Variables ***
${check_thor}           id:thor
${check_iron}           css:input[value='iron-man']
${check_blackpanter}    xpath=//*[@id='checkboxes']/input[7]
*** Test Cases ***

Marking option with ID
    Go To                          ${url}/checkboxes
    Select Checkbox                ${check_thor}
    Checkbox Should Be Selected    ${check_thor}

Marking option with css selector
    [tags]                         ironman
    Go To                          ${url}/checkboxes
    Select Checkbox                ${check_iron}
    Checkbox Should Be Selected    ${check_iron}

Marking option with xpath
    [tags]                         ironman
    Go To                          ${url}/checkboxes
    Select Checkbox                ${check_blackpanter}
    Checkbox Should Be Selected    ${check_blackpanter}


