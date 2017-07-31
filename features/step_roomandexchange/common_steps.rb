
Given(/^I have set a connection to pivotal_tracker API service$/) do
  require_relative '../../features/support/helpers/rest_client/api_rest_client'
end

Then(/^I expect Status code (\d+) for the SmokeTest$/) do |http_code|
  p @http_response.code.to_s
  expect(@http_response.code.to_s).to eql(http_code.to_s)
end