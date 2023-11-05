Feature: Learn different type assertions in Karate
  Background: Common steps that is true for all scenarios in this feature file
    Given def oneSpartan =
    """
    {
    "id": 50,
    "name": "Jennica",
    "gender": "Female",
    "phone": 6986436734
    }
    """
    Given def fourSpartans = read("classpath:examples/testData/fourSpartans.json")

  Scenario: Simple match examples
    * match oneSpartan.name == 'Jennica'
    # Assert.assertEqual
    * match fourSpartans[1].name == 'Jeanelle'
    * def lengthOfArray = fourSpartans.length
    Then match lengthOfArray == 4
    When def lengthOfString = fourSpartans[3].name.length
    Then match lengthOfString == 7

  Scenario: fuzzy matching -> in karate (datatypes are as expected or present)
    * match oneSpartan.name == "#string"
    * match oneSpartan.id == "#number"
    * match oneSpartan.phone == "#present"
    * match oneSpartan.weapon == "#notpresent"

  @wip
  Scenario: match each assertions, looping inside JSON obj and verify
    #verify if each spartan id is number
  * match each fourSpartans[*].id == "#number"

    * def expectedSpartan =
    """
      {
    "id": 67,
    "name": "Janette",
    "gender": "Female",
    "phone": 9887020445
  }
    """

    * match fourSpartans contains expectedSpartan

