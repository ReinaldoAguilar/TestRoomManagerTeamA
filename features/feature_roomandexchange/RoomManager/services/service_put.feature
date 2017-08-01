Feature: Services

  Scenario: Create Service
    #Given I connect to "EXCHANGE"
    When I request POST "/services" with:
      | hostname | 10.28.124.134 |
      | username | Administrator |
      | password | ABC123}       |
    And I stored as [Services1]
    Then I expect Status code 200 for the SmokeTest

  Scenario: Update Service
    When I request PUT "/services/Services1._id" with:
      | username | Administrator |
      | password | ABC123}       |
    And I stored as [Services1]
    Then I expect Status code 200 for the SmokeTest

  Scenario: Get Service
    When I request DELETE "/services/Services1._id"
    Then I expect Status code 200 for the SmokeTest

