require 'mongo'

module Mongo_client

  def Mongo_client.initialize
    @client = Mongo::Client.new(["#{$urldb}:#{$portdb}"], :database => "#{$db}")
  end
  def Mongo_client.drop(data)
    @client[:"#{data}"].delete_many
  end
  def Mongo_client.close_connection
    @client.close
  end
end