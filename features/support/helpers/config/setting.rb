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

    # read config file
    configuration = load_app_config_file('config.yaml')
    # Load application configuration parameters
    $base_url = configuration['room-manager']['url']
    $time_out = configuration['room-manager']['time_out']
    $port = configuration['room-manager']['port']
    $urlenpoint = configuration['room-manager']['urlenpoint']
    $hostname_domain = configuration['room-manager']['hostname_domain']

  #  default
    $exchange_credentials = configuration['default_headers']['exchange_credentials']
    $exchange_calendar = configuration['default_headers']['exchange_calendar']
    $content_type = configuration['default_headers']['exchange_calendar']

  # exchange

    $base_url_exchange = configuration['ex-change']['url']
    $time_out_exchange = configuration['ex-change']['time_out']
    $port_exchange = configuration['ex-change']['port']
    $urlenpoint_exchange = configuration['ex-change']['urlenpoint']
    $hostname_domain_exchange = configuration['ex-change']['hostname_domain']

  end


