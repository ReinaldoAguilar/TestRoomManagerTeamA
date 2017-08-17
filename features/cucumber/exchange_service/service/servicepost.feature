@exchange @deletebd @create_subscription  @crate_service_room
Feature: Exchange Services

  @functional @delete_services
  Scenario: Create a service with a hostname register
    Given I request POST "services" with:
      """
          {
            "hostname": "server2012dc.arabitpro.local",
            "username": "Administrator",
            "password": "ABC123}@"
           }
        """

    And With the following headers:
      | Content-type | application/json |
    When I execute the request
    And I stored the "_id" of the response [Services1]
    Then I expect status code 409
    And the JSON should be:
      """
          {
            "name": "Conflict value",
             "description": "Conflict with a domain with same name, the domain needs to be unique."
          }
      """
  @functional @delete_services
  Scenario: POST request with an empty json
    Given I request POST "services" with:
          """
           {

           }
           """
    When I execute the request
    Then  I expect status code 400

  Scenario: POST request only setting a valid 'password'

    Given I request POST "services" with:
           """
             {
               "password": "PBC123}@"

             }
            """
    When I execute the request
    Then I expect status code 400

  @functional @delete_services
  Scenario: POST request setting only two parameter

    Given I request POST "services" with:
          """
           {
             "hostname": "server2012dc.arabitpro.local",
             "password": "ABC123}@"
           }
          """
    When I execute the request
    Then I expect status code 400

  @functional @delete_services
  Scenario Outline: Negative combinations for Services scenarios

    Given I request POST "services" with:
         """
         {
         "hostname": <hostname>,
         "username": <user>,
         "password": <password>
         }
         """
    When  I execute the request
    When I execute the request
    Then I expect status code <codes>
    And The response header should exist
      | Content-type | application/json |
    And the JSON should be:
      """
        {
        "name": "<name>",
        "description": "<description>"
        }
      """
    Examples: No special characters in services
      | hostname                       | user            | password   | codes | name                    | description                                |
      | "reinaldoaguilar.local"        | "Administrator" | "ABC123}@" | 400   | ValidationError         | data should NOT have additional properties |
      | "server2012dc.arabitpro.local" | "invalid"       | "ABC123}@" | 400   | InvalidCredentialsError | The credentials entered are not correct    |
      | "server2012dc.arabitpro.local" | "Administrator" | "ABC123}"  | 400   | InvalidCredentialsError | The credentials entered are not correct    |
      | "server2012dc.arabitpro.local" | ""              | "ABC123}@" | 400   | BadRequest              | The username is invalid                    |
      | "server2012dc.arabitpro.local" | "Administrator" | ""         | 400   | BadRequest              | The password is invalid                    |
      | ""                             | "Administrator" | "ABC123}@" | 400   | BadRequest              | The hostname is invalid                    |
      | "server2012dc.arabitpro.local" | -745566         | "ABC123}@" | 400   | SchemaValidation        | The username field will be string          |
      | "server2012dc.arabitpro.local" | "Administrator" | 19876      | 400   | SchemaValidation        | The password field will be string          |
      | 567889990                      | "Administrator" | "ABC123}@" | 400   | SchemaValidation        | data.hostname field will be string         |


