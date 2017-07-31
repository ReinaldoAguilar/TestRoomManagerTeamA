Feature: Services

  Scenario: Update Service
    When I request PUT "/services/597bb690ae2cd90620b8dec3" with:
      | username | Administrator |
      | password | ABC123}       |
    Then I expect Status code 200 for the SmokeTest