class BaseData::Int8 < BaseData::Base
  def self.struct_size; 1; end
  
  def disassemble(file_data)
    self.value = convert(raw_from_file(file_data))
  end
  
  def convert(raw_data)
    raw_data.ord
  end
  
  def as_raw
    self.value.chr
  end
  
end