require_relative '../../../features/support/utils/store_variables'

class Utils

  include StoreVariables

  def getKeyObjectFromListByName(varName, key)
    name_variable = StoreVariables.getName
    name_variable.eql?(varName)
    value_result = StoreVariables.getAttribute_value(key)
    return value_result
  end

  def builEndpoint(endpoint)
    point = endpoint.to_s.split("/")
    point.each do |value|
      if /[(.*?)]/.match(value)
        parametersParts = value.to_s.split("\.", 2)
        replaceParameter = getKeyObjectFromListByName(parametersParts[0],
                                                      parametersParts[1])
        value.to_s.replace (replaceParameter.to_s)
      end
      @newEndpoint = @newEndpoint.to_s + value.to_s + "/".to_s
    end
    return @newEndpoint
  end
end

