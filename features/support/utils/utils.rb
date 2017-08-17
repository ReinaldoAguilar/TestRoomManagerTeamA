module Utils

  def Utils.getAttribute_value_from_reponse(reponse, key, name)
    $name = name
    @result_value = JSON.parse reponse.gsub('=>', ':')
    $result = @result_value[key]
  end

  def Utils.builEndpoint(endpoint)
    newEndpoint = nil
    endpoint_split = endpoint.to_s.split("/")
    endpoint_split.each do |value|
      if value.eql?($name)
        value_result = $result
        value.to_s.replace (value_result)
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
  def Utils.build_new_json_equals(response, expected, tag_find)
    responsehash = JSON.parse(response)
     @expectedhash = JSON.parse(expected)
    tag_find.each do |value|
      value.each do |entry|
        @expectedhash.store entry, responsehash[entry]
      end
    end
    return @expectedhash
  end
end



