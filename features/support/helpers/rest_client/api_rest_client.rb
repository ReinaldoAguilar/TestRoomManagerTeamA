#Add the library for HTTP
require 'net/http'
require 'openssl'

require_relative '../../../support/helpers/config/setting'
require_relative '../data_helper'
require_relative 'connection'

module ApiRestClient

  include Connection
  def joinUrl(url)
    url =  Connection.base_url + url
    uri = URI.parse(url)
  end

  def ApiRestClient.get(url)

    request = Net::HTTP::Get.new(joinUrl(url))
    # request.basic_auth(@account_name, @password)
    request.add_field('Exchange_Credentials', @exchange_credentials)
    request.add_field('Exchange_Calendar', @Exchange_Calendar)
    # request.add_field('X-TrackerToken', @token)
    # request.add_field('content-type', 'application/json')
    # request.add_field('accept', 'application/json')

    http = Connection.get_connection
    response = http.request(request)
    return response
  end

  def ApiRestClient.post(url, body)
    request = nil
    request = Net::HTTP::Post.new(joinUrl(url))
    request.set_form_data(body)
    request.add_field('Exchange_Credentials', @exchange_credentials)
    request.add_field('Exchange_Calendar', @Exchange_Calendar)
    http = Connection.get_connection
    response = http.request(request)
    return response
  end

  def ApiRestClient.put(url, body)
    request = Net::HTTP::Put.new(joinUrl(url))
    request.set_form_data(body)
    request.add_field('Exchange_Credentials', @exchange_credentials)
    # request.basic_auth(@account_name, @password)
    # request.add_field('X-TrackerToken', @token)
    request.add_field('content-type', 'application/json')
    # request.add_field('accept', 'application/json')

    http = get_connection
    response = http.request(request)
    return response
  end

  def ApiRestClient.delete(url)
    request = Net::HTTP::Delete.new(joinUrl(url))
    request.add_field('Exchange_Credentials', @exchange_credentials)
    http = Connection.get_connection
    response = http.request(request)
    return response
  end
end