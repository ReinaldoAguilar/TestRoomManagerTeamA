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
    # parser = JSON::Ext::Parser.new(string)
    # json = parser.parse
    # json
  end

  def self.save_response(response)

    @value_response = JSON.parse(response)
    @id_response=  @value_response["_id"]

  end
  # compare with previos response
  def self.equivalence_response(response)
    "compare response"
    value_reponse2 = JSON.parse(response)
    create_comparetor={}
    index=found_id(value_reponse2)
    value_reponse2[index].each do |key,value|

      value==@value_response[key] ?create_comparetor.store(key,value):"hhhh"
    end
    return create_comparetor,index

  end
  # found index number
  def self.found_id(response)
    number=0
    response.each.with_index do |val,index|
      val
      number= val.has_value?(@id_response)? index :0
    end
    return number
  end
  def self.find_elemnt_DB(value1,id_value,values_post)


    consult_element =Mongo_client.find_list(value1,id_value,values_post)

    return value_to_eval= JSON.parse(cursor.filter.to_json)


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