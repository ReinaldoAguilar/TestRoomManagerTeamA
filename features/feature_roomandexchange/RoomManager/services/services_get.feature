Feature: Test
  @room
  Scenario: Create Service
  #Given I connect to "EXCHANGE"
    When I request POST "services" with:
      | hostname | 10.28.124.134 |
      | username | Administrator |
      | password | ABC123}       |
    And I stored as [Services1]
    Then I expect Status code 200 for the SmokeTest
  @room
  Scenario: Test 3 schema
    Given I have set a connection to pivotal_tracker API service
    When I request GET "services"
    And With the following headers:
      | content_type         | application/json              |
      | exchange_credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9  |
      | exchange_calendar    | Administrator@arabitpro.local |
    Then I expect Status code 200 for the SmokeTest
    And I  format table schema format "services"

  @room
  Scenario: Get Service
    When I request DELETE "services/Services1._id"
    Then I expect Status code 200 for the SmokeTest




