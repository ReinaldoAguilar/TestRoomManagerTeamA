Feature: Delete Service

  Scenario: Get Service
    When I request DELETE "/services/5984a694541e950b98b61235"
    Then I expect Status code 200 for the SmokeTest