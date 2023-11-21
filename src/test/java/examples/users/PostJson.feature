Feature: Create user using POST API

  Background:
    * url 'https://gorest.co.in'

  Scenario: Adding the post feature

    Given path '/public/v2/users'
    * def requestPayload = read('classpath:payload/user.json')

    And request requestPayload
    And header Authorization = 'Bearer ' + tokenId
    When method POST
    Then status 201
#    And match $.id == '#present'
#    And match $.name == '#present'
#    And match $.email == 'loki@loki.com'