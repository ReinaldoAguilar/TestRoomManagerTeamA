Feature: Test

  @exchange
  Scenario: Test 3 schema
    Given I request POST "meetings" with:
      """
      {
  "subject": 23423423,
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
    And The name of the service is: [Services1]
    Then I expect status code 200