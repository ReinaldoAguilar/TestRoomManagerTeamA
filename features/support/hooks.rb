
Before('@exchange') do
  # Conexion_Api_Factory.build(:exchange)
  Conexion_Api_Factory_Enum.factory_connection("exchange")
  $type ="exchange"
end

Before('@room') do
  # Conexion_Api_Factory.build(:room)
  Conexion_Api_Factory_Enum.factory_connection("room")
  $type ="room"
end

After('@delete_service') do
  name = $name
  if name.include?("Service")
    name_value = "%s" % [$name]
    endpoint = Utils.builEndpoint("services/#{name_value}")
    @http_request = ApiRestClient.get_request("DELETE", endpoint)
    @http_response = ApiRestClient.execute_request(@http_request)
  elsif name.include?("Meeting")
    endpoint = Utils.builEndpoint("meetings/#{name_value}")
    @http_request = ApiRestClient.get_request("DELETE", endpoint)
    @http_response = ApiRestClient.execute_request(@http_request)
  end


end
Before('@delete_suscription') do
   Mongo_client.initialize
   Mongo_client.drop('subscriptions')
   Mongo_client.close_connection
end

#exchange hooks
Before('@crate_subscription_exchange') do
  # json =
  # ApiRestClient.get_request('POST', "subscriptions")
  # ApiRestClient.body(@http_request, json)
  # ApiRestClient.execute_request(@http_request)
  steps %Q{
             Given I request POST "subscriptions" with:
               """
                  {
                    "host": "#{URI.parse($base_url).host}",
                    "port": #{$port},
                    "notificationUrl": "/api/v1/notifications"
                  }
               """
              And With the following headers:
              | Content-type | application/json |
             When I execute the request
        }
end