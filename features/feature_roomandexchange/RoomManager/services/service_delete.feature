Feature: Services

  Scenario: Delete Services
    #Given I have set a connection to pivotal_tracker API service
    When I request DELETE "/services/5980aa420b157a13f01ae557"
    Then I expect Status code 200 for the SmokeTest