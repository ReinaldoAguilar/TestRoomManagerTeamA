

When(/^I request (POST|PUT) "([^"]*)" with:$/) do |method, endpoint, table|

  @http_request = ApiRestClient.get_request( method, endpoint)
  ApiRestClient.body(@http_request, table.rows_hash)
  @http_response = ApiRestClient.execute_request(@http_request)
  puts @http_response.body
end

When(/^I request (GET) "([^"]*)"$/) do |method, endpoint|

  @http_request = ApiRestClient.get_request( method, endpoint)
  @http_response = ApiRestClient.execute_request(@http_request)
  puts @http_response.body
end

When(/^I request (DELETE) "([^"]*)"$/) do |method, endpoint|

  @http_request = ApiRestClient.get_request( method, endpoint)
  @http_response = ApiRestClient.execute_request(@http_request)
  puts @http_response.body
end

And(/^With the following headers:$/) do |table|

  ApiRestClient.headers(@http_request, table.rows_hash)
end