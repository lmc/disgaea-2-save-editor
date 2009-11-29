class BaseData::TimeStamp < BaseData::Base
  def self.struct_size; 4; end
  
  def disassemble(file_data)
    self.value = raw_from_file(file_data)
  end
end