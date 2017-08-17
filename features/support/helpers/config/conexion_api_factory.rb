class Conexion_Api_Factory

  include Mongoid::Document
  include SimpleEnum::Mongoid
  as_enum :api, :exchange => 'Exchange', :room => 'Room'

end

module Conexion_Api_Factory_Enum

  def Conexion_Api_Factory_Enum.factory_connection(apitest)

    api_service = Conexion_Api_Factory.new(:api => apitest)
    api_service.api_cd.constantize.initialize
  end
end