
Then(/^I expect status code (\d+)$/) do |http_code|
  expect(@http_response.code.to_s).to eql(http_code.to_s)
end

And(/^I expect equivalence$/) do
  # JsonSpec.include_json
  p "de acaaa"
  p value =JSON.parse(@http_response.body)


  expect( value[0]).to include( "hostname" => "10.28.124.134","username"=>"Administrator")

end

And(/^I verify that values used from request are included in response$/) do
  value = @http_response.body
  Validation.validation_request(value)
end

Then(/^I verify the data received is according previous POST response$/) do
  puts "Values verified:"
  puts value_response = @http_response.body
  puts resutl_validation = Validation.validation_requestGet(value_response)
end

And(/^I verify the expected schema for "([^"]*)"$/) do |service_name|
  schema_path= Utils.getPathEschema service_name
  expect(JSON::Validator.validate!(schema_path, @http_response.body,)).equal?true


end






And(/^I verify equivalence with previous response saved$/) do
  value= DataHelper.equivalence_response @http_response.body
  puts hola=JSON.parse(@http_response.body)
  puts valu = JSON.parse(@http_response.body)
  expect( valu[DataHelper.found_id(hola)]).to include( value)
end