@api_test
Feature: Workspace Smoke Tests and Functionality Test

  @smoke @workspace @get
  Scenario: Workspace Get
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request to WorkspacesGet endpoint
    Then I expect Status code 200 for the SmokeTest

  @smoke @workspace @post
  Scenario: Workspace Create
    Given I have set a connection to pivotal_tracker API service
    When I send a POST request to WorkspacesPost endpoint with the name NewWorkspace
    Then I expect Status code 200 for the POST request to WorkspacePOST


  @smoke @workspace @delete
  Scenario: Workspace Delete
    Given I have set a connection to pivotal_tracker API service
        And I have created a "TestWorkspace" workspace
    When I send a DELETE request to WorkspacesDelete endpoint
    Then I expect Status code 204 for the SmokeTest

  @functionality @workspace @post
  Scenario: Workspace functionality create
      Given I have set a connection to pivotal_tracker API service
      When I send a POST request to WorkspacesPost endpoint with the name NewWorkspace
      Then I expect Status code 200 for the POST request to WorkspacePOST
         And I expect that response has the attribute name equal to NewWorkspace
         And I expect that the response attribute id be an integer
         And I expect that the response attribute name be an string
         And I expect that the response attribute person_id be an integer
         And I expect that the response attribute project_ids equal to Array
         And I expect that the response attribute project_ids equal to nil

  @functionality @workspace @post
  Scenario: Workspace functionality create workspaces with name 25 characters
     Given I have set a connection to pivotal_tracker API service
     When I send a POST request to WorkspacesPost endpoint with a name has 25 characters
     Then I expect Status code 200 for the POST request to WorkspacePOST
         And I expect that response has the attribute name have 25 characters

  @functionality1 @workspace @post
   Scenario: Workspace functionality create workspaces with name 1 characters min
     Given I have set a connection to pivotal_tracker API service
     When I send a POST request to WorkspacesPost endpoint with a name has 1 characters
     Then I expect Status code 200 for the POST request to WorkspacePOST
         And I expect that response has the attribute name have 1 characters