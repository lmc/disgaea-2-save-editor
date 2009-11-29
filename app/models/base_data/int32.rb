class BaseData::Int32 < BaseData::Base
  def self.struct_size; 4; end
  
  def disassemble(file_data)
    chr = is_a?(BaseData::Uint32) ? 'L' : 'l'
    self.value = raw_from_file(file_data).unpack(chr).first
  end
end