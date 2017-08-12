require 'mongo'

class Mongo_client

  def initialize
    puts $db
    @client = Mongo::Client.new(["#{$urldb}:#{$portdb}"], :database => "#{$db}")
  end
  def drop(data)
    @client[:"#{data}"].delete_many
  end
  def close_connection
    @client.close
  end
end