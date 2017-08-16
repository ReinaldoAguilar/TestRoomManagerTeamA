Feature: Exchange Service

  @exchange
  Scenario: Get Services
    Given I request GET "services"
      And With the following headers:
      | content_type         | application/json              |
      | exchange_credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9  |
      | exchange_calendar    | Administrator@arabitpro.local |
    When I execute the request
    Then I expect status code 200