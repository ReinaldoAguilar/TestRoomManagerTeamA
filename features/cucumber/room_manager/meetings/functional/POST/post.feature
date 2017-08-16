@room
Feature: Create Meeting

  ## TODO  add tags, change JSON with parameters, change header values, change to outline, add copyritgh(autor), addvalidations, report

  Scenario: Create a Meeting
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
      | Content-type | application/json             |
      | Credentials  | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 |
    When I execute the request
    And I stored the "_id" of the response [Services1]
    Then I expect status code 200