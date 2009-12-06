class BaseData::Uint64 < BaseData::Uint32
  def self.struct_size; 8; end
  def self.limits; -18446744073709551616..18446744073709551615; end
  
  def pack_arg
    'Q'
  end
end