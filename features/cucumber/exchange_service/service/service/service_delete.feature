Feature: Delete Service

  @exchange
  Scenario: Get Service
    Given I request DELETE "services/598cc8c77b7e2b13b46a7022"
    When I execute the request
    Then I expect status code 200