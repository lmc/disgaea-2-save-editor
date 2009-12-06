class BaseData::Uint32 < BaseData::Int32
  def self.limits; -2147483648..2147483647; end
end