Feature: Delete Service

  @exchange
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
      And I stored the reference of a services as: [Services1]
    Then I expect status code 200
     #schema
     #equals
     #equivalents
     #dependency
      And I verify that values used from request are included in response

  Scenario: Delete Service
    Given I request DELETE "services/Services1._id"
    When I execute the request
    Then I expect status code 200