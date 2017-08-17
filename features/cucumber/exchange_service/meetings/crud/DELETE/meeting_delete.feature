@exchange
Feature: Delete Meeting Exchange Service

  @crud @positive
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

  @crud @positive
  Scenario: Delete Meeting
    Given I request DELETE "meetings/Meetings1"
    And With the following headers:
      | Content-type         | application/json              |
      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9  |
    When I execute the request
    Then I expect status code 200
