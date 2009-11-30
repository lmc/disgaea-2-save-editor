class BaseData::Int32 < BaseData::Base
  def self.struct_size; 4; end
  
  def disassemble(file_data)
    self.value = convert(raw_from_file(file_data))
  end
  
  def convert(raw_data)
    #FIXME: uint64 inherits this and we're not taking any precautions for it
    chr = is_a?(BaseData::Uint32) ? 'L' : 'l'
    raw_data.unpack(chr).first
  end
end