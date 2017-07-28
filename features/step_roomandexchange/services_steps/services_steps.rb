

Given(/^I request (?:POST) "([^"]*)" with:$/) do |endpoint, table|
  # table is a table.hashes.keys # => [:name, :project_test]
  @http_response = ApiRestClient.post(endpoint, table.rows_hash)
end

When(/^I request GET "([^"]*)"$/) do |endpoint|
  require_relative '../../../features/support/helpers/rest_client/api_rest_client'
  include ApiRestClient
  ApiRestClient.setting
  @http_response = ApiRestClient.get_request(endpoint)
end