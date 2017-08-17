@room @funtional
Feature: Update Meetings Room Manager

  Background: Create a Meeting
    Given I request POST "meetings" with:
      """
      {
  "organizer": "Administrator@arabitpro.local",
  "subject": "Scrum Test",
  "body": "Test meeting",
  "start": "2017-08-11T14:15:34.320Z",
  "end": "2017-08-11T14:15:34.320Z",
  "rooms": [

  ],
  "attendees": [
    "Administrator@arabitpro.local"
  ],
  "optionalAttendees": [
    "cougar@animals.com"
  ]
}
      """
    And With the following headers:
      | Content-type | application/json                 |
      | Credentials  | QWRtaW5pc3RyYXRvcjpBQkMxMjN9QA== |
    When I execute the request
    And I stored the "_id" of the response [Meeting1]
    Then I expect status code 200


  @functional @negative
  Scenario Outline: Create a Meeting
    Given I request PUT "meetings/Meeting1" with:
      """
      {
  "organizer": <organizer>,
  "subject": <subject>,
  "body": <body>,
  "start": <start>,
  "end": <end>,
  "rooms": [
           <rooms>
        ],
  "attendees": [
    <attendees>
  ],
  "optionalAttendees": [
    <optionalAttendees>
  ]
}
      """
    And With the following headers:
      | Content-type | application/json                 |
      | Credentials  | QWRtaW5pc3RyYXRvcjpBQkMxMjN9QA== |
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
      | organizer                       | subject | body                    | start                     | end                       | rooms     | attendees                       | optionalAttendees         | code | error_name              | error_description                                                   |
      | "42342342342342342342342342342" | 234242  | "Scrum of Room Manager" | "2017-10-25T16:00:00.00Z" | "2017-10-25T17:00:00.00Z" |           | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  | "ValidationError"       | "data.organizer should match format \"email\""                      |
      | " "                             | "Test"  | "Scrum of Room Manager" | "2017-10-25T16:00:00.00Z" | "2017-10-25T17:00:00.00Z" |           | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  | "ValidationError"       | "data.organizer should NOT be shorter than 5 characters"            |
      | 4234234234234234234232342342342 | "Test"  | "Scrum of Room Manager" | "2018-10-25T16:00:00.00Z" | "2017-10-25T17:00:00.00Z" |           | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  | "ValidationError"       | "data.organizer should be string"                                   |
      | "Administrator@arabitpro.local" | 4234234 | "Scrum of Room Manager" | "2017-14-25T16:00:00.00Z" | "2017-10-25T17:00:00.00Z" |           | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  | "ValidationError"       | "data.subject should be string"                                     |
      | "Administrator@arabitpro.local" | "Test"  | 42342342342342342342324 | "2017-10-40T16:00:00.00Z" | "2017-10-25T17:00:00.00Z" |           | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  | "ValidationError"       | "data.body should be string,null"                                   |
      | "Administrator@arabitpro.local" | "Test"  | "Scrum of Room Manager" | "2018-10-25T16:00:00.00Z" | "2017-10-25T17:00:00.00Z" |           | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  | "SchemaValidationError" | "Start shouldn't be greater than End."                              |
      | "Administrator@arabitpro.local" | "Test"  | "Scrum of Room Manager" | "2017-14-25T16:00:00.00Z" | "2017-10-25T17:00:00.00Z" |           | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  | "ExchangeError"         | "The specified date isn't valid."                                   |
      | "Administrator@arabitpro.local" | "Test"  | "Scrum of Room Manager" | "2017-10-40T16:00:00.00Z" | "2017-10-25T17:00:00.00Z" |           | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  | "ValidationError"       | "data.start should match format \"date-time\""                      |
      | "Administrator@arabitpro.local" | "Test"  | "Scrum of Room Manager" | 3123123123123123123123123 | "2017-10-25T17:00:00.00Z" |           | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  | "SchemaValidationError" | "data.start should be string"                                       |
      | "Administrator@arabitpro.local" | "Test"  | "Scrum of Room Manager" | " "                       | "2017-10-25T17:00:00.00Z" |           | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  | "ValidationError"       | "data.start should match format \"date-time\""                      |
      | "Administrator@arabitpro.local" | "Test"  | "Scrum of Room Manager" | "2017-10-25T16:00:00.00Z" | "2015-10-25T17:00:00.00Z" |           | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  | "SchemaValidationError" | "Start shouldn't be greater than End."                              |
      | "Administrator@arabitpro.local" | "Test"  | "Scrum of Room Manager" | "2017-10-25T16:00:00.00Z" | "2017-18-25T17:00:00.00Z" |           | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  | "ExchangeError"         | "The specified date isn't valid."                                   |
      | "Administrator@arabitpro.local" | "Test"  | "Scrum of Room Manager" | "2017-10-25T16:00:00.00Z" | "2017-10-50T17:00:00.00Z" |           | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  | "ValidationError"       | "data.end should match format \"date-time\""                        |
      | "Administrator@arabitpro.local" | "Test"  | "Scrum of Room Manager" | "2017-10-25T16:00:00.00Z" | 2342342342342342342342344 |           | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  | "SchemaValidationError" | "data.end should be string"                                         |
      | "Administrator@arabitpro.local" | "Test"  | "Scrum of Room Manager" | "2017-10-25T16:00:00.00Z" | " "                       |           | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  | "ValidationError"       | "data.end should match format \"date-time\""                        |
      | "Administrator@arabitpro.local" | "Test"  | "Scrum of Room Manager" | "2017-10-25T16:00:00.00Z" | "2017-10-25T17:00:00.00Z" | "3534534" | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  | "ValidationError"       | "data.rooms[0] should match format \"email\""                       |
      | "Administrator@arabitpro.local" | "Test"  | "Scrum of Room Manager" | "2017-10-25T16:00:00.00Z" | "2017-10-25T17:00:00.00Z" | " "       | "Administrator@arabitpro.local" | "stacy.hirano@server.lab" | 400  | "ValidationError"       | "data.rooms[0] should NOT be shorter than 5 characters"             |
      | "Administrator@arabitpro.local" | "Test"  | "Scrum of Room Manager" | "2017-10-25T16:00:00.00Z" | "2017-10-25T17:00:00.00Z" |           | "24234234234234234234234234fsd" | "stacy.hirano@server.lab" | 400  | "ValidationError"       | "data.attendees[0] should match format \"email\""                   |
      | "Administrator@arabitpro.local" | "Test"  | "Scrum of Room Manager" | "2017-10-25T16:00:00.00Z" | "2017-10-25T17:00:00.00Z" |           | " "                             | "stacy.hirano@server.lab" | 400  | "ValidationError"       | "data.attendees[0] should NOT be shorter than 5 characters"         |
      | "Administrator@arabitpro.local" | "Test"  | "Scrum of Room Manager" | "2017-10-25T16:00:00.00Z" | "2017-10-25T17:00:00.00Z" |           | "Administrator@arabitpro.local" | "53453453453453453453555" | 400  | "ValidationError"       | "data.optionalAttendees[0] should match format \"email\""           |
      | "Administrator@arabitpro.local" | "Test"  | "Scrum of Room Manager" | "2017-10-25T16:00:00.00Z" | "2017-10-25T17:00:00.00Z" |           | "Administrator@arabitpro.local" | " "                       | 400  | "ValidationError"       | "data.optionalAttendees[0] should NOT be shorter than 5 characters" |


  @functional @positive
  Scenario: Create a Meeting
    Given I request PUT "meetings/Meeting1" with:
      """
      {
  "organizer": "Administrator@arabitpro.local",
  "subject": "Scrum Test",
  "body": "Test meeting",
  "start": "2017-08-11T14:15:34.320Z",
  "end": "2017-08-11T14:15:34.320Z",
  "rooms": [

  ],
  "attendees": [
    "Administrator@arabitpro.local"
  ],
  "optionalAttendees": [
    "cougar@animals.com"
  ]
}
      """
    And With the following headers:
      | Content-type | application/json                 |
      | Credentials  | QWRtaW5pc3RyYXRvcjpBQkMxMjN9QA== |
    When I execute the request
    Then I expect status code 200


  @functional @positive
  Scenario: Create a Meeting
    Given I request PUT "meetings/Meeting1" with:
      """
      {
  "organizer": "Administrator@arabitpro.local",
  "subject": "242342342342",
  "body": "Test meeting",
  "start": "2017-08-11T14:15:34.320Z",
  "end": "2017-08-11T14:15:34.320Z",
  "rooms": [

  ],
  "attendees": [
    "Administrator@arabitpro.local"
  ],
  "optionalAttendees": [
    "cougar@animals.com"
  ]
}
      """
    And With the following headers:
      | Content-type | application/json                 |
      | Credentials  | QWRtaW5pc3RyYXRvcjpBQkMxMjN9QA== |
    When I execute the request
    Then I expect status code 200


  @functional @positive
  Scenario: Create a Meeting
    Given I request PUT "meetings/Meeting1" with:
      """
      {
  "organizer": "Administrator@arabitpro.local",
  "subject": "",
  "body": "Test meeting",
  "start": "2017-08-11T14:15:34.320Z",
  "end": "2017-08-11T14:15:34.320Z",
  "rooms": [

  ],
  "attendees": [
    "Administrator@arabitpro.local"
  ],
  "optionalAttendees": [
    "cougar@animals.com"
  ]
}
      """
    And With the following headers:
      | Content-type | application/json                 |
      | Credentials  | QWRtaW5pc3RyYXRvcjpBQkMxMjN9QA== |
    When I execute the request
    Then I expect status code 200


  @functional @positive
  Scenario: Create a Meeting
    Given I request PUT "meetings/Meeting1" with:
      """
      {
  "organizer": "Administrator@arabitpro.local",
  "subject": "Scrum Test",
  "body": "345345345345",
  "start": "2017-08-11T14:15:34.320Z",
  "end": "2017-08-11T14:15:34.320Z",
  "rooms": [

  ],
  "attendees": [
    "Administrator@arabitpro.local"
  ],
  "optionalAttendees": [
    "cougar@animals.com"
  ]
}
      """
    And With the following headers:
      | Content-type | application/json                 |
      | Credentials  | QWRtaW5pc3RyYXRvcjpBQkMxMjN9QA== |
    When I execute the request
    Then I expect status code 200


  @functional @positive
  Scenario: Create a Meeting
    Given I request PUT "meetings/Meeting1" with:
      """
      {
  "organizer": "Administrator@arabitpro.local",
  "subject": "Scrum Test",
  "body": "",
  "start": "2017-08-11T14:15:34.320Z",
  "end": "2017-08-11T14:15:34.320Z",
  "rooms": [

  ],
  "attendees": [
    "Administrator@arabitpro.local"
  ],
  "optionalAttendees": [
    "cougar@animals.com"
  ]
}
      """
    And With the following headers:
      | Content-type | application/json                 |
      | Credentials  | QWRtaW5pc3RyYXRvcjpBQkMxMjN9QA== |
    When I execute the request
    Then I expect status code 200


  @functional @positive
  Scenario: Create a Meeting
    Given I request PUT "meetings/Meeting1" with:
      """
      {
  "organizer": "Administrator@arabitpro.local",
  "subject": "Scrum Test",
  "body": "Test meeting",
  "start": "2017-08-11T14:15:34.320Z",
  "end": "2017-08-11T14:15:34.320Z",
  "rooms": [

  ],
  "attendees": [
    "Administrator@arabitpro.local"
  ],
  "optionalAttendees": [
    "cougar@animals.com"
  ]
}
      """
    And With the following headers:
      | Content-type | application/json                 |
      | Credentials  | QWRtaW5pc3RyYXRvcjpBQkMxMjN9QA== |
    When I execute the request
    Then I expect status code 200


  @functional @positive
  Scenario: Create a Meeting
    Given I request PUT "meetings/Meeting1" with:
      """
      {
  "organizer": "Administrator@arabitpro.local",
  "subject": "Scrum Test",
  "body": "Test meeting",
  "start": "2017-08-11T14:15:34.320Z",
  "end": "2017-08-11T14:15:34.320Z",
  "rooms": [

  ],
  "attendees": [

  ],
  "optionalAttendees": [
    "cougar@animals.com"
  ]
}
      """
    And With the following headers:
      | Content-type | application/json                 |
      | Credentials  | QWRtaW5pc3RyYXRvcjpBQkMxMjN9QA== |
    When I execute the request
    Then I expect status code 200


  @functional @positive
  Scenario: Create a Meeting
    Given I request PUT "meetings/Meeting1" with:
      """
      {
  "organizer": "Administrator@arabitpro.local",
  "subject": "Scrum Test",
  "body": "Test meeting",
  "start": "2017-08-11T14:15:34.320Z",
  "end": "2017-08-11T14:15:34.320Z",
  "rooms": [

  ],
  "attendees": [
    "Administrator@arabitpro.local"
  ],
  "optionalAttendees": [

  ]
}
      """
    And With the following headers:
      | Content-type | application/json                 |
      | Credentials  | QWRtaW5pc3RyYXRvcjpBQkMxMjN9QA== |
    When I execute the request
    Then I expect status code 200

