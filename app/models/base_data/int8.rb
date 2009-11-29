class BaseData::Int8 < BaseData::Base
  def self.struct_size; 1; end
  
  def disassemble(file_data)
    self.value = raw_from_file(file_data).ord
  end
end