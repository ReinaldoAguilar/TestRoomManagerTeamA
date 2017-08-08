
Feature: Meeting
  @exchange
  Scenario: Create Service
    #Given I connect to "EXCHANGE"
    When I request Exchange Services POST "services" with:

      | hostname      | server2012dc.arabitpro.local |
      | username      | Administrator                |
      | password      | ABC123}                      |
    And I stored Exchange Services as [Services1]
    Then I expect Status code 200 for the SmokeTest
  @exchange
  Scenario: Get Service
    When I request Exchange Services DELETE "services/Services1._id"
    Then I expect Status code Exchange Services 200 for the SmokeTest
