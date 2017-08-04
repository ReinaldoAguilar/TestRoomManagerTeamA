Feature: Test

  Scenario: Test 3 schema
    Given I have set a connection to pivotal_tracker API service
    When I request GET "/services"
    And With the following headers:
      | content_type         | application/json              |
      | exchange_credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9  |
      | exchange_calendar    | Administrator@arabitpro.local |
    Then I expect Status code 200 for the SmokeTest
    And I  format table schema format "services"




