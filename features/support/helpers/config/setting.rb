require 'yaml'

class Setting

  attr_accessor :name, :dir_path, :values

  DEFAULT_FILE_PATH = File.expand_path('../../../../env.yaml', File.dirname(__FILE__))
  # Get data from yaml file.
  def initialize(file_path = DEFAULT_FILE_PATH)
    @dir_path = File.dirname(File.expand_path(file_path))
    File.open(file_path, 'r') do |file|
      # noinspection RubyResolve
      content = YAML.load(file) || {}
      # Name of section to select.
      @name = 'app'
      @values = content[@name] || content
    end
    self
  end

   #   account_name = config.get('account/name')
  def get(path = '', values = @values)
    # Path comes in as 'foo/bar/baz'
    # whose tokens refer to nested sections in the yaml.
    node_names = path.split('/')
    node = values
    until node_names.empty?
      node = case
               when node.respond_to?(:each_pair)
                 node_name = node_names.shift
                 unless node.include?(node_name)
                   message = 'Cannot find  %s for path %s' % [node_name, path]
                   raise ArgumentError.new(message)
                 end
                 node[node_name]
               else
                 raise NotImplementedError.new(node.class)
             end
    end
    node
  end

end