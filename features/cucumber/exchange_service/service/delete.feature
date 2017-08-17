@exchange @deletebd @create_subscription  @crate_service_room
Feature: Delete service by a ID specify
  @functional @negative
  Scenario Outline: Delete request providing an invalid format services

    When I request DELETE "services/<serviceId>"
    And I execute the request
    Then I expect status code <codes>

    Examples:
      | serviceId            | codes |
      | 1233Hfdfd550f        | 400   |
      | 53344343dfsdfssdfdsk | 400   |