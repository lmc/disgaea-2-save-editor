class BaseData::Int16 < BaseData::Base
  def self.struct_size; 2; end
  
  def disassemble(file_data)
    self.value = convert(raw_from_file(file_data))
  end
  
  def convert(raw_data)
    chr = is_a?(BaseData::Uint16) ? 'S' : 's'
    raw_data.unpack(chr).first
  end
end