#FIXME: This is going to break once we hit Disgaea-huge values
class BaseData::Uint64 < BaseData::Uint32
  def self.struct_size; 8; end
end