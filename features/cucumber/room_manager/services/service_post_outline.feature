@room
Feature: ffjolaa

  Scenario: Post Services
    Given I request POST "services" with:
      """
          {
            "hostname": "10.28.124.134",
            "username": "$username",
            "password": "$userpasword",
            "deleteLockTime": 10
           }
        """

    And With the following headers:
      | Content-type | application/json |
    When I execute the request
    And I stored the "_id" of the response [Services1]
    Then I expect status code 200

