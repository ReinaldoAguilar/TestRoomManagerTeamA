@exchange @testks
Feature: Meeting

  Scenario: post Service
    Given I request POST "services" with:
      """
          {
            "hostname": "10.28.124.134",
            "username": "Administrator",
            "password": "ABC123}"
           }
        """
    And With the following headers:
      | Content-type         | application/json              |
    When I execute the request
     And The name of the service is: [Services1]

     #schema
     #equals
     #equivalents
     #dependency
    And I verify that values used from request are included in response


  Scenario: Get Service
    Given I request GET "services"
    And With the following headers:
      | Content-type         | application/json              |
    When I execute the request
    Then I expect status code 200
    And I verify the data received is according previous POST response


  Scenario: Get Service
    Given I request DELETE "services/Services1._id"
    When I execute the request
    Then I expect status code 200

