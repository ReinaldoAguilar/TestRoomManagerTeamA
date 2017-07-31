Feature: Meeting

  Background:
    Given I request POST "/suscription" with:
      | host            | localhost             |
      | port            | 7070                  |
      | notificationUrl | /api/v1/notifications |
    When I request POST "/services" with:
      | hostname | 10.28.124.134 |
      | username | Administrator |
      | password | ABC123}       |
    And I request POST "/room" with:
      | name | project_test |

  Scenario: Create Meeting
    When I request POST "/meeting" with:
      | name | project_test |
    Then I expect Status code 200 for the SmokeTest

