Feature: Subscription

  @exchange
  Scenario: Create a Subscription
    Given I request POST "subscriptions" with:
     """
        {
          "host": "localhost",
          "port": 7070,
          "notificationUrl": "/api/v1/notifications"
        }
     """
    And With the following headers:
      | Content-type | application/json|
    When I execute the request
    Then I expect status code 200
    And I verify that values used from request are included in response "_id"


