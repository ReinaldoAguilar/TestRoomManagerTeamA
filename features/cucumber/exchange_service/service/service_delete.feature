Feature: Delete Service

  @exchange
  Scenario: Delete Service
    Given I request DELETE "services/59936471e2aeff0730b29bf0"
    When I execute the request
    Then I expect status code 200