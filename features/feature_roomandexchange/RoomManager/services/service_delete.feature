Feature: Services

  Scenario: Delete Services
    #Given I have set a connection to pivotal_tracker API service
    When I request DELETE "/services/597b669c45e21512c82ef43d"
    Then I expect Status code 200 for the SmokeTest