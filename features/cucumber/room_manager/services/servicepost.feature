@room
Feature: room Services

  @crate_subscription_exchange @crud @delete_service
  Scenario: Post Services
    Given I request POST "services" with:
      """
          {
            "hostname": "10.28.124.134",
            "username": "$admin",
            "password": "$pass",
            "deleteLockTime": 10
           }
        """

      And With the following headers:
      | Content-type | application/json |
    When I execute the request
     And I stored the "_id" of the response [Services1]
    Then I expect status code 200
      And I verify the expected schema for "services"
    And I verify the data in data base "Services1"
      And I save response
      And I verify that values used from request are included in response

    Given I request GET "services"
    And With the following headers:
      | Content-type | application/json |
    When I execute the request
    Then I expect status code 200
      And I verify the expected schema for "services"
      And I verify the data received is according previous POST response


#  Scenario: Get Service




#  Scenario: Get Service
#    Given I request DELETE "services/Services1._id"
#    When I execute the request
#    Then I expect status code 200

