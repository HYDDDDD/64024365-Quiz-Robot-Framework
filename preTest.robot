*** Settings ***
Documentation     This is a sample test suite using Robot Framework
Library           SeleniumLibrary
Suite Setup       Open Browser    https://automationexercise.com/   chrome


*** Variables ***
${product}    dress
${VerifyWord1}    ALL PRODUCTS
${VerifyWord2}    SEARCHED PRODUCTS

*** Keywords ***
Click Products Element
    Click Element    //*[@id="header"]/div/div/div/div[2]/div/ul/li[2]/a
    

Input Search Product
    [Arguments]    ${product}
    Input Text    //*[@id="search_product"]    ${product}

Click Search Button Element
    Click Button    //*[@id="submit_search"]


*** Test Cases ***
Search Product
   [Documentation]    Test the login functionality with valid credentials
   Click Products Element 

    ${elements}    Get WebElements    /html/body/section[2]/div/div/div[2]/div/h2
    FOR  ${elements}  IN  @{elements}
        Element Should Contain    ${elements}    ${VerifyWord1}
        Log    Verify user is navigated to ALL PRODUCTS page successfully
    END
    

   Input Search Product    ${product}

   Click Search Button Element

    ${elements}    Get WebElements    /html/body/section[2]/div/div/div[2]/div/h2
     FOR  ${elements}  IN  @{elements}
        Element Should Be Visible    ${elements}    ${VerifyWord2}
        Log    Verify 'SEARCHED PRODUCTS' is visible
    END