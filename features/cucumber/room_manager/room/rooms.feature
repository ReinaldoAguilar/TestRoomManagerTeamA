@room @deletebd @create_subscription  @crate_service_room
Feature: rooms


   @smoke
  Scenario Outline: Get all rooms with status free
    Given I request GET "rooms" with data :
      | from   | 2017-02-01T00:00:00.000Z |
      | to     | 2017-02-01T00:00:59.000Z |
      | status | <status>                 |
    When I execute the request
    Then I expect status code 200
    And the JSON should be:
      """
      []
      """
    Examples:
      | status |
      | free   |

  @funtional
  Scenario Outline:Negative combinations for Room scenarios
    Given I request GET "rooms" with data :
      | $select | <select> |
      | from    | <from>   |
      | to      | <to>     |
      | status  | <status> |
    And With the following headers:
      | Content-type | application/json |
    When I execute the request
    Then I expect status code <codes>
    And The response header should exist
      | Content-type | application/json |
    And the JSON should be:
          """
          {
            "name":"<name>",
            "description":"<description>\n    StatusCode: <codes>"
          }
          """
    Examples: No special characters in room
      | select | from | to                       | status | name       | codes | description                                                            |
      |        |      | 2017-02-01T00:00:59.000Z | free   | BadRequest | 400   | To get rooms in range of time, FROM, TO and STATUS params must be sent |
      |        |      | 2017-02-01T00:00:59.000Z | busy   | BadRequest | 400   | To get rooms in range of time, FROM, TO and STATUS params must be sent |

