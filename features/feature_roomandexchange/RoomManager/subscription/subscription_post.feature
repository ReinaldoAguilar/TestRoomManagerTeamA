Feature: Subscription

  Background:
    Given I request POST "/suscription" with:
      | host            | localhost             |
      | port            | 7070                  |
      | notificationUrl | /api/v1/notifications |
    Then I expect Status code 200 for the SmokeTest