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
    When I execute the request
    Then I expect status code 200
    And the JSON should include "localhost"
    And the JSON should include 7070
    And the JSON should include "/api/v1/notifications"

