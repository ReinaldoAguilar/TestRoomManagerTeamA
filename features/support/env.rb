require 'net/http'
require 'openssl'
require 'json_spec/cucumber'
require 'json-schema'
require 'pathname'
require 'yaml'
require 'mongoid'
require 'simple_enum/mongoid'

JsonSpec.directory = File.expand_path("../../support/files/project/version", __FILE__)

def last_json

  @last_json
end

def find_config_file(filename)

  root = Pathname.pwd
  while not root.root?

    root.find do |path|
      if path.file? and path.basename.to_s == filename
        return path.to_s
      end
    end
    root = root.parent
  end

  raise 'Configuration file ' #{filename}' not found!'
end

def load_app_config_file(filename)

  config_file = find_config_file(filename)
  config = YAML.load_file(config_file)
  $app_context = config['room-manager']['rootPath']
  $room_context =config['default_headers']['rootPath']
  $ex_change_context =config['ex-change']['rootPath']

  return config
end

AfterConfiguration do |config|

  Conexion_Api_Factory_Enum.factory_connection("exchange")

  # read config file
  configuration = load_app_config_file('config.yaml')

  #  default
  $exchange_credentials = configuration['default_headers']['exchange_credentials']
  $exchange_calendar = configuration['default_headers']['exchange_calendar']
  $content_type = configuration['default_headers']['content_type']
  $protocol = configuration['default_headers']['protocol']
  $username = configuration['default_headers']['username']
  $userpasword = configuration['default_headers']['userpasword']

  $urldb = configuration['mongodb']['urldb']
  $portdb = configuration['mongodb']['portdb']
  $schema_directory = "#{Dir.pwd}/features/support/resource/schema"
end


