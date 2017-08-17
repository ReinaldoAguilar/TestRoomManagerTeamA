@room @crate_subscription_exchange
Feature: ffjolaa

  Background: : Post Services
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

  @delete_service
  Scenario Outline:Negative combinations for services scenarios
    Given I request POST "services" with:
      """
           {
            "hostname": <host>,
            "username": <user>,
            "password": <pasword>,
            "deleteLockTime": <time>
           }
      """

    And With the following headers:
      | Content-type | application/json |
    When I execute the request
    Then I expect status code <codes>

    Examples:negative combination
      | host             | user             | pasword    | time  | codes |
      | "10.28.124.134"  | "Administrator " | "ABC123}"  | 10    | 409   |
      | 10.28.124.134    | "Administrator " | "ABC123}"  | 10    | 400   |
      |                  |                  |            |       | 400   |
      | 10.28.124.134    | Administrator    | ABC123}    | 10    | 400   |
      |                  | Administrator    | ABC123}    | 10    | 400   |
      | 10.28.124.134    |                  | ABC123}    | 10    | 400   |
      | 10.28.124.134    | Administrator    |            | 10    | 400   |
      | 10.28.124.134    | Administrator    | ABC123}    |       | 400   |
      |                  |                  | ABC123}    | 10    | 400   |
      |                  | Administrator    |            | 10    | 400   |
      |                  | Administrator    | ABC123}    |       | 400   |
      |                  | Administrator    | ABC123}    |       | 400   |
      | 10.28.124.134    |                  |            | 10    | 400   |
      | 10.28.124.134    |                  | ABC123}    |       | 400   |
      | 10.28.124.134    | Administrator    |            |       | 400   |
      |                  |                  |            | 10    | 400   |
      |                  |                  | ABC123}    |       | 400   |
      |                  | Administrator    |            |       | 400   |
      | 10.28.124.134    |                  |            |       | 400   |
      |                  |                  |            |       | 400   |
      | ""               | ""               | ""         | ""    | 400   |


      | "10.28.124.134"  | "Administrator " | "ABC123}"  | "10"  | 400   |
      |                  | "Administrator"  | "ABC123}"  | "10"  | 400   |
      | "10.28.124.134"  |                  | " ABC123}" | "10"  | 400   |
      | " 10.28.124.134" | "Administrator"  |            | "10"  | 400   |
      | "10.28.124.134"  | "Administrator"  | "ABC123}"  |       | 400   |
      |                  |                  | "ABC123}"  | "10"  | 400   |
      |                  | "Administrator"  |            | "10 " | 400   |
      |                  | "Administrator"  | "ABC123}"  |       | 400   |
      |                  | "Administrator"  | "ABC123}"  |       | 400   |
      | "10.28.124.134"  |                  |            | "10"  | 400   |
      | "10.28.124.134"  |                  | "ABC123}"  |       | 400   |
      | "10.28.124.134"  | " Administrator" |            |       | 400   |
      |                  |                  |            | "10"  | 400   |
      |                  |                  | "ABC123}"  |       | 400   |
      |                  | "Administrator"  |            |       | 400   |
      | "10.28.124.134"  |                  |            |       | 400   |


      | ""               | "Administrator"  | "ABC123}"  | "10"  | 400   |
      | "10.28.124.134"  | ""               | " ABC123}" | "10"  | 400   |
      | " 10.28.124.134" | "Administrator"  | ""         | "10"  | 400   |
      | "10.28.124.134"  | "Administrator"  | "ABC123}"  |       | 400   |
      | ""               | ""               | "ABC123}"  | "10"  | 400   |
      | ""               | "Administrator"  |            | "10 " | 400   |
      |                  | "Administrator"  | "ABC123}"  |       | 400   |
      | ""               | "Administrator"  | "ABC123}"  |       | 400   |
      | "10.28.124.134"  | ""               | ""         | "10"  | 400   |
      | "10.28.124.134"  | ""               | "ABC123}"  |       | 400   |
      | "10.28.124.134"  | " Administrator" | ""         | ""    | 400   |
      | ""               | ""               | ""         | "10"  | 400   |
      | ""               | ""               | "ABC123}"  |       | 400   |
      | ""               | "Administrator"  | ""         | ""    | 400   |
      | "10.28.124.134"  | ""               | ""         | ""    | 400   |








