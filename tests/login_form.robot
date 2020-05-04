*** Settings ***

Resource         base.robot

Test Setup       New Session
Test Teardown    End Session


*** Test Cases ***

Login Successfully and validating
    Go To                         ${url}/login
    Login with                    stark                                             jarvis!
    Should See Logged User        Tony Stark

Invalid password and validanting
    [tags]                        login_error
    Go To                         ${url}/login
    Login with                    stark                                             acd123
    ${massage}=                   Get WebElement                                    id:flash
    Should Contain                ${massage.text}                                   Senha é invalida!

User do not exist
    [tags]                        login_user_404
    Go To                         ${url}/login
    Login with                    kaio                                              amoremio
    ${massage}=                   Get WebElement                                    id:flash
    Should Contain Login Alert    O usuário informado não está cadastrado!

*** Keywords ***
Login with
    [Arguments]                   ${uname}                                          ${pass}

    Input Text                    css:input[name=username]                          ${uname}
    Input Text                    css:input[name=password]                          ${pass}
    Click Element                 class:btn-login

Should Contain Login Alert
    [Arguments]                   ${expeted_message}
    ${massage}=                   Get WebElement                                    id:flash
    Should Contain                ${massage.text}                                   ${expeted_message}

Should See Logged User
    [Arguments]                   ${full_name}
    Page Should Contain           Olá, ${full_name}. Você acessou a área logada!
