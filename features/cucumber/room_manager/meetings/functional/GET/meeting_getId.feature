@room
Feature: Get a Specific Meeting from Room Manager

  Background: Create a Meeting
    Given I request POST "meetings" with:
      """
      {
        "organizer": "Administrator@arabitpro.local",
        "subject": "TestMeeting",
        "body": "Scrum of Room Manager",
        "start": "2017-09-25T16:00:00.00Z",
        "end": "2017-12-25T17:00:00.00Z",
        "rooms": [

        ],
        "attendees": [
        "Administrator@arabitpro.local"
        ],
        "optionalAttendees": [
        "stacy.hirano@server.lab"
        ]
      }
      """
    And With the following headers:
      | Content-type | application/json                 |
      | Credentials  | QWRtaW5pc3RyYXRvcjpBQkMxMjN9QA== |
    When I execute the request
    And I stored the "_id" of the response [Meetings1]

  @functional @negative
  Scenario Outline: Get specific meeting
    Given I request GET "meetings/<id>"
    And With the following headers:
      | Content-type | <content-type> |
      | Credentials  | <credentials>  |
    When I execute the request
    Then I expect status code <code>
    And the JSON should be:
      """
          {
            "name": <name>,
             "description": <description>
          }
      """

    Examples:
      | id              | content-type     | credentials                      | code | name                        | description                                                                                   |
      | Meetings1       | application/json | sfsdfsdfsdfsdfsdfsdfsdffsdfs     | 401  | "UnauthorizedExchangeError" | "The provided credentials are incorrect."                                                     |
      | 345345345423423 | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9QA== | 400  | "InvalidIdFormatError"      | "MeetingId argument passed in must be a String of 12 bytes or a string of 24 hex characters." |


  @functional @positive
  Scenario: Get specific meeting
    Given I request GET "meetings/Meetings1"
    And With the following headers:
      | Content-type | application/json                 |
      | Credentials  | QWRtaW5pc3RyYXRvcjpBQkMxMjN9QA== |
    When I execute the request
    Then I expect status code 200