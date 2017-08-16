@exchange
Feature: Exchange Services

  Background: : Create a Service
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
      #And I stored the reference of a services as: [Services1]
      And I stored the "_id" of the response [Services1]
      And I expect status code 200
      And I verify that values used from request are included in response

  @delete_service
  Scenario: Update Service
    Given I request PUT "services/Services1" with:
       """
          {
            "username": "Administrator",
            "password": "ABC123}"
           }
        """
    And With the following headers:
      | Content-type         | application/json              |
    When I execute the request
     #And I stored the reference of a services as: [Services1]
    And I stored the "_id" of the response [Services1]
    Then I expect status code 200

  @delete_service
  Scenario: Get Services
    Given I request GET "services"
      And With the following headers:
      | Content-type         | application/json              |
    When I execute the request
    Then I expect status code 200
      And I verify the data received is according previous POST response

#  Scenario: Get Service
#    Given I request DELETE "services/Services1._id"
#    When I execute the request
#    Then I expect status code 200
#     And the JSON response should not have "Exchange Server 2016"
#     And the JSON response should not have "ExchangeServer"
#     And the JSON response should not have "15.1 (Build 30225.42)"


