@exchange
Feature: Delete Meeting Exchange Service



  @functional @negative
  Scenario Outline: Delete Meeting
    Given I request DELETE "meetings/<id>"
    And With the following headers:
      | Content-type         | <content-type>         |
      | Exchange-credentials | <exchange-credentials> |
    When I execute the request
    Then I expect status code <code>
    And the JSON should be:
      """
          {
            "name": <error_name>,
             "description": <error_description>
          }
      """

    Examples:
      | id              | content-type     | exchange-credentials             | code | error_name                  | error_description                                                                                                   |
      | Meetings1       | application/json | sfsdfsdfsdfsdfsdfsdfsdffsdfs     | 401  | "UnauthorizedExchangeError" | "The provided credentials are incorrect."                                                                           |
      | 345345345423423 | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9QA== | 400  | "InvalidIdFormatError"      | "The meetingId '345345345423423' argument passed in must be a String of 12 bytes or a string of 24 hex characters." |
      | Meetings1       | application/json |                                  | 401  | "UnauthorizedExchangeError" | "The provided credentials are incorrect."                                                                           |


  @functional @positive
  Scenario: Delete Meeting
    Given I request DELETE "meetings/Meetings1"
    And With the following headers:
      | Content-type         | application/json                 |
      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9QA== |
    When I execute the request
    Then I expect status code 200