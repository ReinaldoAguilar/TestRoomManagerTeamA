Feature: Meeting

  Scenario: Get Meeting
    #Given I have set a connection to pivotal_tracker API service
    When I request GET "/meetings"
    Then I expect Status code 200 for the SmokeTest
