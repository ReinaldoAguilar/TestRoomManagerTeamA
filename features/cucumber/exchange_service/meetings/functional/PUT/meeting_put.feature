@exchange
Feature: Update Meetings

  Background: Create a Meeting
    Given I request POST "meetings" with:
      """
      {
        "subject": "TestMeeting",
        "body": "Scrum of Room Manager",
        "start": "2017-09-25T16:00:00.00Z",
        "end": "2017-12-25T17:00:00.00Z",
        "location": "Arani",
        "attendees": [
        "Administrator@arabitpro.local"
        ],
        "optionalAttendees": [
        "stacy.hirano@server.lab"
        ]
      }
      """
    And With the following headers:
      | Content-type         | application/json              |
      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9  |
      | Exchange-calendar    | Administrator@arabitpro.local |
    When I execute the request
    And I stored the "_id" of the response [Meetings1]
    Then I expect status code 200

  @delete_service
  Scenario: Update Meeting
    Given I request PUT "meetings/Meetings1" with:
      """
      {
  "action": "Tentative",
  "doNotSendResponse": true,
  "editResponse": "I will be able to attend the meeting",
  "subject": "Test",
  "body": "Scrum of Room Manager",
  "start": "2017-09-25T16:00:00.00Z",
  "end": "2017-12-25T17:00:00.00Z",
  "location": "Arani",
  "attendees": [
    "Administrator@arabitpro.local"
  ],
  "optionalAttendees": [
    "stacy.hirano@server.lab"
  ]
}
      """
    And With the following headers:
      | Content-type         | application/json             |
      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 |
    When I execute the request
    Then I expect status code 200

  @delete_service
  Scenario: Create a Meeting
    Given I request PUT "meetings/Meetings1" with:
      """
      {
        "subject": "Test",
        "body": "Scrum of Room Manager",
        "start": "2017-09-25T16:00:00.00Z",
        "end": "2017-12-25T17:00:00.00Z",
        "location": "Arani",
        "attendees": [
        "Administrator@arabitpro.local"
        ],
        "optionalAttendees": [
        "stacy.hirano@server.lab"
        ]
      }
      """
    And With the following headers:
      | Content-type         | application/json              |
      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9  |

    When I execute the request
    Then I expect status code 200
      And I expect JSON :
           ##TODO Build expected response based on Request / DB /response data
  ## Validation point PRINT Json



  @delete_service
  Scenario: Create a Meeting
    Given I request PUT "meetings/Meetings1" with:
      """
      {
        "subject": "34534534345",
        "body": "Scrum of Room Manager",
        "start": "2017-09-25T16:00:00.00Z",
        "end": "2017-12-25T17:00:00.00Z",
        "location": "Arani",
        "attendees": [
        "Administrator@arabitpro.local"
        ],
        "optionalAttendees": [
        "stacy.hirano@server.lab"
        ]
      }
      """
    And With the following headers:
      | Content-type         | application/json              |
      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9  |
    When I execute the request
    Then I expect status code 200

  @delete_service
  Scenario: Create a Meeting
    Given I request PUT "meetings/Meetings1" with:
      """
      {
        "subject": "",
        "body": "Scrum of Room Manager",
        "start": "2017-09-25T16:00:00.00Z",
        "end": "2017-12-25T17:00:00.00Z",
        "location": "Arani",
        "attendees": [
        "Administrator@arabitpro.local"
        ],
        "optionalAttendees": [
        "stacy.hirano@server.lab"
        ]
      }
      """
    And With the following headers:
      | Content-type         | application/json              |
      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9  |
    When I execute the request
    Then I expect status code 200

  @delete_service
  Scenario: Create a Meeting
    Given I request PUT "meetings/Meetings1" with:
      """
      {
        "subject": 5345345345,
        "body": "Scrum of Room Manager",
        "start": "2017-09-25T16:00:00.00Z",
        "end": "2017-12-25T17:00:00.00Z",
        "location": "Arani",
        "attendees": [
        "Administrator@arabitpro.local"
        ],
        "optionalAttendees": [
        "stacy.hirano@server.lab"
        ]
      }
      """
    And With the following headers:
      | Content-type         | application/json              |
      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9  |
    When I execute the request
    Then I expect status code 400

  @delete_service
  Scenario: Create a Meeting
    Given I request PUT "meetings/Meetings1" with:
      """
      {
        "subject": "Test",
        "body": "",
        "start": "2017-09-25T16:00:00.00Z",
        "end": "2017-12-25T17:00:00.00Z",
        "location": "Arani",
        "attendees": [
        "Administrator@arabitpro.local"
        ],
        "optionalAttendees": [
        "stacy.hirano@server.lab"
        ]
      }
      """
    And With the following headers:
      | Content-type         | application/json              |
      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9  |
    When I execute the request
    Then I expect status code 200

  @delete_service
  Scenario: Create a Meeting
    Given I request PUT "meetings/Meetings1" with:
      """
      {
        "subject": "Test",
        "body": "534534534534",
        "start": "2017-09-25T16:00:00.00Z",
        "end": "2017-12-25T17:00:00.00Z",
        "location": "Arani",
        "attendees": [
        "Administrator@arabitpro.local"
        ],
        "optionalAttendees": [
        "stacy.hirano@server.lab"
        ]
      }
      """
    And With the following headers:
      | Content-type         | application/json              |
      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9  |
    When I execute the request
    Then I expect status code 200

  @delete_service
  Scenario: Create a Meeting
    Given I request PUT "meetings/Meetings1" with:
      """
      {
        "subject": "Test",
        "body": 34534534,
        "start": "2017-09-25T16:00:00.00Z",
        "end": "2017-12-25T17:00:00.00Z",
        "location": "Arani",
        "attendees": [
        "Administrator@arabitpro.local"
        ],
        "optionalAttendees": [
        "stacy.hirano@server.lab"
        ]
      }
      """
    And With the following headers:
      | Content-type         | application/json              |
      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9  |
    When I execute the request
    Then I expect status code 400

  @delete_service
  Scenario: Create a Meeting
    Given I request PUT "meetings/Meetings1" with:
      """
      {
        "subject": "Test",
        "body": "Scrum of Room Manager",
        "start": "2018-09-25T16:00:00.00Z",
        "end": "2017-12-25T17:00:00.00Z",
        "location": "Arani",
        "attendees": [
        "Administrator@arabitpro.local"
        ],
        "optionalAttendees": [
        "stacy.hirano@server.lab"
        ]
      }
      """
    And With the following headers:
      | Content-type         | application/json              |
      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9  |
    When I execute the request
    Then I expect status code 400

  @delete_service
  Scenario: Create a Meeting
    Given I request PUT "meetings/Meetings1" with:
      """
      {
        "subject": "Test",
        "body": "Scrum of Room Manager",
        "start": "2017-14-25T10:00:00.00Z",
        "end": "2017-12-25T17:00:00.00Z",
        "location": "Arani",
        "attendees": [
        "Administrator@arabitpro.local"
        ],
        "optionalAttendees": [
        "stacy.hirano@server.lab"
        ]
      }
      """
    And With the following headers:
      | Content-type         | application/json              |
      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9  |
    When I execute the request
    Then I expect status code 400

    ##################################
  # Bug time incorrect shoul be status code 400 bad was 200
  @delete_service
  Scenario: Create a Meeting
    Given I request PUT "meetings/Meetings1" with:
      """
      {
        "subject": "Test",
        "body": "Scrum of Room Manager",
        "start": "2017-09-25T19:00:00.00Z",
        "end": "2017-12-25T17:00:00.00Z",
        "location": "Arani",
        "attendees": [
        "Administrator@arabitpro.local"
        ],
        "optionalAttendees": [
        "stacy.hirano@server.lab"
        ]
      }
      """
    And With the following headers:
      | Content-type         | application/json              |
      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9  |
    When I execute the request
    Then I expect status code 200

  @delete_service
  Scenario: Create a Meeting
    Given I request PUT "meetings/Meetings1" with:
      """
      {
        "subject": "Test",
        "body": "Scrum of Room Manager",
        "start": "2017-09-40T15:00:00.00Z",
        "end": "2017-12-25T17:00:00.00Z",
        "location": "Arani",
        "attendees": [
        "Administrator@arabitpro.local"
        ],
        "optionalAttendees": [
        "stacy.hirano@server.lab"
        ]
      }
      """
    And With the following headers:
      | Content-type         | application/json              |
      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9  |
    When I execute the request
    Then I expect status code 400

  @delete_service
  Scenario: Create a Meeting
    Given I request PUT "meetings/Meetings1" with:
      """
      {
        "subject": "Test",
        "body": "Scrum of Room Manager",
        "start": "",
        "end": "2017-12-25T17:00:00.00Z",
        "location": "Arani",
        "attendees": [
        "Administrator@arabitpro.local"
        ],
        "optionalAttendees": [
        "stacy.hirano@server.lab"
        ]
      }
      """
    And With the following headers:
      | Content-type         | application/json              |
      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9  |
    When I execute the request
    Then I expect status code 400

  @delete_service
  Scenario: Create a Meeting
    Given I request PUT "meetings/Meetings1" with:
      """
      {
        "subject": "Test",
        "body": "Scrum of Room Manager",
        "start": "2017-09-25T19:00:00.00Z",
        "end": "2017-12-25T50:00:00.00Z",
        "location": "Arani",
        "attendees": [
        "Administrator@arabitpro.local"
        ],
        "optionalAttendees": [
        "stacy.hirano@server.lab"
        ]
      }
      """
    And With the following headers:
      | Content-type         | application/json              |
      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9  |
    When I execute the request
    Then I expect status code 400

  @delete_service
  Scenario: Create a Meeting
    Given I request PUT "meetings/Meetings1" with:
      """
      {
        "subject": "Test",
        "body": "Scrum of Room Manager",
        "start": "2017-09-25T15:00:00.00Z",
        "end": "2017-12-25T17:00:00.00Z",
        "location": "",
        "attendees": [
        "Administrator@arabitpro.local"
        ],
        "optionalAttendees": [
        "stacy.hirano@server.lab"
        ]
      }
      """
    And With the following headers:
      | Content-type         | application/json              |
      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9  |
    When I execute the request
    Then I expect status code 200

  @delete_service
  Scenario: Create a Meeting
    Given I request PUT "meetings/Meetings1" with:
      """
      {
        "subject": "Test",
        "body": "Scrum of Room Manager",
        "start": "2017-09-25T16:00:00.00Z",
        "end": "2017-12-25T17:00:00.00Z",
        "location": 4234234,
        "attendees": [
        "Administrator@arabitpro.local"
        ],
        "optionalAttendees": [
        "stacy.hirano@server.lab"
        ]
      }
      """
    And With the following headers:
      | Content-type         | application/json              |
      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9  |
    When I execute the request
    Then I expect status code 400

  @delete_service
  Scenario: Create a Meeting
    Given I request PUT "meetings/Meetings1" with:
      """
      {
        "subject": "Test",
        "body": "Scrum of Room Manager",
        "start": "2017-09-25T16:00:00.00Z",
        "end": "2017-12-25T17:00:00.00Z",
        "location": "Arani",
        "attendees": [
        "24234234234"
        ],
        "optionalAttendees": [
        "stacy.hirano@server.lab"
        ]
      }
      """
    And With the following headers:
      | Content-type         | application/json              |
      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9  |
    When I execute the request
    Then I expect status code 400

  @delete_service
  Scenario: Create a Meeting
    Given I request PUT "meetings/Meetings1" with:
      """
      {
        "subject": "Test",
        "body": "Scrum of Room Manager",
        "start": "2017-09-25T16:00:00.00Z",
        "end": "2017-12-25T17:00:00.00Z",
        "location": "Arani",
        "attendees": [
        ""
        ],
        "optionalAttendees": [
        "stacy.hirano@server.lab"
        ]
      }
      """
    And With the following headers:
      | Content-type         | application/json              |
      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9  |
    When I execute the request
    Then I expect status code 400

  @delete_service
  Scenario: Create a Meeting
    Given I request PUT "meetings/Meetings1" with:
      """
      {
        "subject": "Test",
        "body": "Scrum of Room Manager",
        "start": "2017-09-25T16:00:00.00Z",
        "end": "2017-12-25T17:00:00.00Z",
        "location": "Arani",
        "attendees": [

        ],
        "optionalAttendees": [
        "stacy.hirano@server.lab"
        ]
      }
      """
    And With the following headers:
      | Content-type         | application/json              |
      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9  |
    When I execute the request
    Then I expect status code 200

  @delete_service
  Scenario: Create a Meeting
    Given I request PUT "meetings/Meetings1" with:
      """
      {
        "subject": "Test",
        "body": "Scrum of Room Manager",
        "start": "2017-09-25T16:00:00.00Z",
        "end": "2017-12-25T17:00:00.00Z",
        "location": "Arani",
        "attendees": [
        "Administrator@arabitpro.local"
        ],
        "optionalAttendees": [
        "34534534534345"
        ]
      }
      """
    And With the following headers:
      | Content-type         | application/json              |
      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9  |
    When I execute the request
    Then I expect status code 400

  @delete_service
  Scenario: Create a Meeting
    Given I request PUT "meetings/Meetings1" with:
      """
      {
        "subject": "Test",
        "body": "Scrum of Room Manager",
        "start": "2017-09-25T16:00:00.00Z",
        "end": "2017-12-25T17:00:00.00Z",
        "location": "Arani",
        "attendees": [
        "Administrator@arabitpro.local"
        ],
        "optionalAttendees": [
        ""
        ]
      }
      """
    And With the following headers:
      | Content-type         | application/json              |
      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9  |
    When I execute the request
    Then I expect status code 400

  @delete_service
  Scenario: Create a Meeting
    Given I request PUT "meetings/Meetings1" with:
      """
      {
        "subject": "Test",
        "body": "Scrum of Room Manager",
        "start": "2017-09-25T16:00:00.00Z",
        "end": "2017-12-25T17:00:00.00Z",
        "location": "Arani",
        "attendees": [
        "Administrator@arabitpro.local"
        ],
        "optionalAttendees": [

        ]
      }
      """
    And With the following headers:
      | Content-type         | application/json              |
      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9  |
    When I execute the request
    Then I expect status code 200

  @delete_service
  Scenario: Create a Meeting
    Given I request PUT "meetings/Meetings1" with:
      """
      {
        "subject": "Test",
        "body": "Scrum of Room Manager",
        "start": "2017-09-25T16:00:00.00Z",
        "end": "2017-12-25T17:00:00.00Z",
        "location": "Arani",
        "attendees": [
        "Administrator@arabitpro.local"
        ],
        "optionalAttendees": [
        "stacy.hirano@server.lab"
        ]
      }
      """
    And With the following headers:
      | Content-type         | application/json              |
      | Exchange-credentials | 2342342342342342342342344234  |
    When I execute the request
    Then I expect status code 401

  @delete_service
  Scenario: Create a Meeting
    Given I request PUT "meetings/Meetings1" with:
      """
      {
        "subject": "Test",
        "body": "Scrum of Room Manager",
        "start": "2017-09-25T16:00:00.00Z",
        "end": "2017-12-25T17:00:00.00Z",
        "location": "Arani",
        "attendees": [
        "Administrator@arabitpro.local"
        ],
        "optionalAttendees": [
        "stacy.hirano@server.lab"
        ]
      }
      """
    And With the following headers:
      | Content-type         | application/json              |
      | Exchange-credentials |   |
    When I execute the request
    Then I expect status code 401

