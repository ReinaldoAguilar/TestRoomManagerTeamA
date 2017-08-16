module Validation

  def Validation.validation_request(response)
    @response_value = JSON.parse(response)
    @value_id = @response_value['_id']
  end

  def Validation.validation_requestGet(response)
    result = nil
    response_getValue = JSON.parse(response)
    @value = response_getValue[0]
    if @value.has_value?(@value_id)
      p result = @response_value.to_a & @value.to_a
    elsif
      puts "The id was not found, try again"
    end
    return result
  end
end