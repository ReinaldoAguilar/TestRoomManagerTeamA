
module StoreVariables

  def StoreVariables.store_services_datas(service_name, response_values)
    @service_name = service_name
    @response_values = response_values
  end

  def StoreVariables.getAttribute_value(key)
    @result_value = JSON.parse @response_values.gsub('=>', ':')
    result = @result_value[key]
    return result
  end

  def StoreVariables.service_name
     return @service_name
  end

end
