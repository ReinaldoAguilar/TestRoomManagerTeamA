Before('@exchange') do
  Conexion_Api_Factory.build(:exchange)
  $type ="exchange"
  p "exchange --->#{$port}"
end

Before('@room') do
  Conexion_Api_Factory.build(:room)
  $type ="room"
  p "room---> #{$port}"
end