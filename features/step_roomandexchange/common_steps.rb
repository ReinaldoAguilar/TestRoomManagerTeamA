require 'rspec'
require 'json'
require 'json-schema'
# require require_relative "../support/requests/roommanager/schema/meeting"

Given(/^I have set a connection to pivotal_tracker API service$/) do
  require_relative '../../features/support/helpers/rest_client/api_rest_client'
end

Then(/^I expect Status code (\d+) for the SmokeTest$/) do |http_code|
  p @http_response.code.to_s
  expect(@http_response.code.to_s).to eql(http_code.to_s)
end

And(/^I espect format :$/) do |http|
  value = @http_response.body
  json = JSON.parse(value)
  rtr = JSON.parse(http)
  # json.to_s == rtr.to_s
  expect(json.to_s).to include(rtr.to_s)
end

And(/^I  format table schema format$/) do
  p @http_response.body
  # p @http_response.body.code
  # p json = JSON.parse(value)

  schema_directory = "#{Dir.pwd}
/features/feature_roomandexchange/RoomManager/schema"
  p schema_path = "#{schema_directory}/RMmeeting.json"
  JSON::Validator.validate(schema_path, @http_response.body)
  # JSON::Validator.validate!(schema_path, value, strict: true)

  # expect(response.status).to eq(200)
  # expect(@http_response).to match_response_schema(:charge)
  # expect(response).to match_json(<<-JSON)
  # p  file = File.open('RMmeeting.json')
  #  p file.read
  # JSON::Validator.validate('RMmeeting.json', '{"a" : 5}')
  # expect(json).to match_response_schema("meeting")
end

And(/^I  format table schema format "([^"]*)"$/) do |data|
  p value =@http_response.body

  schema_directory = "#{Dir.pwd}/features/feature_roomandexchange/RoomManager/schema"
  p schema_path = "#{schema_directory}/#{data}.json"
  JSON::Validator.validate(schema_path, @http_response.body)

  JSON::Validator.fully_validate(schema_path, @http_response.body)
end
