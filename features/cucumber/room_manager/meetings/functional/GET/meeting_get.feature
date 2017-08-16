@room
Feature: Create Meeting

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
      | Content-type | application/json             |
      | Credentials  | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 |
    When I execute the request
    And I stored the "_id" of the response [Services1]
    Then I expect status code 200

  @delete_service
  Scenario Outline: Get Meetings
    Given I request GET "meetings" with data :
      | owner | <owner> |
      | start | <start> |
      | end   | <end>   |
    And With the following headers:
      | Content-type | <content-type> |
      | Credentials  | <credentials>  |
    When I execute the request
    Then I expect status code <code>

    Examples:

      | owner                         | start                      | end                       | content-type     | credentials                  | code | name | description |
      | Administrator@arabitpro.local | "2017-10-25T16:00:00.00Z"  | "2017-10-25T17:00:00.00Z" | application/json | 312312312312312331231        | 400  |      |             |
      | Administrator@arabitpro.local | "2017-10-25T16:00:00.00Z"  | "2017-10-25T17:00:00.00Z" | application/json |                              | 404  |      |             |
      | 12234234234234234234234234234 | "2017-10-25T16:00:00.00Z"  | "2017-10-25T17:00:00.00Z" | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | 400  |      |             |
      |                               | "2017-10-25T16:00:00.00Z"  | "2017-10-25T17:00:00.00Z" | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | 400  |      |             |
      | Administrator@arabitpro.local | "2018-10-25T16:00:00.00Z"  | "2017-10-25T17:00:00.00Z" | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | 400  |      |             |
      | Administrator@arabitpro.local | "2017-14-25T16:00:00.00Z"  | "2017-10-25T17:00:00.00Z" | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | 400  |      |             |
      | Administrator@arabitpro.local | "2017-10-40T16:00:00.00Z"  | "2017-10-25T17:00:00.00Z" | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | 400  |      |             |
      | Administrator@arabitpro.local | "2017-10-40T19:00:00.00Z"  | "2017-10-25T17:00:00.00Z" | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | 400  |      |             |
      | Administrator@arabitpro.local | "2017-10-40T50:00:00.00Z"  | "2017-10-25T17:00:00.00Z" | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | 400  |      |             |
      | Administrator@arabitpro.local | "2017-10-40T-15:00:00.00Z" | "2017-10-25T17:00:00.00Z" | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | 400  |      |             |
      | Administrator@arabitpro.local | "2017-10-40T15:100:00.00Z" | "2017-10-25T17:00:00.00Z" | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | 400  |      |             |
      | Administrator@arabitpro.local | "2017-10-40T15:00:100.00Z" | "2017-10-25T17:00:00.00Z" | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | 400  |      |             |
      | Administrator@arabitpro.local | 3123123123123123123123123  | "2017-10-25T17:00:00.00Z" | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | 400  |      |             |
      | Administrator@arabitpro.local | " "                        | "2017-10-25T17:00:00.00Z" | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | 400  |      |             |
      | Administrator@arabitpro.local | "2017-10-25T16:00:00.00Z"  | "2015-10-25T17:00:00.00Z" | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | 400  |      |             |
      | Administrator@arabitpro.local | "2017-10-25T16:00:00.00Z"  | "2017-18-25T17:00:00.00Z" | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | 400  |      |             |
      | Administrator@arabitpro.local | "2017-10-25T16:00:00.00Z"  | "2017-10-50T17:00:00.00Z" | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | 400  |      |             |
      | Administrator@arabitpro.local | "2017-10-25T16:00:00.00Z"  | 5345345345345345343453455 | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | 400  |      |             |
      | Administrator@arabitpro.local | "2017-10-25T16:00:00.00Z"  | " "                       | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | 400  |      |             |
