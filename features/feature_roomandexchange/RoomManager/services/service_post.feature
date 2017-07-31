Feature: Services

  Scenario: Create Service
    When I request POST "/services" with:
      | hostname | 10.28.124.134 |
      | username | Administrator |
      | password | ABC123}       |
    Then I expect Status code 200 for the SmokeTest
