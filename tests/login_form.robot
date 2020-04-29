*** Settings ***

Resource         base.robot

Test Setup       New Session
Test Teardown    End Session


*** Test Cases ***

Login Successfully and validating
    Go To                  ${url}/login
    Input Text             css:input[name=username]                        stark
    Input Text             css:input[name=password]                        jarvis!
    Click Element          class:btn-login
    Page Should Contain    Olá, Tony Stark. Você acessou a área logada!