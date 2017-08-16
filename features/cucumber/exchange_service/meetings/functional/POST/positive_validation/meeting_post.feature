@exchange
Feature: Create Meeting

  Scenario: Create a Meeting
    Given I request POST "meetings" with:
      """
      {
          "subject": "Scrum",
          "body": "Scrum of Room Manager",
          "start": "2017-01-25T16:00:00.00Z",
          "end": "2017-01-25T17:00:00.00Z",
          "location": "Arani",
          "attendees": [

          ],
          "optionalAttendees": [

          ]
        }
      """
    And With the following headers:
      | Content-type         | application/json              |
      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9  |
      | Exchange-calendar    | Administrator@arabitpro.local |
    When I execute the request
    And I stored the "_id" of the response [Meetings1]
    And I verify that values used from request are included in response
    Then I expect status code 200

#  Scenario: Create a Meeting
#    Given I request POST "meetings" with:
#      """
#      {
#        "subject": "34534534345",
#        "body": "Scrum of Room Manager",
#        "start": "2017-09-25T16:00:00.00Z",
#        "end": "2017-12-25T17:00:00.00Z",
#        "location": "Arani",
#        "attendees": [
#        "Administrator@arabitpro.local"
#        ],
#        "optionalAttendees": [
#        "stacy.hirano@server.lab"
#        ]
#      }
#      """
#    And With the following headers:
#      | Content-type         | application/json              |
#      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9  |
#      | Exchange-calendar    | Administrator@arabitpro.local |
#    When I execute the request
#    And I stored the "_id" of the response [Meetings1]
#    And I verify that values used from request are included in response
#    Then I expect status code 200
#
#  Scenario: Create a Meeting
#    Given I request POST "meetings" with:
#      """
#      {
#        "subject": "",
#        "body": "Scrum of Room Manager",
#        "start": "2017-09-25T16:00:00.00Z",
#        "end": "2017-12-25T17:00:00.00Z",
#        "location": "Arani",
#        "attendees": [
#        "Administrator@arabitpro.local"
#        ],
#        "optionalAttendees": [
#        "stacy.hirano@server.lab"
#        ]
#      }
#      """
#    And With the following headers:
#      | Content-type         | application/json              |
#      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9  |
#      | Exchange-calendar    | Administrator@arabitpro.local |
#    When I execute the request
#    And I stored the "_id" of the response [Meetings1]
#    And I verify that values used from request are included in response
#    Then I expect status code 200
#
#  Scenario: Create a Meeting
#    Given I request POST "meetings" with:
#      """
#      {
#        "subject": "Test",
#        "body": "",
#        "start": "2017-09-25T16:00:00.00Z",
#        "end": "2017-12-25T17:00:00.00Z",
#        "location": "Arani",
#        "attendees": [
#        "Administrator@arabitpro.local"
#        ],
#        "optionalAttendees": [
#        "stacy.hirano@server.lab"
#        ]
#      }
#      """
#    And With the following headers:
#      | Content-type         | application/json              |
#      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9  |
#      | Exchange-calendar    | Administrator@arabitpro.local |
#    When I execute the request
#    And I stored the "_id" of the response [Meetings1]
#    And I verify that values used from request are included in response
#    Then I expect status code 200
#
#  Scenario: Create a Meeting
#    Given I request POST "meetings" with:
#      """
#      {
#        "subject": "Test",
#        "body": "534534534534",
#        "start": "2017-09-25T16:00:00.00Z",
#        "end": "2017-12-25T17:00:00.00Z",
#        "location": "Arani",
#        "attendees": [
#        "Administrator@arabitpro.local"
#        ],
#        "optionalAttendees": [
#        "stacy.hirano@server.lab"
#        ]
#      }
#      """
#    And With the following headers:
#      | Content-type         | application/json              |
#      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9  |
#      | Exchange-calendar    | Administrator@arabitpro.local |
#    When I execute the request
#    And I stored the "_id" of the response [Meetings1]
#    And I verify that values used from request are included in response
#    Then I expect status code 200
#
#  Scenario: Create a Meeting
#    Given I request POST "meetings" with:
#      """
#      {
#        "subject": "Test",
#        "body": "Scrum of Room Manager",
#        "start": "2017-09-25T15:00:00.00Z",
#        "end": "2017-12-25T17:00:00.00Z",
#        "location": "",
#        "attendees": [
#        "Administrator@arabitpro.local"
#        ],
#        "optionalAttendees": [
#        "stacy.hirano@server.lab"
#        ]
#      }
#      """
#    And With the following headers:
#      | Content-type         | application/json              |
#      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9  |
#      | Exchange-calendar    | Administrator@arabitpro.local |
#    When I execute the request
#    And I stored the "_id" of the response [Meetings1]
#    And I verify that values used from request are included in response
#    Then I expect status code 200
#
#  Scenario: Create a Meeting
#    Given I request POST "meetings" with:
#      """
#      {
#        "subject": "Test",
#        "body": "Scrum of Room Manager",
#        "start": "2017-09-25T16:00:00.00Z",
#        "end": "2017-12-25T17:00:00.00Z",
#        "location": "Arani",
#        "attendees": [
#
#        ],
#        "optionalAttendees": [
#        "stacy.hirano@server.lab"
#        ]
#      }
#      """
#    And With the following headers:
#      | Content-type         | application/json              |
#      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9  |
#      | Exchange-calendar    | Administrator@arabitpro.local |
#    When I execute the request
#    And I stored the "_id" of the response [Meetings1]
#    And I verify that values used from request are included in response
#    Then I expect status code 200
#
#  Scenario: Create a Meeting
#    Given I request POST "meetings" with:
#      """
#      {
#        "subject": "Test",
#        "body": "Scrum of Room Manager",
#        "start": "2017-09-25T16:00:00.00Z",
#        "end": "2017-12-25T17:00:00.00Z",
#        "location": "Arani",
#        "attendees": [
#        "Administrator@arabitpro.local"
#        ],
#        "optionalAttendees": [
#
#        ]
#      }
#      """
#    And With the following headers:
#      | Content-type         | application/json              |
#      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9  |
#      | Exchange-calendar    | Administrator@arabitpro.local |
#    When I execute the request
#    And I stored the "_id" of the response [Meetings1]
#    And I verify that values used from request are included in response
#    Then I expect status code 200
#
#  Scenario: Create a Meeting
#    Given I request POST "meetings" with:
#      """
#      {
#        "subject": "Test",
#        "body": "Scrum of Room Manager",
#        "start": "2017-09-25T16:00:00.00Z",
#        "end": "2017-12-25T17:00:00.00Z",
#        "location": "Arani",
#        "attendees": [
#        "Administrator@arabitpro.local"
#        ],
#        "optionalAttendees": [
#        "stacy.hirano@server.lab"
#        ]
#      }
#      """
#    And With the following headers:
#      | Content-type         | application/json             |
#      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 |
#      | Exchange-calendar    |                              |
#    When I execute the request
#    And I stored the "_id" of the response [Meetings1]
#    And I verify that values used from request are included in response
#    Then I expect status code 200