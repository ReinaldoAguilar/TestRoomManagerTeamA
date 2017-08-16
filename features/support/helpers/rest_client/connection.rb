module Connection
  #
  # This method set up a connection
  #
  def Connection.get_connection
    http_connection = nil
    uri = URI.parse($base_url)
    http_connection = Net::HTTP.new(uri.host, $port )
    # http_connection.use_ssl = true
    # http_connection.verify_mode = OpenSSL::SSL::VERIFY_NONE
    http_connection.read_timeout = $time_out
    return http_connection
  end
end