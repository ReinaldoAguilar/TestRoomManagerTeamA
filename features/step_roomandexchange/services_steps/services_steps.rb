

When(/^I request (POST|PUT) "([^"]*)" with:$/) do |method, endpoint, table|

  buildEndpoint = Utils.new.builEndpoint(endpoint)
  @http_request = ApiRestClient.get_request( method, buildEndpoint)
  ApiRestClient.body(@http_request, table.rows_hash)
  @http_response = ApiRestClient.execute_request(@http_request)
  puts @http_response.body
end

When(/^I request (GET) "([^"]*)"$/) do |method, endpoint|

  buildEndpoint = Utils.new.builEndpoint(endpoint)
  @http_request = ApiRestClient.get_request( method, buildEndpoint)
  @http_response = ApiRestClient.execute_request(@http_request)
  puts @http_response.body
end

When(/^I request (DELETE) "([^"]*)"$/) do |method, endpoint|
  buildEndpoint = Utils.new.builEndpoint(endpoint)
  @http_request = ApiRestClient.get_request( method, buildEndpoint)
  @http_response = ApiRestClient.execute_request(@http_request)
  puts @http_response.body
end

And(/^With the following headers:$/) do |table|

  ApiRestClient.headers(@http_request, table.rows_hash)
end

And(/^I stored as \[([^"]*)\]$/) do |variableName|

  puts "dfsfsdfsdfsdf?  #{@http_response.body} asfdfs"
  StoreVariables.settings(variableName, @http_response.body)
end