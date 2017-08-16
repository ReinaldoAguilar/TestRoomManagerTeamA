
Then(/^I expect status code (\d+)$/) do |http_code|
  expect(@http_response.code.to_s).to eql(http_code.to_s)
end

And(/^I expect equivalence$/) do
  # JsonSpec.include_json
  p "de acaaa"
  p value =JSON.parse(@http_response.body)


  expect( value[0]).to include( "hostname" => "10.28.124.134","username"=>"Administrator")

end

And(/^I verify data autogenerated in response is:$/) do |tag_include|
  @expected_response = Utils.build_new_json_equals(@last_json, @expected_response, tag_include.raw)
end

And(/^I verify that response built with request data is equal to JSON response$/) do
  last_json.should be_json_eql((@expected_response).to_json).excluding("__v")
end

And(/^The response header should exist$/) do |tag_include|
  tag_include.raw.each do |key,value|
    expect(@http_response[key]).to include(value)
  end

end

#Autor: Fernando Ojeda Uribe
And(/^I verify that values used from request are included in response$/) do
  value = @http_response.body
  Validation.validation_request(value)
end

#Autor: Fernando Ojeda Uribe
Then(/^I verify the data received is according previous POST response$/) do
  puts "Values verified:"
  puts value_response = @http_response.body
  puts resutl_validation = Validation.validation_requestGet(value_response)
end

# norman
And(/^I verify the expected schema for "([^"]*)"$/) do |service_name|

  schema_path= Utils.getPathEschema service_name
  expect(JSON::Validator.validate!(schema_path, @http_response.body)).equal?true

end
# norman
And(/^I verify the data in data base "([^"]*)"$/) do |value1|

  id_value=Utils.getAttribute_value_from_reponse(@http_response.body,"_id",value1)
  value_response= JSON.parse(@expected_response)
  value_to_eval =DataHelper.find_elemnt_DB(value1,id_value,value_response)
  expect(value_response).to include(value_to_eval)
end



