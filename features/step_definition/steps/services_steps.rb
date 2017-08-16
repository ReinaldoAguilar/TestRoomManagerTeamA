

Given(/^I request (POST|PUT) "([^"]*)" with:$/) do |method, service_request, json|

  @http_request = ApiRestClient.get_request(method, Utils.builEndpoint(service_request))
   # val=JSON.parse(json.to_json)
   # volo =JSON.parse(val.gsub('=>', ':'))
   # result= DataHelper.build_json(volo)
  ApiRestClient.body(@http_request, json)
  @expected_response = json

  $value=method

end

Given(/^I request (GET) "([^"]*)"$/) do |method, endpoint|
  @http_request = ApiRestClient.get_request(method, Utils.builEndpoint(endpoint))
  $value=method
end

Given(/^I request (DELETE) "([^"]*)"$/) do |method, endpoint|
  @http_request = ApiRestClient.get_request(method, Utils.builEndpoint(endpoint))
  $value=method
end

And(/^I execute the request$/) do
  @http_response = ApiRestClient.execute_request(@http_request)
  @last_json = @http_response.body
end

And(/^With the following headers:$/) do |table|

  ApiRestClient.add_headers(@http_request, table.rows_hash)
end

And(/^I stored the reference of a services as: \[([^"]*)\]$/) do |service_name|
  StoreVariables.store_services_datas(service_name, @http_response.body)
end

Given(/^I request (GET) "([^"]*)" with data :$/) do |method, endpoint, table|
  # table is a table.hashes.keys # => [:start, :2017-10-22T00%3A00%3A00.000Z]
  @http_request = ApiRestClient.get_request(method, Utils.builEndpoitGet(endpoint, table.rows_hash))
  $value=method
end


And(/^I verify that values used from request are included in response "([^"]*)"$/) do |tag|
  @last_json.should be_json_eql(Utils.build_new_json_equals(@last_json, @expected_response, tag).to_json).excluding("__v")
end
# norman
And(/^I save response$/) do
  DataHelper.save_response(@http_response.body)

end

And(/^I stored the "([^"]*)" of the response \[([^"]*)\]$/) do |id, name|
  Utils.getAttribute_value_from_reponse(@http_response.body,id, name)
end



