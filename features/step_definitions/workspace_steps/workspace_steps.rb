Given(/^I have created a "(.*)" workspace$/) do |name_workspace|
  require_relative '../../../features/support/requests/Workspaces/workspaces_post'
  json = "{ \"name\" : \"#{name_workspace}\"}"
  @http_response, @workspace = WorkspacesPost.call_and_return_response(@client, 'POST', json)
end

When(/^I send a (GET) request to services endpoint$/) do |method|
  require_relative '../../../features/support/requests/Workspaces/workspaces_get'
  @http_response = WorkspacesGet.call_and_return_response(@client, method)
end

When(/^I send a (POST) request to WorkspacesPost endpoint with the (.*) (.*)$/) do |method, attribute, name|
  require_relative '../../../features/support/requests/Workspaces/workspaces_post'
  json = "{ \"#{attribute}\" : \"#{name}\"}"
  @http_response, @workspace = WorkspacesPost.call_and_return_response(@client, method, json)
end

When(/^I send a (PUT) request to WorkspacesPut endpoint add the (.*) before created$/) do |method, attribute|
  require_relative '../../../features/support/requests/Workspaces/workspaces_put'
  json = "{ \"#{attribute}\" : [#{@project_name.id}]}"
  @http_response, @workspace = WorkspacesPut.call_and_return_response(@client, method, json, @workspace.id)
end

When(/^I send a (DELETE) request to WorkspacesDelete endpoint$/) do |method|
  require_relative '../../../features/support/requests/Workspaces/workspaces_delete'
  @http_response = WorkspacesDelete.call_and_return_response(@client, method, @workspace.id)
end

Then(/^I expect Status code (\d+) for the POST request to WorkspacePOST$/) do |http_code|
  require_relative '../../../features/support/requests/Workspaces/workspaces_delete'
  expect(@http_response.code.to_s).to eql(http_code.to_s)
  WorkspacesDelete.call_and_return_response(@client, 'DELETE', @workspace.id)
end

Then(/^I expect Status code (\d+) for the PUT request to WorkspacePUT$/) do |http_code|
  require_relative '../../../features/support/requests/Workspaces/workspaces_delete'
  require_relative '../../../features/support/requests/Projects/projects_delete'
  expect(@http_response.code.to_s).to eql(http_code.to_s)
  WorkspacesDelete.call_and_return_response(@client, 'DELETE', @workspace.id)
  ProjectsDelete.call_and_return_response(@client, 'DELETE', @project_name.id)
end

Then(/^I expect that response has the attribute name equal to (.*)$/) do |name|
  require_relative '../../../features/support/requests/Workspaces/workspaces_get'
  expect(@workspace.name.to_s).to eql(name.to_s)
end

Then(/^I expect that the response attribute id be an integer$/) do
  require_relative '../../../features/support/requests/Workspaces/workspaces_get'
  expect(@workspace.id.kind_of?Integer)
end

Then(/^I expect that the response attribute name be an string$/) do
  require_relative '../../../features/support/requests/Workspaces/workspaces_get'
  expect(@workspace.name.kind_of?String)
end

Then(/^I expect that the response attribute person_id be an integer$/) do
  require_relative '../../../features/support/requests/Workspaces/workspaces_get'
  expect(@workspace.person_id.kind_of?Integer)
end

Then(/^I expect that the response attribute project_ids equal to Array$/) do
  require_relative '../../../features/support/requests/Workspaces/workspaces_get'
  expect(@workspace.project_ids.kind_of?Array)
end

Then(/^I expect that the response attribute project_ids equal to nil$/) do
  require_relative '../../../features/support/requests/Workspaces/workspaces_get'
  expect(@workspace.project_ids.size()).to eql(0)
end

When(/^I expect that the response attribute project_ids equal to count (.*)$/) do |count|
  require_relative '../../../features/support/requests/Workspaces/workspaces_get'
  expect(@workspace.project_ids.size()).to eql(count.to_i)
end

Given(/^I send a POST request to WorkspacesPost endpoint with a name has (\d+) characters$/) do |quantity|
  require_relative '../../../features/support/requests/Workspaces/workspaces_post'
  @name_workspace = 'a' * quantity.to_i
  json = "{ \"name\" : \"#{@name_workspace}\"}"
  @http_response, @workspace = WorkspacesPost.call_and_return_response(@client, 'POST', json)
end

Given(/^I expect that response has the attribute name have (\d+) characters$/) do |quantity|
  expect(@workspace.name.size()).to eql(quantity.to_i)
end