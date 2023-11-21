Feature: Get Api with a Query parameters
  Scenario: get all active users
    * def query = {status:'active', gender: 'female'}
    Given url baseUrl+'/public/v2/users'
    And params query
    When method GET
    Then status 200
    * print response


  Scenario: get all active users
    * def query = {status:'active'}
    Given url baseUrl+'/public/v2/users'
    And params query
    When method GET
    Then status 200
    * def jsonResponse = response
    * print jsonResponse
    * def userCount = jsonResponse.length
    * print userCount
    * match userCount == 10

  Scenario: Get all products
    Given url 'http://localhost:8001/admin/listProducts'
    When method GET
    Then status 200