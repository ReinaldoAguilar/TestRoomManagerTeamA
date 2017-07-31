Feature: Services

  Scenario: Update Service
    When I request PUT "/services/597baf630492081074d6eb83" with:
      | username | Administrator |
      | password | ABC123}       |
    Then I expect Status code 200 for the SmokeTest