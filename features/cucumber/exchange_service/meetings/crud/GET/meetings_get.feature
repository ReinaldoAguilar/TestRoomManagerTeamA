@exchange
Feature: Get Meeting Exchange Service

  @crud @positive
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
    Then I expect status code 200
    And I verify the expected schema for "services"
    And I verify the data in data base "Services1"
    And I verify that values used from request are included in response

  @crud @positive
  Scenario: Get Meetings
    Given I request GET "meetings" with data :
      |start|2017-10-22T14:00:00.000Z|
      |end  |2017-10-22T15:00:00.000Z|
    And With the following headers:
      | Content-type         | application/json              |
      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9  |
      | Exchange-calendar    | Administrator@arabitpro.local |
    When I execute the request
    Then I expect status code 200
    And I verify the expected schema for "services"
    And I verify the data received is according previous POST response
