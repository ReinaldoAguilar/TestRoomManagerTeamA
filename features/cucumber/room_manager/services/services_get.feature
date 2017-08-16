@room
Feature: Test get services room manager

  Background: Post Services

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
      | Content-type         | application/json              |
  When I execute the request
    And I stored the reference of a services as: [Services1]
  Then I expect status code 200

  @delete_service @smoke @crud
  Scenario: Get Service

  Given I request GET "services"
    And With the following headers:
    | Content-type         | application/json              |
  When I execute the request
    And I verify the data received is according previous POST response
  Then I expect status code 200
    And I verify the expected schema for "services"







