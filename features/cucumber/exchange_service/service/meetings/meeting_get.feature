@exchange
Feature: Get Meetings

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
