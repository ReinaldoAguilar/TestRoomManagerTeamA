require_relative 'base_class_for_data_classes'

class Workspaces < BaseClassForDataClasses
  attr_accessor :id,
                :kind,
                :name,
                :person_id,
                :project_ids
  def initialize (values = {})
    super values
  end
  def self.get_parser_workspaces(string)
    object_json = DataHelper.parse_json(string)
    result = DataHelper.rehash_to_symbol_keys(object_json)
    workspaces = self.new(result)
    workspaces
  end

end
