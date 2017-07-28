Feature: Meeting

  Background:
    Given I request POST "/suscription" with:
      | name | project_test |
    When I request POST "services" with:
      | name | project_test |
    And I request POST "/room" with:
      | name | project_test |

    Scenario: Create Meeting
      When I request POST "/meeting" with:
        | name | project_test |
      Then I expect Status code 200 for the SmokeTest
      And the "name" should be "my_new_story"
      And the "story_type" should be "feature"
      And the "estimate" should be "2"
      And the "description" should be "This is a description test"
      And the "current_state" should be "accepted"
      And the "created_at" should be "2017-06-09T10:00:00Z"
      And the "accepted_at" should be "2017-06-09T12:00:00Z"