class Room

  def initialize
    # read config file
    configuration = load_app_config_file('config.yaml')
    # Load application configuration parameters
    $base_url = configuration['room-manager']['url']
    $time_out = configuration['room-manager']['time_out']
    $port = configuration['room-manager']['port']
    $urlenpoint = configuration['room-manager']['urlenpoint']
    $hostname_domain = configuration['room-manager']['hostname_domain']
    $db  = configuration['room-manager']['db']
  end
end