@exchange
Feature: Services

  Scenario: Create a Service
    Given I request POST "services" with:
      """
          {
            "hostname": "10.28.124.134",
            "username": "Administrator",
            "password": "ABC123}"
           }
        """
    When I execute the request
    And I stored as [Services1]
    And I expect status code 200

  Scenario: Update Service
    Given I request Exchange Services PUT "services/Services1._id" with:
       """
          {
            "username": "Administrator",
            "password": "ABC123}"
           }
        """
    When I execute the request
     And I stored as [Services1]
    Then I expect status code 200
     And the JSON should include "Exchange Server 2016"
     And the JSON should include "ExchangeServer"
     And the JSON should include "15.1 (Build 30225.42)"

  Scenario: Get Service
    Given I request DELETE "services/Services1._id"
    When I execute the request
    Then I expect status code 200
     And the JSON response should not have "Exchange Server 2016"
     And the JSON response should not have "ExchangeServer"
     And the JSON response should not have "15.1 (Build 30225.42)"


