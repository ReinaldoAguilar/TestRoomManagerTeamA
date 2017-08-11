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

    schema_path = $value=="GET"? "#{$schema_directory}/#{$type}/#{service_name}.json":"#{$schema_directory}/#{$type}/post#{service_name}.json"
  end

  def Utils.builEndpoitGet(endpoint, values_service)
    newbuilEndPoint = nil
    values_service.each do |k,v|
      newbuilEndPoint = newbuilEndPoint.to_s + k.to_s + "=" + v.to_s + "&"
    end
    newbuilEndPoint1 = endpoint.to_s + "?" + newbuilEndPoint
    return newbuilEndPoint1
  end
  def Utils.build_new_json_equals(response, expected,tag)
    responsehash = JSON.parse response
    expectedhash = JSON.parse expected
    expectedhash.store tag, responsehash[tag]
    expectedhash
  end
end



