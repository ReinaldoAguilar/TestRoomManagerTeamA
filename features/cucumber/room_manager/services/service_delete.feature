@room
Feature: room Services


  Background: : Post Services
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

  @crud
  Scenario: delete a Service when was created
    Given I request DELETE "services/Services1._id"
    When I execute the request
    Then I expect status code 200
    And I verify the expected schema for "services"
  @delete_service
  Scenario: delete a Service with invalid id
    Given I request DELETE "services/59910e5408456304909ec000"
    When I execute the request
    Then I expect status code 404
    And I verify the expected schema for "services"


  @delete_service
  Scenario: delete a Service with invalid id with more zise
    Given I request DELETE "services/59910e540845a"
    When I execute the request
    Then I expect status code 400
    And I verify the expected schema for "services"