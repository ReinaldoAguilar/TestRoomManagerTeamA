@exchange
Feature: Create Meetings Exchange Service

  @functional @negative
  Scenario Outline: Create a Meeting
    Given I request POST "meetings" with:
      """
      {
  "subject": <subject>,
  "body": <body>,
  "start": <start>,
  "end": <end>,
  "location": <location>,
  "attendees": [
    <attendees>
  ],
  "optionalAttendees": [
    <optionalAttendees>
  ]
}
      """
    And With the following headers:
      | Content-type         | application/json              |
      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9  |
      | Exchange-calendar    | Administrator@arabitpro.local |
    When I execute the request
    Then I expect status code <code>
    And the JSON should be:
      """
          {
            "name": <error_name>,
             "description": <error_description>
          }
      """

    Examples:
      | subject | body                    | start                      | end                       | location | attendees                       | optionalAttendees         | code | error_name              | error_description                                         |
      | 234242  | "Scrum of Room Manager" | "2017-10-25T16:00:00.00Z"  | "2017-10-25T17:00:00.00Z" | "Arani"  | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  | "SchemaValidationError" | "data.subject should be string"                           |
      | "Test"  | 34534534534534534534534 | "2017-10-25T16:00:00.00Z"  | "2017-10-25T17:00:00.00Z" | "Arani"  | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  | "SchemaValidationError" | "data.body should be string,null"                         |
      | "Test"  | "Scrum of Room Manager" | "2018-10-25T16:00:00.00Z"  | "2017-10-25T17:00:00.00Z" | "Arani"  | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  | "SchemaValidationError" | "Start shouldn't be greater than End."                    |
      | "Test"  | "Scrum of Room Manager" | "2017-14-25T16:00:00.00Z"  | "2017-10-25T17:00:00.00Z" | "Arani"  | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  | "ExchangeError"         | "The specified date isn't valid."                         |
      | "Test"  | "Scrum of Room Manager" | "2017-10-40T16:00:00.00Z"  | "2017-10-25T17:00:00.00Z" | "Arani"  | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  | "SchemaValidationError" | "data.start should match format \"date-time\""            |
      | "Test"  | "Scrum of Room Manager" | "2017-10-40T19:00:00.00Z"  | "2017-10-25T17:00:00.00Z" | "Arani"  | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  | "SchemaValidationError" | "data.start should match format \"date-time\""            |
      | "Test"  | "Scrum of Room Manager" | "2017-10-40T50:00:00.00Z"  | "2017-10-25T17:00:00.00Z" | "Arani"  | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  | "SchemaValidationError" | "data.start should match format \"date-time\""            |
      | "Test"  | "Scrum of Room Manager" | "2017-10-40T-15:00:00.00Z" | "2017-10-25T17:00:00.00Z" | "Arani"  | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  | "SchemaValidationError" | "data.start should match format \"date-time\""            |
      | "Test"  | "Scrum of Room Manager" | "2017-10-40T15:100:00.00Z" | "2017-10-25T17:00:00.00Z" | "Arani"  | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  | "SchemaValidationError" | "data.start should match format \"date-time\""            |
      | "Test"  | "Scrum of Room Manager" | "2017-10-40T15:00:100.00Z" | "2017-10-25T17:00:00.00Z" | "Arani"  | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  | "SchemaValidationError" | "data.start should match format \"date-time\""            |
      | "Test"  | "Scrum of Room Manager" | 3123123123123123123123123  | "2017-10-25T17:00:00.00Z" | "Arani"  | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  | "SchemaValidationError" | "data.start should be string"                             |
      | "Test"  | "Scrum of Room Manager" | " "                        | "2017-10-25T17:00:00.00Z" | "Arani"  | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  | "SchemaValidationError" | "data.start should match format \"date-time\""            |
      | "Test"  | "Scrum of Room Manager" | "2017-10-25T16:00:00.00Z"  | "2015-10-25T17:00:00.00Z" | "Arani"  | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  | "SchemaValidationError" | "Start shouldn't be greater than End."                    |
      | "Test"  | "Scrum of Room Manager" | "2017-10-25T16:00:00.00Z"  | "2017-18-25T17:00:00.00Z" | "Arani"  | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  | "ExchangeError"         | "The specified date isn't valid."                         |
      | "Test"  | "Scrum of Room Manager" | "2017-10-25T16:00:00.00Z"  | "2017-10-50T17:00:00.00Z" | "Arani"  | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  | "SchemaValidationError" | "data.end should match format \"date-time\""              |
      | "Test"  | "Scrum of Room Manager" | "2017-10-25T16:00:00.00Z"  | 5345345345345345343453455 | "Arani"  | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  | "SchemaValidationError" | "data.end should be string"                               |
      | "Test"  | "Scrum of Room Manager" | "2017-10-25T16:00:00.00Z"  | " "                       | "Arani"  | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  | "SchemaValidationError" | "data.end should match format \"date-time\""              |
      | "Test"  | "Scrum of Room Manager" | "2017-10-25T16:00:00.00Z"  | "2017-10-25T17:00:00.00Z" | 3534534  | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  | "SchemaValidationError" | "data.location should be string"                          |
      | "Test"  | "Scrum of Room Manager" | "2017-10-25T16:00:00.00Z"  | "2017-10-25T17:00:00.00Z" | "Arani"  | "42342342344234234234234234234" | "stacy.hirano@server.lab" | 400  | "SchemaValidationError" | "data.attendees[0] should match format \"email\""         |
      | "Test"  | "Scrum of Room Manager" | "2017-10-25T16:00:00.00Z"  | "2017-10-25T17:00:00.00Z" | "Arani"  | " "                             | "stacy.hirano@server.lab" | 400  | "SchemaValidationError" | "The '.attendees[0]' is invalid"                          |
      | "Test"  | "Scrum of Room Manager" | "2017-10-25T16:00:00.00Z"  | "2017-10-25T17:00:00.00Z" | "Arani"  | "Administrator@arabitpro.local" | "23423423423423423455345" | 400  | "SchemaValidationError" | "data.optionalAttendees[0] should match format \"email\"" |
      | "Test"  | "Scrum of Room Manager" | "2017-10-25T16:00:00.00Z"  | "2017-10-25T17:00:00.00Z" | "Arani"  | "Administrator@arabitpro.local" | " "                       | 400  | "SchemaValidationError" | "The '.optionalAttendees[0]' is invalid"                  |

  @functional @positive
  Scenario: Create a Meeting
    Given I request POST "meetings" with:
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
      | Exchange-calendar    | Administrator@arabitpro.local |
    When I execute the request
    And I stored the "_id" of the response [Meetings1]
    And I verify that values used from request are included in response
    Then I expect status code 200

  @functional @positive
  Scenario: Create a Meeting
    Given I request POST "meetings" with:
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
      | Exchange-calendar    | Administrator@arabitpro.local |
    When I execute the request
    And I stored the "_id" of the response [Meetings1]
    And I verify that values used from request are included in response
    Then I expect status code 200

  @functional @positive
  Scenario: Create a Meeting
    Given I request POST "meetings" with:
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
      | Exchange-calendar    | Administrator@arabitpro.local |
    When I execute the request
    And I stored the "_id" of the response [Meetings1]
    And I verify that values used from request are included in response
    Then I expect status code 200

  @functional @positive
  Scenario: Create a Meeting
    Given I request POST "meetings" with:
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
      | Exchange-calendar    | Administrator@arabitpro.local |
    When I execute the request
    And I stored the "_id" of the response [Meetings1]
    And I verify that values used from request are included in response
    Then I expect status code 200

  @functional @positive
  Scenario: Create a Meeting
    Given I request POST "meetings" with:
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
      | Exchange-calendar    | Administrator@arabitpro.local |
    When I execute the request
    And I stored the "_id" of the response [Meetings1]
    And I verify that values used from request are included in response
    Then I expect status code 200

  @functional @positive
  Scenario: Create a Meeting
    Given I request POST "meetings" with:
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
      | Exchange-calendar    | Administrator@arabitpro.local |
    When I execute the request
    And I stored the "_id" of the response [Meetings1]
    And I verify that values used from request are included in response
    Then I expect status code 200

  @functional @positive
  Scenario: Create a Meeting
    Given I request POST "meetings" with:
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
      | Exchange-calendar    | Administrator@arabitpro.local |
    When I execute the request
    And I stored the "_id" of the response [Meetings1]
    And I verify that values used from request are included in response
    Then I expect status code 200

  @functional @positive
  Scenario: Create a Meeting
    Given I request POST "meetings" with:
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
      | Exchange-calendar    | Administrator@arabitpro.local |
    When I execute the request
    And I stored the "_id" of the response [Meetings1]
    And I verify that values used from request are included in response
    Then I expect status code 200

  @functional @positive
  Scenario: Create a Meeting
    Given I request POST "meetings" with:
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
      | Content-type         | application/json             |
      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 |
      | Exchange-calendar    |                              |
    When I execute the request
    And I stored the "_id" of the response [Meetings1]
    And I verify that values used from request are included in response
    Then I expect status code 200
