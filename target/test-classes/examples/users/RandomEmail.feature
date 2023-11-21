Feature: Generate New random email id for POST method
  Background:
    * url 'https://gorest.co.in'
    * def randomString =
    """
    function(s) {
      var text = "";
      var pattern = "ABCDEFGHIJKLMNOPQURESTUVWXYZabcdefghijklmnopqurstuvwxyz";
      for(var i=0; i<s; i++)
      text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
      return text;
    }
    """
    * def randomEmail = randomString(10)
    * print randomEmail
    * def requestPayload =
    """
    {
    "name" : "Lokesh",
    "gender" : "male",
    "status" : "active"
    }

    """
    * requestPayload.email = randomEmail+'@gmail.com'
    * print requestPayload

  Scenario: Adding the post feature
    Given path '/public/v2/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenId
    When method POST
    Then status 201
    And match $.id == '#present'
    And match $.name == '#present'
    And match $.email == '#present'