@exchange
Feature: Meetings

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
  Scenario Outline: Delete Meeting
    Given I request DELETE "meetings/<id>"
    And With the following headers:
      | Content-type         | <content-type>         |
      | Exchange-credentials | <exchange-credentials> |
    When I execute the request
    Then I expect status code <code>

    Examples:
      | id              | content-type     | exchange-credentials         | code |
      | Meetings1       | application/json | sfsdfsdfsdfsdfsdfsdfsdffsdfs | 401  |
      | 345345345423423 | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | 400  |
      |                 | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | 404  |
      | Meetings1       | application/json |                              | 401  |
