
module StoreVariables
  def StoreVariables.settings(name, hash_values)
    @name = name
    @hash_values = hash_values
  end
  def StoreVariables.getAttribute_value(key)
    @result_value = JSON.parse @hash_values.gsub('=>', ':')
    result = @result_value[key]
    return result
  end
  def StoreVariables.getName
    @name
  end
end
