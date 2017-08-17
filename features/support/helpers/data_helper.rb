require 'json/ext'

class DataHelper

  def self.rehash_to_symbol_keys(hash)
    rehash = {}
    hash.each_pair do |key, value|
      rehash[key.to_sym] = value
    end
    rehash
  end
  def self.parse_json(string)
    parser = JSON::Ext::Parser.new(string)
    json = parser.parse
    json
  end

  def self.find_elemnt_DB(value1,id_value,values_post)
    consult_element =Mongo_client.find_list(value1,id_value,values_post)
    return value_to_eval= JSON.parse(consult_element.filter.to_json)
  end
  def self.build_json(json)
    val=json
    hash_value={}
    val.each do|key, value|
      res=value
      if(value.class==String)
        if(value[0]=="$")
          res=eval(value)
        end
      end
      hash_value.store(key, res)
    end
    return hash_value.to_json

  end
end