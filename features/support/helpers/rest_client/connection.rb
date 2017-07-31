module Connection
  attr_accessor :base_url,:time_out ,:exchange_credentials ,:hostname_ip ,:hostname_domain
  def Connection.setting
    @config = Setting.new
    @base_url = @config.get('url')
    @time_out = @config.get('time_out')
    @exchange_credentials = @config.get('exchange_credentials')
    @hostname_ip = @config.get('hostname_ip')
    @hostname_domain = @config.get('hostname_domain')

    nil
  end

  #
  # This method set up a connection
  #
  def Connection.get_connection
    uri = URI.parse(@base_url)
    @hostname ='hostname='+ uri.host
    http_connection = nil
    http_connection = Net::HTTP.new(uri.host, uri.port)
    http_connection.read_timeout = @time_out
    http_connection
  end
end