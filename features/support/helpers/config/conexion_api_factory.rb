module Conexion_Api_Factory
  def Conexion_Api_Factory.build(apitest)
    case apitest
      when :exchange
        Exchange.new
      when :room
        Room.new
    end
  end
end