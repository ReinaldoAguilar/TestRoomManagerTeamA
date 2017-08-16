@room
Feature: room Services a post created

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

  @crud @delete_service
  Scenario: create a Services with the same hostname,username,password,delete locktime
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
    Then I expect status code 409

  @delete_service
  Scenario: create a Services without password
    Given I request POST "services" with:
      """
          {
            "hostname": "10.28.124.134",
            "username": "Administrator",
            "password": "",
            "deleteLockTime": 10
           }
        """

    And With the following headers:
      | Content-type | application/json |
    When I execute the request
    Then I expect status code 400

   @delete_service
  Scenario: create a Services without username
    Given I request POST "services" with:
      """
          {
            "hostname": "10.28.124.134",
            "username": "",
            "password": "ABC123}",
            "deleteLockTime": 10
           }
        """

    And With the following headers:
      | Content-type | application/json |
    When I execute the request
    Then I expect status code 400

  @delete_service
  Scenario: create a Services without hostname
    Given I request POST "services" with:
      """
          {
            "hostname": "",
            "username": "Administrator",
            "password": "ABC123}",
            "deleteLockTime": 10
           }
        """

    And With the following headers:
      | Content-type | application/json |
    When I execute the request
    Then I expect status code 400

  @delete_service
  Scenario: create a Services without password,username
    Given I request POST "services" with:
      """
          {
            "hostname": "10.28.124.134",
            "username": "",
            "password": "",
            "deleteLockTime": 10
           }
        """

    And With the following headers:
      | Content-type | application/json |
    When I execute the request
    Then I expect status code 400

  @delete_service
  Scenario: create a Services without hostname,username
    Given I request POST "services" with:
      """
          {
            "hostname": "",
            "username": "",
            "password": "ABC123",
            "deleteLockTime": 10
           }
        """

    And With the following headers:
      | Content-type | application/json |
    When I execute the request
    Then I expect status code 400
  @delete_service
  Scenario: create a Services without hostname,password
    Given I request POST "services" with:
      """
          {
            "hostname": "",
            "username": "Administrator",
            "password": "",
            "deleteLockTime": 10
           }
        """

    And With the following headers:
      | Content-type | application/json |
    When I execute the request
    Then I expect status code 400
  @delete_service
  Scenario: create a Services without hostname,password
    Given I request POST "services" with:
      """
          {
            "hostname": ,
            "username": ,
            "password": ,
            "deleteLockTime": 10
           }
        """

    And With the following headers:
      | Content-type | application/json |
    When I execute the request
    Then I expect status code 400
