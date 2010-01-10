#renaming because Ruby is fucking retarded about figuring out what constants we actually want
class BaseData::PlainString < BaseData::Base
  def self.struct_size; 1; end
  
  def disassemble(file_data)
    self.value = raw_from_file(file_data)
  end
  
  #TODO: Limit string lengths when re-assigned
  
  def self.clean_value(string)
    end_pos = string.index("\000") || string.size
    string[0...end_pos]
  end
end