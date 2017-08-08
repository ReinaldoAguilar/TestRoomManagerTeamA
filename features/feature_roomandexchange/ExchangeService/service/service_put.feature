Feature: Services

  Scenario: Create Service
    #Given I connect to "EXCHANGE"
    When I request Exchange Services POST "services" with:
      | hostname | server2012dc.arabitpro.local |
      | username | Administrator |
      | password | ABC123}       |
    And I stored Exchange Services as [Services1]
    Then I expect Status code 200 for the SmokeTest

  Scenario: Update Service
    When I request Exchange Services PUT "services/Services1._id" with:
      | username | Administrator |
      | password | ABC123}       |
    And I stored as [Services1]
    Then I expect Status code 200 for the SmokeTest

  Scenario: Get Service
    When I request Exchange Services DELETE "services/Services1._id"
    Then I expect Status code 200 for the SmokeTest

