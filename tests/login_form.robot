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

Invalid password and validanting
    [tags]                 login_error
    Go To                  ${url}/login
    Input Text             css:input[name=username]                        stark
    Input Text             css:input[name=password]                        acd123
    Click Element          class:btn-login
    ${massage}=            Get WebElement                                  id:flash
    Should Contain         ${massage.text}                                 Senha inválida!

User do not exist
    [tags]                 login_user_404
    Go To                  ${url}/login
    Input Text             css:input[name=username]                        kaio
    Input Text             css:input[name=password]                        amoremio
    Click Element          class:btn-login
    ${massage}=            Get WebElement                                  id:flash
    Should Contain         ${massage.text}                                 O usuário informado não está cadastrado!

