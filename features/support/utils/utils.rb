
module Utils

  def Utils.getValueFromService(varName, key)
    name_variable = StoreVariables.getName
    if name_variable.eql?(varName)
      value_result = StoreVariables.getAttribute_value(key)
    end
    return value_result
  end

  def Utils.builEndpoint(endpoint)
    newEndpoint = nil
    endpoint_split = endpoint.to_s.split("/")
    endpoint_split.each do |value|
      if /[(.)]/.match(value)
        value
        services_split = value.to_s.split("\.", 2)
        value_service = getValueFromService(services_split[0],
                                            services_split[1])
        value.to_s.replace (value_service.to_s)
      end
      newEndpoint = newEndpoint.to_s + value.to_s + "/".to_s
      p newEndpoint
    end
    return newEndpoint
  end
end

