Feature: Subscription
  @exchange
  Scenario: Create a Subscription
    Given I request Exchange Services POST "subscriptions" with:
      | host            | localhost             |
      | port            | 7070                  |
      | notificationUrl | /api/v1/notifications |
    Then I expect Status code Exchange Services 200 for the SmokeTest