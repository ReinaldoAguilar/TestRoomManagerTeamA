
module ApiRestClient

  def ApiRestClient.get_request(method, url)
    request = nil
    p $port
    url = "#{$protocol}#{$base_url}:#{$port}/#{$urlenpoint}/#{url}"
    p url
    uri = URI.parse(url)

    case method
      when 'POST'
        request = Net::HTTP::Post.new(uri)
      when 'PUT'
        request = Net::HTTP::Put.new(uri)
      when 'DELETE'
        request = Net::HTTP::Delete.new(uri)
      when 'GET'
        request = Net::HTTP::Get.new(uri)
      else
        puts "The method was not found, insert a correct method"
    end
    return request
  end

  def ApiRestClient.body(request, body)
    request.body = body
  end

  def ApiRestClient.add_headers(request, values)
    values.each do |k,v|
      request.add_field(k,v)
    end
  end

  def ApiRestClient.execute_request(http_request)
    http_connection = Connection.get_connection
    http_connection.request(http_request)
  end

end