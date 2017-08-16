Feature: Delete service

  Scenario: Delete Service
    Given I request DELETE "services/598e11d7e2aeff0730b29669"
    When I execute the request
    Then I expect status code 200