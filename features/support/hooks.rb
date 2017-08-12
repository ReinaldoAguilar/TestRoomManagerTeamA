Before('@exchange') do
  Conexion_Api_Factory.build(:exchange)
  $type ="exchange"
  p "exchange --->#{$port}"
end

Before('@room') do
  Conexion_Api_Factory.build(:room)
  $type ="room"
  p "room---> #{$port}"
end

After('@delete_service') do
  name = StoreVariables.service_name
  if name.include?("Service")
    endpoint = Utils.builEndpoint("services/Services1._id")
    @http_request = ApiRestClient.get_request("DELETE", endpoint)
    @http_response = ApiRestClient.execute_request(@http_request)
  elsif name.include?("Meeting")
    endpoint = Utils.builEndpoint("meetings/Meetings1.id")
    @http_request = ApiRestClient.get_request("DELETE", endpoint)
    @http_response = ApiRestClient.execute_request(@http_request)
  end


end
Before('@delete_suscription') do
  client = Mongo_client.new
  client.drop('subscriptions')
  client.close_connection
end