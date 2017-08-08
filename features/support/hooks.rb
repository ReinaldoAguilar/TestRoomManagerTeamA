Before('@exchange') do
  Conexion_Api_Factory.build(:exchange)
  p "exchange --->#{$port}"
end

Before('@room') do
  Conexion_Api_Factory.build(:room)
  p "room---> #{$port}"
end