Feature: Create user using POST API

  Background:
    * url 'https://gorest.co.in'
    * def requestPayload =
    """
    {
    "name" : "Lokesh",
    "email" : "loki@loki.com",
    "gender" : "male",
    "status" : "active"
    }
    """
  Scenario: Adding the post feature
    Given path '/public/v2/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenId
    When method POST
    Then status 201
    And match $.id == '#present'
    And match $.name == '#present'
    And match $.email == 'loki@loki.com'