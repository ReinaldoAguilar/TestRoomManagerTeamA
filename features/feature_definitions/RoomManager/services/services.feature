Feature: Test

  Scenario: Test
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request to services endpoint
    Then I expect Status code 200 for the SmokeTest
