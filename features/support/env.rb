require 'net/http'
require 'openssl'
require 'json_spec/cucumber'
require 'json-schema'
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


