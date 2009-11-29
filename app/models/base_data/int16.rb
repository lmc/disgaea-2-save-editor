class BaseData::Int16 < BaseData::Base
  def self.struct_size; 2; end
  
  def disassemble(file_data)
    chr = is_a?(BaseData::Uint16) ? 'S' : 's'
    self.value = raw_from_file(file_data).unpack(chr).first #FIXME: should be unpacking as signed short
  end
end