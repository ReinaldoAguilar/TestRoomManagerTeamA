@room @deletebd @create_subscription  @crate_service_room
Feature: Get All Rooms Created

  @smoke
  Scenario Outline: Get all rooms with status free
    Given I request GET "rooms" with data :
      | from   | 2016-02-01T00:00:00.000Z |
      | to     | 2016-02-01T00:00:59.000Z |
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

  @functional
  Scenario Outline: Return a room with a specific tag
    Given I request GET "rooms" with data :
      | $select | <select>                 |
      | from    | 2017-01-01T00:00:01.000Z |
      | to      | 2017-01-01T00:00:59.000Z |
      | status  | <status>                 |
    When I execute the request
    Then I expect status code <codes>
    And The response header should exist
      | Content-type | application/json |
    And the JSON should be:
          """
          {
            "name":"<name>",
            "description":"Attribute field with value '<tag>' does not exist."
          }
          """
    Examples: No special characters in room
      | select | status | codes | name              | tag   |
      | _room  | free   | 400   | InvalidFieldFound | _room |
      | 12124  | free   | 400   | InvalidFieldFound | 12124 |
      | -123   | free   | 400   | InvalidFieldFound | -123  |
      | _room  | busy   | 400   | InvalidFieldFound | _room |
      | 12124  | busy   | 400   | InvalidFieldFound | 12124 |
      | -123   | busy   | 400   | InvalidFieldFound | -123  |
      | _room  |        | 400   | InvalidFieldFound | _room |
      | 12124  |        | 400   | InvalidFieldFound | 12124 |
      | -123   |        | 400   | InvalidFieldFound | -123  |


  @functional
  Scenario Outline: Negative combinations for Room scenarios
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
      | select | from                     | to                       | status | name       | codes | description                                                            |
      |        |                          | 2017-02-01T00:00:59.000Z | free   | BadRequest | 400   | To get rooms in range of time, FROM, TO and STATUS params must be sent |
      |        |                          | 2017-02-01T00:00:59.000Z | busy   | BadRequest | 400   | To get rooms in range of time, FROM, TO and STATUS params must be sent |
      |        | 2017-02-01T00:00:00.000Z |                          | free   | BadRequest | 400   | To get rooms in range of time, FROM, TO and STATUS params must be sent |
      |        | 2017-02-01T00:00:00.000Z |                          | busy   | BadRequest | 400   | To get rooms in range of time, FROM, TO and STATUS params must be sent |
      |        |                          |                          | free   | BadRequest | 400   | To get rooms in range of time, FROM, TO and STATUS params must be sent |
      |        |                          |                          | busy   | BadRequest | 400   | To get rooms in range of time, FROM, TO and STATUS params must be sent |
      |        | character%               | 2017-02-01T00:00:59.000Z | free   | NotFound   | 400   | To get rooms in range of time, FROM, TO and STATUS params must be sent |
      |        | -190                     | 2017-02-01T00:00:59.000Z | free   | BadRequest | 400   | Invalid status param                                                   |
      |        | 2017-02-01T00:00:00.000Z | 2017-02-01T00:00:59.000Z |        | BadRequest | 400   | To get rooms in range of time, FROM, TO and STATUS params must be sent |
      |        | 2017-02-01T00:00:00.000Z | 2017-02-01T00:00:59.000Z | 4545   | BadRequest | 400   | Invalid status param                                                   |
      |        | 2017-02-01T00:00:00.000Z | 2017-02-01T00:00:59.000Z | ^%busy | BadRequest | 400   | Invalid status param                                                   |

  @functional
  Scenario Outline: Retrieve a  room using id
    Given I request GET "rooms/<id>" with data :
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
                "description":"<description>"
              }
              """
    Examples:
      | id       | codes | name       | description                                                                              |
      | reyree   | 400   | BadRequest | RoomId argument passed in must be a String of 12 bytes or a string of 24 hex characters. |
      | "String" | 400   | BadRequest | RoomId argument passed in must be a String of 12 bytes or a string of 24 hex characters. |
      |          | 400   | BadRequest | RoomId argument is invalid format                                                        |