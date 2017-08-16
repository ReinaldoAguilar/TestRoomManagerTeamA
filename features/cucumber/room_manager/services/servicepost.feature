@room
Feature: room Services

  @crate_subscription_exchange @crud @delete_service
  Scenario: Post Services
    Given I request POST "services" with:
      """
          {
            "hostname": "10.28.124.134",
            "username": "Administrator",
            "password": "ABC123}",
            "deleteLockTime": 10
           }
        """

      And With the following headers:
      | Content-type | application/json |
    When I execute the request
      And I stored the reference of a services as: [Services1]
    Then I expect status code 200

       #schema
      And I verify the expected schema for "services"
#      And I verify the data in data base "Services1"
      And I save response
       #equals
       #equivalents
       #dependency
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

