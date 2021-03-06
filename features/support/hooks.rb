
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
Before('@deletebd') do
  case $type
    when "exchange"
      Conexion_Api_Factory_Enum.factory_connection("room")
      Mongo_client.methoDeleteDatabase
      Conexion_Api_Factory_Enum.factory_connection("exchange")
      Mongo_client.methoDeleteDatabase
    when "room"
      Conexion_Api_Factory_Enum.factory_connection("exchange")
      Mongo_client.methoDeleteDatabase
      Conexion_Api_Factory_Enum.factory_connection("room")
      Mongo_client.methoDeleteDatabase
  end
end

Before('@subscription') do
   Mongo_client.initialize
   Mongo_client.drop('subscriptions')
   Mongo_client.close_connection
end
# Delete rooms
Before('@delete_rooms') do
  Mongo_client.initialize
  Mongo_client.drop('rooms')
  Mongo_client.close_connection
end
Before('@delete_services') do
  Mongo_client.initialize
  Mongo_client.drop('services')
  Mongo_client.close_connection
end

#exchange hooks
Before('@create_subscription') do
  case $type
    when "exchange"
      Conexion_Api_Factory_Enum.factory_connection("room")
      portRoom = $port
      Conexion_Api_Factory_Enum.factory_connection("exchange")
      steps %Q{
             Given I request POST "subscriptions" with:
               """
                  {
                    "host": "#{$base_url}",
                    "port": #{portRoom},
                    "notificationUrl": "/api/v1/notifications"
                  }
               """
              And With the following headers:
              | Content-type | application/json |
             When I execute the request
        }
    when "room"
      portRoom = $port
      Conexion_Api_Factory_Enum.factory_connection("exchange")
      steps %Q{
             Given I request POST "subscriptions" with:
               """
                  {
                    "host": "#{$base_url}",
                    "port": #{portRoom},
                    "notificationUrl": "/api/v1/notifications"
                  }
               """
              And With the following headers:
              | Content-type | application/json |
             When I execute the request
        }
      Conexion_Api_Factory_Enum.factory_connection("room")
  end

end

#room hooks
Before('@crate_service_room') do
  Conexion_Api_Factory_Enum.factory_connection("room")
  steps %Q{
             Given I request POST "services" with:
                """
                  {
                    "hostname": "#{$hostname_domain}",
                    "username": "#{$username}",
                    "password": "#{$userpasword}",
                    "deleteLockTime": 10
                   }
                 """

              And With the following headers:
              | Content-type | application/json |
             When I execute the request
        }
end

