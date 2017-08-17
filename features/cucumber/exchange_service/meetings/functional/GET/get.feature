@exchange
Feature: Get Meeting Exchange Service

  @functional
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
    And the JSON should be:
      """
          {
            "name": <error_name>,
             "description": <error_description>
          }
      """

    Examples: Negative validation
      | start                     | end                      | content-type     | exchange-credentials             | exchange-calendar             | code | error_name                  | error_description                                                          |
      | 2018-10-22T15:00:00.000Z  | 2017-10-22T16:59:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9QA== | Administrator@arabitpro.local | 400  | "InvalidDateTime"           | "Start dateTime cannot be grater than end dateTime."                       |
      | 2017-11-22T15:00:00.000Z  | 2017-10-22T16:59:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9QA== | Administrator@arabitpro.local | 400  | "InvalidDateTime"           | "Start dateTime cannot be grater than end dateTime."                       |
      | 2017-50-22T15:00:00.000Z  | 2017-10-22T16:59:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9QA== | Administrator@arabitpro.local | 400  | "DateValidationError"       | "Start '2017-50-22T15:00:00.000Z' does not match an ISO-8601 date format"  |
      | 2017-10-30T15:00:00.000Z  | 2017-10-22T16:59:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9QA== | Administrator@arabitpro.local | 400  | "InvalidDateTime"           | "Start dateTime cannot be grater than end dateTime."                       |
      | 2017-10-50T15:00:00.000Z  | 2017-10-22T16:59:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9QA== | Administrator@arabitpro.local | 400  | "DateValidationError"       | "Start '2017-10-50T15:00:00.000Z' does not match an ISO-8601 date format"  |
      | 2017-10-22T19:00:00.000Z  | 2017-10-22T16:59:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9QA== | Administrator@arabitpro.local | 400  | "InvalidDateTime"           | "Start dateTime cannot be grater than end dateTime."                       |
      | 2017-10-22T50:00:00.000Z  | 2017-10-22T16:59:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9QA== | Administrator@arabitpro.local | 400  | "DateValidationError"       | "Start '2017-10-22T50:00:00.000Z' does not match an ISO-8601 date format"  |
      | 2017-10-22T15:70:00.000Z  | 2017-10-22T16:59:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9QA== | Administrator@arabitpro.local | 400  | "DateValidationError"       | "Start '2017-10-22T15:70:00.000Z' does not match an ISO-8601 date format"  |
      | 2017-10-22T15:00:100.000Z | 2017-10-22T16:59:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9QA== | Administrator@arabitpro.local | 400  | "DateValidationError"       | "Start '2017-10-22T15:00:100.000Z' does not match an ISO-8601 date format" |
      | 234234234234234234234234  | 2017-10-22T16:59:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9QA== | Administrator@arabitpro.local | 400  | "DateValidationError"       | "Start '234234234234234234234234' does not match an ISO-8601 date format"  |
      |                           | 2017-10-22T16:59:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9QA== | Administrator@arabitpro.local | 400  | "DateValidationError"       | "Start '' does not match an ISO-8601 date format"                          |
      | 2017-10-22T15:00:00.000Z  | 2015-10-22T16:59:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9QA== | Administrator@arabitpro.local | 400  | "InvalidDateTime"           | "Start dateTime cannot be grater than end dateTime."                       |
      | 2017-10-22T15:00:00.000Z  | 2017-09-22T16:59:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9QA== | Administrator@arabitpro.local | 400  | "InvalidDateTime"           | "Start dateTime cannot be grater than end dateTime."                       |
      | 2017-10-22T15:00:00.000Z  | 2017-40-22T16:59:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9QA== | Administrator@arabitpro.local | 400  | "DateValidationError"       | "End '2017-40-22T16:59:59.000Z' does not match an ISO-8601 date format"    |
      | 2017-10-22T15:00:00.000Z  | 2017-10-20T16:59:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9QA== | Administrator@arabitpro.local | 400  | "InvalidDateTime"           | "Start dateTime cannot be grater than end dateTime."                       |
      | 2017-10-22T15:00:00.000Z  | 2017-10-50T16:59:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9QA== | Administrator@arabitpro.local | 400  | "DateValidationError"       | "End '2017-10-50T16:59:59.000Z' does not match an ISO-8601 date format"    |
      | 2017-10-22T15:00:00.000Z  | 2017-10-22T14:59:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9QA== | Administrator@arabitpro.local | 400  | "InvalidDateTime"           | "Start dateTime cannot be grater than end dateTime."                       |
      | 2017-10-22T15:00:00.000Z  | 2017-10-22T90:59:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9QA== | Administrator@arabitpro.local | 400  | "DateValidationError"       | "End '2017-10-22T90:59:59.000Z' does not match an ISO-8601 date format"    |
      | 2017-10-22T15:00:00.000Z  | 2017-10-22T16:90:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9QA== | Administrator@arabitpro.local | 400  | "DateValidationError"       | "End '2017-10-22T16:90:59.000Z' does not match an ISO-8601 date format"    |
      | 2017-10-22T15:00:00.000Z  | 2017-10-22T16:59:90.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9QA== | Administrator@arabitpro.local | 400  | "DateValidationError"       | "End '2017-10-22T16:59:90.000Z' does not match an ISO-8601 date format"    |
      | 2017-10-22T15:00:00.000Z  | fsdfsdfsdfsdfsdfsdfsdfff | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9QA== | Administrator@arabitpro.local | 400  | "DateValidationError"       | "End 'fsdfsdfsdfsdfsdfsdfsdfff' does not match an ISO-8601 date format"    |
      | 2017-10-22T15:00:00.000Z  |                          | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9QA== | Administrator@arabitpro.local | 400  | "DateValidationError"       | "End '' does not match an ISO-8601 date format"                            |
      | 2017-10-22T15:00:00.000Z  | 2017-10-22T16:59:59.000Z | application/json | 4234234234234234234234234234     | Administrator@arabitpro.local | 401  | "UnauthorizedExchangeError" | "The provided credentials are incorrect."                                  |
      | 2017-10-22T15:00:00.000Z  | 2017-10-22T16:59:59.000Z | application/json | QWRtaW5pc3RyYXRvcjpBQkMxMjN9QA== | sfsdfsdf@sfsdfsd.sfsfsd       | 404  | "AccountNotFoundError"      | "The exchange account doesn't exist."                                      |


  @functional @positive
  Scenario: Get Meetings
    Given I request GET "meetings" with data :
      | start | 2017-10-22T00%3A00%3A00.000Z |
      | end   | 2017-10-22T23%3A59%3A59.000Z |
    And With the following headers:
      | Content-type         | application/json                 |
      | Exchange-credentials | QWRtaW5pc3RyYXRvcjpBQkMxMjN9QA== |
      | Exchange-calendar    | Administrator@arabitpro.local    |
    When I execute the request
    Then I expect status code 200
