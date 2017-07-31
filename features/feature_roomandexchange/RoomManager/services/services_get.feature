Feature: Test

  Scenario: Test 3 schema

    Given I have set a connection to pivotal_tracker API service
    When I request GET "services"
    Then I expect Status code 200 for the SmokeTest
    And I  format table schema format

  Scenario: Test
    Given I have set a connection to pivotal_tracker API service
    When I request GET "services"
    Then I expect Status code 200 for the SmokeTest
    And I espect format :
    """
    [
  {
    "_id": "597f4452f179f912c08f32f6",
    "type": "ExchangeServer",
    "name": "Exchange Server 2016",
    "version": "15.1 (Build 30225.42)",
    "hostname": "server2012dc.arabitpro.local",
    "username": "Administrator",
    "deleteLockTime": 10
  }
   ]
    """"""




