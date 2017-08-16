@room
Feature: rooms


  Scenario: get a rooms with  rooms created
    Given I request GET "rooms"
    When I execute the request
    Then I expect status code 200
    And I verify the expected schema for "rooms"

  @smoke
  Scenario: Get Room with headers
    Given I request GET "rooms" with data :
      | start  | 2017-04-21T20%3A00%3A00.000Z |
      | end    | 2017-04-21T20%3A30%3A00.000Z |
      | status | free                         |
    When I execute the request
    Then I expect status code 200
    And I verify the expected schema for "rooms"

  @delete_rooms
  Scenario: Get Room with headers without room created
    Given I request GET "rooms" with data :
      | start  | 2017-04-21T20%3A00%3A00.000Z |
      | end    | 2017-04-21T20%3A30%3A00.000Z |
      | status | free                         |
    When I execute the request
    Then I expect status code 200
    And I verify the expected schema for "rooms"