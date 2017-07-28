Feature: Test

  Scenario: Test
    Given I have set a connection to pivotal_tracker API service
    When I request GET "/services?hostname=server2012dc.arabitpro.local"
    Then I expect Status code 200 for the SmokeTest
