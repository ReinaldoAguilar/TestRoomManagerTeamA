

Given(/^I request (POST|PUT) "([^"]*)" with:$/) do |method, service_request, json|

  @http_request = ApiRestClient.get_request(method, Utils.builEndpoint(service_request))
  ApiRestClient.body(@http_request, json)
end

Given(/^I request (GET) "([^"]*)"$/) do |method, endpoint|
  @http_request = ApiRestClient.get_request(method, endpoint)
end

Given(/^I request (DELETE) "([^"]*)"$/) do |method, endpoint|
  @http_request = ApiRestClient.get_request(method, Utils.builEndpoint(endpoint))
end

And(/^I execute the request$/) do
  @http_response = ApiRestClient.execute_request(@http_request)
  @last_json = @http_response.body
end

And(/^With the following headers:$/) do |table|

  ApiRestClient.add_headers(@http_request, table.rows_hash)
end

And(/^The name of the service is: \[([^"]*)\]$/) do |service_name|
  StoreVariables.store_services_datas(service_name, @http_response.body)
end

Given(/^I request (GET) "([^"]*)" with data :$/) do |method, endpoint, table|
  # table is a table.hashes.keys # => [:start, :2017-10-22T00%3A00%3A00.000Z]
  @http_request = ApiRestClient.get_request(method, Utils.builEndpoitGet(endpoint, table.rows_hash))
end