Feature: Testing different End Points with Spartans API
  Background:
    * def spartanUrl = "http://54.172.243.231:8000/"
    * def expectedSpartan = read("classpath:examples/testData/oneSpartan.json")

  Scenario: Get one spartan with path parameter the verify
    Given url spartanUrl
    And path "api/spartans"
    And path "50"
    And header Accept = 'application/json'
    When method get
    Then status 200
    Then match response == expectedSpartan

  Scenario: Execute query parameters
    Given url spartanUrl
    And path "api/spartans/search"
    And param nameContains = 'j'
    And param gender = 'Female'
    And header Accept = 'application/json'
    When method get
    Then status 200
    Then match each response.content[*].gender == 'Female'
    Then match response.totalElement == 6


