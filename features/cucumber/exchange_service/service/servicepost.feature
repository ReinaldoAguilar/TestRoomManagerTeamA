@exchange
Feature: Exchange Services

  Scenario: Post Services
    Given I request POST "services" with:
      """
          {
            "hostname": "10.28.124.134",
            "username": "Administrator",
            "password": "ABC123}"
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
            "name": "RequestNetBIOSDomainError",
             "description": "Can't connect to LDAP server, please ensure the NetBIOS domain is correct and your computer belongs to the domain"
          }
      """


