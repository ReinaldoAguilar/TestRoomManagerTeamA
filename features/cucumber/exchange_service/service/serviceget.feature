@exchange @deletebd @create_subscription  @crate_service_room
Feature: Exchange Service
  @smoke
  Scenario: Get Services
    Given I request GET "services"
    When I execute the request
    Then I expect status code 200