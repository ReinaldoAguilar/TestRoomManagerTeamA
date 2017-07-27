class Delete
  def self.call_and_return_response(client, method, workspace_id)
    end_point ="/my/workspaces/#{workspace_id}"
    http_request = client.get_request(method, end_point)
    http_response = client.execute_request(client.get_connection, http_request)
    http_response
  end
end
