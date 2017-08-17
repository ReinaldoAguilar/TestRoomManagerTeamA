module Room

  def Room.initialize

    # read config file
    configuration = load_app_config_file('config.yaml')

    $base_url = configuration['room-manager']['url']
    $time_out = configuration['room-manager']['time_out']
    $port = configuration['room-manager']['port']
    $urlenpoint = configuration['room-manager']['urlenpoint']
    $hostname_domain = configuration['room-manager']['hostname_domain']
    $db  = configuration['room-manager']['db']
    $ip_hostname  = configuration['room-manager']['hostname']
  end
end