@room
Feature: Test

  Scenario: Create Service

    Given I request POST "services" with:
      | hostname | 10.28.124.134 |
      | username | Administrator |
      | password | ABC123}       |
    When I execute the request
     And I stored as [Services1]
    Then I expect status code 200

  Scenario: Test 3 schema
    Given I request GET "services"
    When I execute the request
    Then I expect status code 200
      And I verify the expected schema for "services"
      #TODO And  the JSON should be :


  Scenario: Get Service
    Given I request DELETE "services/Services1._id"
    When I execute the request
    Then I expect status code 200




