@exchange
Feature: Get

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
  Scenario Outline: Get Meetings
    Given I request GET "meetings" with data :
      | start | <start> |
      | end   | <end>   |
    And With the following headers:
      | Content-type         | <content-type>         |
      | Exchange-credentials | <exchange-credentials> |
      | Exchange-calendar    | <exchange-calendar>    |
    When I execute the request
    Then I expect status code <code>

    Examples: Negative validation
      | start                     | end                      | content-type     | exchange-credentials         | exchange-calendar             | code |
      | 2018-10-22T15:00:00.000Z  | 2017-10-22T16:59:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | Administrator@arabitpro.local | 400  |
      | 2017-11-22T15:00:00.000Z  | 2017-10-22T16:59:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | Administrator@arabitpro.local | 400  |
      | 2017-50-22T15:00:00.000Z  | 2017-10-22T16:59:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | Administrator@arabitpro.local | 400  |
      | 2017-10-30T15:00:00.000Z  | 2017-10-22T16:59:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | Administrator@arabitpro.local | 400  |
      | 2017-10-50T15:00:00.000Z  | 2017-10-22T16:59:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | Administrator@arabitpro.local | 400  |
      | 2017-10-22T19:00:00.000Z  | 2017-10-22T16:59:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | Administrator@arabitpro.local | 400  |
      | 2017-10-22T50:00:00.000Z  | 2017-10-22T16:59:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | Administrator@arabitpro.local | 400  |
      | 2017-10-22T15:70:00.000Z  | 2017-10-22T16:59:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | Administrator@arabitpro.local | 400  |
      | 2017-10-22T15:00:100.000Z | 2017-10-22T16:59:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | Administrator@arabitpro.local | 400  |
      | 234234234234234234234234  | 2017-10-22T16:59:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | Administrator@arabitpro.local | 400  |
      |                           | 2017-10-22T16:59:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | Administrator@arabitpro.local | 400  |
      | 2017-10-22T15:00:00.000Z  | 2015-10-22T16:59:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | Administrator@arabitpro.local | 400  |
      | 2017-10-22T15:00:00.000Z  | 2017-09-22T16:59:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | Administrator@arabitpro.local | 400  |
      | 2017-10-22T15:00:00.000Z  | 2017-40-22T16:59:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | Administrator@arabitpro.local | 400  |
      | 2017-10-22T15:00:00.000Z  | 2017-10-20T16:59:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | Administrator@arabitpro.local | 400  |
      | 2017-10-22T15:00:00.000Z  | 2017-10-50T16:59:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | Administrator@arabitpro.local | 400  |
      | 2017-10-22T15:00:00.000Z  | 2017-10-22T14:59:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | Administrator@arabitpro.local | 400  |
      | 2017-10-22T15:00:00.000Z  | 2017-10-22T90:59:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | Administrator@arabitpro.local | 400  |
      | 2017-10-22T15:00:00.000Z  | 2017-10-22T16:90:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | Administrator@arabitpro.local | 400  |
      | 2017-10-22T15:00:00.000Z  | 2017-10-22T16:59:90.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | Administrator@arabitpro.local | 400  |
      | 2017-10-22T15:00:00.000Z  | fsdfsdfsdfsdfsdfsdfsdfff | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | Administrator@arabitpro.local | 400  |
      | 2017-10-22T15:00:00.000Z  |                          | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | Administrator@arabitpro.local | 400  |
      | 2017-10-22T15:00:00.000Z  | 2017-10-22T16:59:59.000Z | application/json | 4234234234234234234234234234 | Administrator@arabitpro.local | 401  |
      | 2017-10-22T15:00:00.000Z  | 2017-10-22T16:59:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9 | sfsdfsdf@sfsdfsd.sfsfsd       | 404  |


  @delete_service
  Scenario: Get Meetings
    Given I request GET "meetings" with data :
      |start|2017-10-22T00%3A00%3A00.000Z|
      |end  |2017-10-22T23%3A59%3A59.000Z|
    And With the following headers:
      | Content-type         | application/json              |
      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9  |
      | Exchange-calendar    | Administrator@arabitpro.local |
    When I execute the request
    Then I expect status code 200
