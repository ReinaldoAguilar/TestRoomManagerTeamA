Feature: Meeting

  @exchange
  Scenario: Get Service
    Given I request POST "services" with:
      """
          {
            "hostname": "10.28.124.134",
            "username": "Administrator",
            "password": "ABC123}"
           }
        """
    When I execute the request
    And The name of the service is: [Services1]
    And I expect status code 200