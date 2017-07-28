#Add the library for HTTP
require 'net/http'
require 'openssl'

require_relative '../../../support/helpers/config/setting'
require_relative '../data_helper'

module ApiRestClient

  def ApiRestClient.setting
    @config = Setting.new
    @base_url = @config.get('url')
    @time_out = @config.get('time_out')

    nil
  end
  #
  # This method set up a connection 
  #
  def ApiRestClient.get_connection
      uri = URI.parse(@base_url)
      @hostname ='hostname='+ uri.host
      http_connection = nil
      http_connection = Net::HTTP.new(uri.host, uri.port)
      # http_connection.use_ssl = true
      # http_connection.verify_mode = OpenSSL::SSL::VERIFY_NONE
      http_connection.read_timeout = @time_out
      http_connection
  end

  def ApiRestClient.get_request(url)

    url =  @base_url + url #{@hostname}
    uri = URI.parse(url)
    request = Net::HTTP::Get.new(uri)

    # request.basic_auth(@account_name, @password)
    # request.add_field('X-TrackerToken', @token)
    # request.add_field('content-type', 'application/json')
    # request.add_field('accept', 'application/json')

    http = get_connection
    response = http.request(request)
    return response
  end

  def ApiRestClient.post(url, body)
    request = nil
    url =  @base_url + url
    uri = URI.parse(url)
    request = Net::HTTP::Post.new(uri)
    request.set_form_data(body)

    # request.basic_auth(@account_name, @password)
    # request.add_field('X-TrackerToken', @token)
    # request.add_field('content-type', 'application/json')
    # request.add_field('accept', 'application/json')

    http = get_connection
    response = http.request(request)
    return response
  end

  def ApiRestClient.put(url, body)
    request = nil
    url =  @base_url + url
    uri = URI.parse(url)
    request = Net::HTTP::Put.new(uri)
    request.set_form_data(body)

    # request.basic_auth(@account_name, @password)
    # request.add_field('X-TrackerToken', @token)
    request.add_field('content-type', 'application/json')
    # request.add_field('accept', 'application/json')

    http = get_connection
    response = http.request(request)
    return response
  end

  def ApiRestClient.delete(url)
    request = nil
    url =  @base_url + url
    uri = URI.parse(url)

    request = Net::HTTP::Delete.new(uri)
    http = get_connection
    response = http.request(request)
    return response
  end
end