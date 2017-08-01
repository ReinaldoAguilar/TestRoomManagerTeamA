Feature: Services

  Scenario: Delete Services
    #Given I have set a connection to pivotal_tracker API service
    When I request DELETE "/services/5980e3630b157a13f01ae55b"
    Then I expect Status code 200 for the SmokeTest