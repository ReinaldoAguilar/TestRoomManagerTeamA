When(/^I request Exchange Services (POST|PUT) "([^"]*)" with:$/) do |method, endpoint, table|

  buildEndpoint = Utils.builEndpoint(endpoint)

  p table
  if table.rows_hash.has_key?("port")
    (table.rows_hash).each {|key,value|
      if key.eql?("port")
        table.rows_hash["port"]=value.to_i
      end
    }
  end

  p table.rows_hash
  # table.map_column!(:port){
  #     |port| port.to_i
  # }

   @http_request = ApiRestClient.get_request(method, buildEndpoint)
  ApiRestClient.body(@http_request, table.rows_hash)
  @http_response = ApiRestClient.execute_request(@http_request)

end

And(/^I stored Exchange Services as \[([^"]*)\]$/) do |variableName|
  puts "dfsfsdfsdfsdf?  #{@http_response.body} asfdfs"
  StoreVariables.settings(variableName, @http_response.body)
end

When(/^I request Exchange Services (GET|DELETE) "([^"]*)"$/) do |method, endpoint|
  buildEndpoint = Utils.builEndpoint(endpoint)
  @http_request = ApiRestClient.get_request( method, buildEndpoint)
  @http_response = ApiRestClient.execute_request(@http_request)
  puts @http_response.body
end