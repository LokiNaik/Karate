Feature: A sample first feature file

  Scenario: Get user details
    Given url baseUrl+'/public/v2/users'
    And path '628265'
    When method GET
    Then status 200
    #to print the response
    * print response
#    assign response to a json object
    * def jsonResponse = response
    * print jsonResponse
    * def actName = jsonResponse.name
    * def actId = jsonResponse.id
    * def actEmail = jsonResponse.email
    * def actGender = jsonResponse.gender

#    valadating the response
    * match actName == 'Gov. Rukmin Bharadwaj'
    * match actId == 628265
    * match actEmail == 'bharadwaj_rukmin_gov@roob.com'
    * match actGender == 'female'

  Scenario:Get user details - User not found
    Given url baseUrl+'/public/v2/users'
    And path '1'
    When method GET
    Then status 404

