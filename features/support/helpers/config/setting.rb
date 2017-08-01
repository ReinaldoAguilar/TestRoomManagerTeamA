require 'pathname'
require 'yaml'

  def load_app_config_file(filename )
    config_file = find_config_file(filename)
    config = YAML.load_file(config_file)
    $app_context = config['app']['rootPath']
    return config
  end

  AfterConfiguration do |config|
    # read config file
    configuration = load_app_config_file('config.yaml')
    # Load application configuration parameters
    $base_url = configuration['app']['url']
    $time_out = configuration['app']['time_out']
    $port = configuration['app']['port']
    $urlenpoint = configuration['app']['urlenpoint']
    $hostname_domain = configuration['app']['hostname_domain']
  end


