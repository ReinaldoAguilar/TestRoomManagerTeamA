@room
Feature:  a empty services

  Scenario: Get Service without service created
    Given I request GET "services"
      And With the following headers:
      | Content-type | application/json |
    When I execute the request
    Then I expect status code 200
      And the JSON should be:
      """
      []
      """