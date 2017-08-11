require 'pathname'
require 'yaml'

  def load_app_config_file(filename )
    config_file = find_config_file(filename)
    config = YAML.load_file(config_file)
    $app_context = config['room-manager']['rootPath']
    $room_context =config['default_headers']['rootPath']
    $ex_change_context =config['ex-change']['rootPath']
    return config
  end

  AfterConfiguration do |config|
    Conexion_Api_Factory.build(:exchange)
    # read config file
    configuration = load_app_config_file('config.yaml')

  #  default
    $exchange_credentials = configuration['default_headers']['exchange_credentials']
    $exchange_calendar = configuration['default_headers']['exchange_calendar']
    $content_type = configuration['default_headers']['content_type']
    $schema_directory = "#{Dir.pwd}/features/support/resource/schema"

  end


