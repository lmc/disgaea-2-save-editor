class BaseData::Int16 < BaseData::Int
  def self.struct_size; 2; end
  def self.limits; 0..65535; end
  
  def disassemble(file_data)
    self.value = convert(raw_from_file(file_data))
  end
  
  def convert(raw_data)
    raw_data.unpack(pack_arg).first
  end
  
  def pack_arg
    is_a?(BaseData::Uint16) ? 'S' : 's'
  end
  
  def as_raw
    [self.value].pack(pack_arg)
  end
end