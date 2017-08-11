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
    # json = parser.parse
    json
  end
  def self.save_response(response)
    puts "save response"
    puts @value_response = JSON.parse(response)
    puts @id_response=  @value_response["_id"]

  end

  def self.equivalence_response(response)
    puts "compare response"
    puts value_reponse2 = JSON.parse(response)
    create_comparetor={}
    value_reponse2[found_id(value_reponse2)].each do |key,value|

      value==@value_response[key] ?create_comparetor.store(key,value):"hhhh"
    end
    return create_comparetor

  end

  def self.found_id(response)
    number=0
    response.each.with_index do |val,index|
      puts val
      puts number= val.has_value?(@id_response)? index :0
    end
    number
  end

end