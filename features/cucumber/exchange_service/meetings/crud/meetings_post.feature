@exchange
Feature: Create Meeting

  Background: Create a Meeting
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

  @delete_service
  Scenario: Get Meetings
    Given I request GET "meetings" with data :
      |start|2017-10-22T00:00:00.000Z|
      |end  |2017-10-22T23%3A59%3A59.000Z|
    And With the following headers:
      | Content-type         | application/json              |
      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9  |
      | Exchange-calendar    | Administrator@arabitpro.local |
    When I execute the request
    And I verify the data received is according previous POST response
    Then I expect status code 200
