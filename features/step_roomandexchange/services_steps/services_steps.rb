require_relative '../../../features/support/helpers/rest_client/api_rest_client'
require_relative '../../../features/support/helpers/../../../features/support/helpers/rest_client/connection'
include ApiRestClient
include Connection

Given(/^I request POST "([^"]*)" with:$/) do |endpoint,table|
  # table is a table.hashes.keys # => [:name, :project_test]
  ApiRestClient.setting
  @http_response = ApiRestClient.post(endpoint, table.rows_hash)
  puts @http_response.body
end

When(/^I request GET "([^"]*)"$/) do |endpoint|

  Connection.setting
  @http_response = ApiRestClient.get(endpoint)
  puts @http_response.body
end

When(/^I request PUT "([^"]*)" with:$/) do |endpoint, table|
  # table is a table.hashes.keys # => [:username, :Administrator]
  Connection.setting
  @http_response = ApiRestClient.put(endpoint, table.rows_hash)
  puts @http_response.body
end

When(/^I request DELETE "([^"]*)"$/) do |endpoint|
  Connection.setting
  @http_response = ApiRestClient.delete(endpoint)
end