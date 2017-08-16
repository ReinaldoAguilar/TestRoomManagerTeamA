module Exchange
  def Exchange.initialize
    configuration = load_app_config_file('config.yaml')
    $base_url = configuration['ex-change']['url']
    $time_out = configuration['ex-change']['time_out']
    $port = configuration['ex-change']['port']
    $urlenpoint = configuration['ex-change']['urlenpoint']
    $hostname_domain = configuration['ex-change']['hostname_domain']
    $db  = configuration['ex-change']['db']
  end
end