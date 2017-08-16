@room
Feature: Update Meetings

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
      | Content-type | application/json             |
      | Credentials  | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 |
    When I execute the request
    And I stored the "_id" of the response [Meetings1]


  Scenario Outline: Get specific meeting
    Given I request GET "meetings/<id>"
    And With the following headers:
      | Content-type         | <content-type> |
      | Exchange-credentials | <credentials>  |
    When I execute the request
    Then I expect status code <code>

    Examples:
      | id              | content-type     | credentials                  | code |
      | Meetings1       | application/json | sfsdfsdfsdfsdfsdfsdfsdffsdfs | 404  |
      | 345345345423423 | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | 400  |
      |                 | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | 200  |
      | Meetings1       | application/json |                              | 404  |