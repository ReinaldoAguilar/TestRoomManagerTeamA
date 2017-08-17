@room @crate_subscription_exchange
Feature: room Manager Services

  Background:  Post Services
    Given I request POST "services" with:
      """
          {
            "hostname": "10.28.124.134",
            "username": "Administrator",
            "password": "ABC123}@",
            "deleteLockTime": 10
          }
      """

    And With the following headers:
      | Content-type | application/json |
    When I execute the request
      And I stored the "_id" of the response [Services1]
    Then I expect status code 200

  @crud @delete_service
  Scenario: update a Service when was created
    Given I request PUT "services/Services1" with:
       """
          {
            "username": "Administrator",
            "password": "ABC123}@"
            "deleteLockTime": 11
           }
       """
    When I execute the request
    Then I expect status code 200
      And I verify the expected schema for "services"

    @delete_service @crud
  Scenario: update a Service when was created and do not change value
    Given I request PUT "services/Services1" with:
    """{
         "username": "Administrator",
         "password": "ABC123}@",
         "deleteLockTime": 25
    }
    """
    When I execute the request
    Then I expect status code 200
      And I verify the expected schema for "services"

  @delete_service
  Scenario Outline:Negative combinations for services scenarios
    Given I request PUT "services" with:
      """
           {
            "username": <user>,
            "password": <pasword>,
            "deleteLockTime": <time>
           }
      """

      And With the following headers:
      | Content-type | application/json |
    When I execute the request
    Then I expect status code <codes>

    Examples:negative
      | user              | pasword   | time | codes |
      | "Administrator12" | "ABC123}" | "10" | 400   |
      |                   |           |      | 400   |
      | "Administrator12" | "ABC123}" | 10   | 400   |
      | "Administrator12" | ABC123}   | "10" | 400   |
      | Administrator12   | "ABC123}" | "10" | 400   |
      | Administrator12   | ABC123}   | 10   | 400   |
      |                   | ABC123}   | 10   | 400   |
      | Administrator12   |           | 10   | 400   |
      | Administrator12   | ABC123}   |      | 400   |
      |                   |           | 10   | 400   |
      |                   |           | "10" | 400   |



