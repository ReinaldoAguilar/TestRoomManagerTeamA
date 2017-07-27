class Put
  def self.call_and_return_response(client, method, json, workspace)
    end_point = "/my/workspaces/#{workspace}"
    http_request = client.get_request(method, end_point)
    http_request.body = json
    http_response = client.execute_request(client.get_connection, http_request)
    workspaces = Workspaces.get_parser_workspaces(http_response.body)
    return http_response, workspaces
  end
end

