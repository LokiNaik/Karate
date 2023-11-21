Feature: Get API Headers features

  Scenario: pass the user request with headers
    Given header Content-Type = 'application/json;charset=utf-8'
    And header Connection = 'keep-alive'
    And header Accept-Encoding = 'gzip, deflate, br'
    And header Accept = '*/*'

    When url baseUrl+'/public/v2/users'
    And path '5360794'
    When method GET
    Then status 200
    * print response


  Scenario: Pass the user request with header_part2
    