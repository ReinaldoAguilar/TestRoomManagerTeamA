@room
Feature: Update Meetings Room Manager

  @crud @positive
  Scenario: Create a Meeting
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
    Then I expect status code 200


  @crud @positive
  Scenario: Update a Meeting
    Given I request PUT "meetings/Meetings1" with:
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
    Then I expect status code 200