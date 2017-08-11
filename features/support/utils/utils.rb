module Utils

  def Utils.getValueFromService(service_name, service_key)
    if service_name.eql?(StoreVariables.service_name)
      value_result = StoreVariables.getAttribute_value(service_key)
    elsif puts "The service name was not found, insert a correct service"
    end
    return value_result

  end

  def Utils.builEndpoint(endpoint)
    newEndpoint = nil
    endpoint_split = endpoint.to_s.split("/")
    endpoint_split.each do |value|
      if /[(.)]/.match(value)
        services_split = value.to_s.split("\.", 2)
        value_service = getValueFromService(services_split[0], services_split[1])

        value.to_s.replace (value_service.to_s)
      end
      newEndpoint = newEndpoint.to_s + value.to_s + "/".to_s
    end
    return newEndpoint
  end

  def Utils.getPathEschema(service_name)

     schema= "#{$schema_directory}/#{$type}/#{service_name}.json"
  end

  def Utils.builEndpoitGet(endpoint, values_service)
    #meetings?start=2017-10-22T00%3A00%3A00.000Z&end=2017-10-22T23%3A59%3A59.000Z
    #start=2017-10-22T00%3A00%3A00.000Z&end=2017-10-22T23%3A59%3A59.000Z&
    newbuilEndPoint = nil
    values_service.each do |k,v|
      newbuilEndPoint = newbuilEndPoint.to_s + k.to_s + "=" + v.to_s + "&"
    end
    newbuilEndPoint1 = endpoint.to_s + "?" + newbuilEndPoint
    return newbuilEndPoint1
  end
end



